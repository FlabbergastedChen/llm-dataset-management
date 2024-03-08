import logging
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
from like.models import t_fineturned_dataset,t_fineturned_directives
from like.admin.schemas.finetuned import (
    TFinetunedDatasetListIn, TFinetunedDatasetAddIn, TFinetunedDatasetEditIn, TFinetunedDatasetOut)

logger = logging.getLogger(__name__)


class ITFinetunedDatasetService(ABC):
    """【请填写功能名称】抽象类"""

    @abstractmethod
    async def list(self, list_in: TFinetunedDatasetListIn) -> AbstractPage[TFinetunedDatasetOut]:
        pass

    @abstractmethod
    async def detail(self, id_: int) -> TFinetunedDatasetOut:
        pass

    @abstractmethod
    async def add(self, add_in: TFinetunedDatasetAddIn):
        pass

    @abstractmethod
    async def edit(self, edit_in: TFinetunedDatasetEditIn):
        pass

    @abstractmethod
    async def delete(self, id_: int):
        pass

    @abstractmethod
    async def batch_delete(self, del_in: list):
        pass


class TFinetunedDatasetService(ITFinetunedDatasetService):
    """【请填写功能名称】实现类"""

    async def list(self, list_in: TFinetunedDatasetListIn) -> AbstractPage[TFinetunedDatasetOut]:
        """【请填写功能名称】列表"""
        columns = [
            t_fineturned_dataset
        ]
        where = []
        if list_in.dataset_name is not None and list_in.dataset_name != "":
            where.append(t_fineturned_dataset.c.dataset_name.like(f'%{list_in.dataset_name}%'))
        if list_in.dataset_type is not None:
            where.append(t_fineturned_dataset.c.dataset_type == list_in.dataset_type)
        if list_in.dataset_source is not None and list_in.dataset_source != "":
            where.append(t_fineturned_dataset.c.dataset_source.like(f'%{list_in.dataset_source}%'))
        if list_in.directives_count is not None and list_in.directives_count != "":
            where.append(t_fineturned_dataset.c.directives_count == list_in.directives_count)
        if list_in.description is not None and list_in.description != "":
            where.append(t_fineturned_dataset.c.description.like(f'%{list_in.description}%'))
        where.append(t_fineturned_dataset.c.is_deleted == 0)
        query = sa.select(columns).where(*where) \
            .select_from(
            t_fineturned_dataset
        ).order_by(t_fineturned_dataset.c.id.desc())
        res = await paginate(db, query)
        print(res)
        return res

    async def detail(self, id_: int) -> TFinetunedDatasetOut:
        """【请填写功能名称】详情"""
        model = await db.fetch_one(
            t_fineturned_dataset.select().where(
                t_fineturned_dataset.c.id == id_)
            .limit(1))
        assert model, '数据不存在!'
        res = TFinetunedDatasetOut.from_orm(model)
        return res

    async def add(self, add_in: TFinetunedDatasetAddIn):
        """【请填写功能名称】新增"""
        await db.execute(t_fineturned_dataset.insert().values({
            'dataset_name': add_in.dataset_name,
            'dataset_type': add_in.dataset_type,
            'dataset_source': add_in.dataset_source,
            'directives_count': 0,
            'description': add_in.description,
            'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'is_deleted': 0,
        }))

    async def edit(self, edit_in: TFinetunedDatasetEditIn):
        """【请填写功能名称】编辑"""
        assert await db.fetch_one(
            t_fineturned_dataset.select().where(
                t_fineturned_dataset.c.id == edit_in.id)
            .limit(1)), '数据不存在!'
        await db.execute(
            t_fineturned_dataset.update().where(t_fineturned_dataset.c.id == edit_in.id).values({
                'dataset_name': edit_in.dataset_name,
                'dataset_type': edit_in.dataset_type,
                'dataset_source': edit_in.dataset_source,
                'description': edit_in.description,
                'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            }))

    async def batch_delete(self, del_in: list):
        delete_lists = await db.fetch_all(
            t_fineturned_dataset.select().where(
                t_fineturned_dataset.c.id.in_(del_in))
            .limit(len(del_in)))
        assert delete_lists, '数据不存在!'
        # 删除子数据
        for del_id in del_in:
            try:
                print(del_id)
                await db.execute(
                    t_fineturned_directives.update().where(t_fineturned_directives.c.fid == del_id).values({
                        'is_deleted': 1
                    }))
            except Exception as e:
                logger.info("删除子数据失败，原因：{}",e)
        await db.execute(
            t_fineturned_dataset.update().where(t_fineturned_dataset.c.id.in_(del_in)).values({
                'is_deleted': 1
            }))

    async def delete(self, id_: int):
        """【请填写功能名称】删除"""
        assert await db.fetch_one(
            t_fineturned_dataset.select().where(
                t_fineturned_dataset.c.id == id_)
            .limit(1)), '数据不存在!'
        await db.execute(t_fineturned_dataset.delete().where(t_fineturned_dataset.c.id == id_))


    @classmethod
    async def instance(cls):
        """实例化"""
        return cls()
