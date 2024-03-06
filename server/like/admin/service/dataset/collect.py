from abc import ABC, abstractmethod
from datetime import datetime
from typing import List

import pydantic
import sqlalchemy as sa
from fastapi_pagination.bases import AbstractPage
from fastapi_pagination.ext.databases import paginate

from like.dependencies.database import db
from like.utils.urls import UrlUtil
from like.utils.array import ArrayUtil
from like.models import t_dataset_collection
from like.admin.schemas.dataset import (
    TDatasetCollectionListIn, TDatasetCollectionAddIn, TDatasetCollectionEditIn, TDatasetCollectionOut)


class ITDatasetCollectionService(ABC):
    """【请填写功能名称】抽象类"""

    @abstractmethod
    async def list(self, list_in: TDatasetCollectionListIn) -> AbstractPage[TDatasetCollectionOut]:
        pass

    @abstractmethod
    async def detail(self, id_: int) -> TDatasetCollectionOut:
        pass

    @abstractmethod
    async def add(self, add_in: TDatasetCollectionAddIn):
        pass

    @abstractmethod
    async def edit(self, edit_in: TDatasetCollectionEditIn):
        pass

    @abstractmethod
    async def delete(self, id_: int):
        pass

    @abstractmethod
    async def batch_delete(self, del_in: list):
        pass


class TDatasetCollectionService(ITDatasetCollectionService):
    """【请填写功能名称】实现类"""

    async def list(self, list_in: TDatasetCollectionListIn) -> AbstractPage[TDatasetCollectionOut]:
        """【请填写功能名称】列表"""
        columns = [
            t_dataset_collection,

        ]
        where = []
        if list_in.dataset_name is not None and list_in.dataset_name != "":
            where.append(t_dataset_collection.c.dataset_name.like(f'%{list_in.dataset_name}%'))
        if list_in.dataset_type is not None:
            where.append(t_dataset_collection.c.dataset_type == list_in.dataset_type)
        if list_in.dataset_source is not None and list_in.dataset_source != "":
            where.append(t_dataset_collection.c.dataset_source.like(f'%{list_in.dataset_source}%'))
        if list_in.size is not None and list_in.size != "":
            where.append(t_dataset_collection.c.size == list_in.size)
        if list_in.filepath is not None and list_in.filepath != "":
            where.append(t_dataset_collection.c.filepath.like(f'%{list_in.filepath}%'))
        if list_in.description is not None and list_in.description != "":
            where.append(t_dataset_collection.c.description.like(f'%{list_in.description}%'))
        where.append(t_dataset_collection.c.is_deleted == 0)
        query = sa.select(columns).where(*where) \
            .select_from(
            t_dataset_collection
        ).order_by(t_dataset_collection.c.id.desc())
        res = await paginate(db, query)
        print(res)
        return res

    async def detail(self, id_: int) -> TDatasetCollectionOut:
        """【请填写功能名称】详情"""
        model = await db.fetch_one(
            t_dataset_collection.select().where(
                t_dataset_collection.c.id == id_)
            .limit(1))
        assert model, '数据不存在!'
        res = TDatasetCollectionOut.from_orm(model)
        return res

    async def add(self, add_in: TDatasetCollectionAddIn):
        """【请填写功能名称】新增"""
        await db.execute(t_dataset_collection.insert().values({
            'dataset_name': add_in.dataset_name,
            'dataset_type': add_in.dataset_type,
            'dataset_source': add_in.dataset_source,
            'size': add_in.size,
            'filepath': add_in.filepath,
            'description': add_in.description,
            'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'is_deleted': 0
        }))

    async def edit(self, edit_in: TDatasetCollectionEditIn):
        """【请填写功能名称】编辑"""
        assert await db.fetch_one(
            t_dataset_collection.select().where(
                t_dataset_collection.c.id == edit_in.id)
            .limit(1)), '数据不存在!'
        await db.execute(
            t_dataset_collection.update().where(t_dataset_collection.c.id == edit_in.id).values({
                'dataset_name': edit_in.dataset_name,
                'dataset_type': edit_in.dataset_type,
                'dataset_source': edit_in.dataset_source,
                'size': edit_in.size,
                'filepath': edit_in.filepath,
                'description': edit_in.description,
                'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            }))

    async def batch_delete(self, del_in: list):
        assert await db.fetch_all(
            t_dataset_collection.select().where(
                t_dataset_collection.c.id.in_(del_in))
            .limit(len(del_in))), '数据不存在!'
        await db.execute(
            t_dataset_collection.update().where(t_dataset_collection.c.id.in_(del_in)).values({
                'is_deleted': 1
            }))

    async def delete(self, id_: int):
        """【请填写功能名称】删除"""
        assert await db.fetch_one(
            t_dataset_collection.select().where(
                t_dataset_collection.c.id == id_)
            .limit(1)), '数据不存在!'
        await db.execute(t_dataset_collection.delete().where(t_dataset_collection.c.id == id_))



    @classmethod
    async def instance(cls):
        """实例化"""
        return cls()
