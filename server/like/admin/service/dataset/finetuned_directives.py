from abc import ABC, abstractmethod
from datetime import datetime
from typing import List

import pydantic
import sqlalchemy as sa
from fastapi_pagination.bases import AbstractPage
from fastapi_pagination.ext.databases import paginate

from like.dependencies.database import db
from like.models import t_fineturned_directives
from like.admin.schemas.directives import (
    TFinetunedDirectivesListIn, TFinetunedDirectivesAddIn, TFinetunedDirectivesEditIn, TFinetunedDirectivesOut)



class ITFinetunedDirectivesService(ABC):
    """【请填写功能名称】抽象类"""

    @abstractmethod
    async def list(self, list_in: TFinetunedDirectivesListIn) -> AbstractPage[TFinetunedDirectivesOut]:
        pass

    @abstractmethod
    async def detail(self, id_: int) -> TFinetunedDirectivesOut:
        pass

    @abstractmethod
    async def add(self, add_in: TFinetunedDirectivesAddIn):
        pass

    @abstractmethod
    async def edit(self, edit_in: TFinetunedDirectivesEditIn):
        pass

    @abstractmethod
    async def delete(self, id_: int):
        pass

    @abstractmethod
    async def batch_delete(self, del_in: list):
        pass


class TFinetunedDirectivesService(ITFinetunedDirectivesService):
    """【请填写功能名称】实现类"""

    async def list(self, list_in: TFinetunedDirectivesListIn) -> AbstractPage[TFinetunedDirectivesOut]:
        """【请填写功能名称】列表"""
        columns = [
            t_fineturned_directives
        ]
        where = []
        where.append(t_fineturned_directives.c.fid == list_in.fid)
        if list_in.instruction is not None and list_in.instruction != "":
            where.append(t_fineturned_directives.c.instruction.like(f'%{list_in.instruction}%'))
        if list_in.input is not None and list_in.input != "":
            where.append(t_fineturned_directives.c.input.like(f'%{list_in.input}%'))
        if list_in.output is not None and list_in.output != "":
            where.append(t_fineturned_directives.c.output.like(f'%{list_in.output}%'))
        where.append(t_fineturned_directives.c.is_deleted == 0)
        query = sa.select(columns).where(*where) \
            .select_from(
            t_fineturned_directives
        ).order_by(t_fineturned_directives.c.id.desc())
        res = await paginate(db, query)
        print(res)
        return res

    async def detail(self, id_: int) -> TFinetunedDirectivesOut:
        """【请填写功能名称】详情"""
        model = await db.fetch_one(
            t_fineturned_directives.select().where(
                t_fineturned_directives.c.id == id_)
            .limit(1))
        assert model, '数据不存在!'
        res = TFinetunedDirectivesOut.from_orm(model)
        return res

    async def add(self, add_in: TFinetunedDirectivesAddIn):
        """【请填写功能名称】新增"""
        await db.execute(t_fineturned_directives.insert().values({
            'fid': add_in.fid,
            'instruction': add_in.instruction,
            'input': add_in.input,
            'output': add_in.output,
            'history': add_in.history,
            'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
            'is_deleted': 0,
        }))

    async def edit(self, edit_in: TFinetunedDirectivesEditIn):
        """【请填写功能名称】编辑"""
        assert await db.fetch_one(
            t_fineturned_directives.select().where(
                t_fineturned_directives.c.id == edit_in.id)
            .limit(1)), '数据不存在!'
        await db.execute(
            t_fineturned_directives.update().where(t_fineturned_directives.c.id == edit_in.id).values({
                'instruction': edit_in.instruction,
                'input': edit_in.input,
                'output': edit_in.output,
                'history': edit_in.history,
                'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            }))

    async def batch_delete(self, del_in: list):
        assert await db.fetch_all(
            t_fineturned_directives.select().where(
                t_fineturned_directives.c.id.in_(del_in))
            .limit(len(del_in))), '数据不存在!'
        await db.execute(
            t_fineturned_directives.update().where(t_fineturned_directives.c.id.in_(del_in)).values({
                'is_deleted': 1
            }))

    async def delete(self, id_: int):
        """【请填写功能名称】删除"""
        assert await db.fetch_one(
            t_fineturned_directives.select().where(
                t_fineturned_directives.c.id == id_)
            .limit(1)), '数据不存在!'
        await db.execute(t_fineturned_directives.delete().where(t_fineturned_directives.c.id == id_))


    @classmethod
    async def instance(cls):
        """实例化"""
        return cls()
