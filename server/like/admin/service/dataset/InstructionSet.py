from abc import ABC, abstractmethod
from datetime import datetime
from typing import List

from fastapi_pagination.bases import AbstractPage
from fastapi_pagination.ext.databases import paginate
from sqlalchemy import select, update, delete, insert

from like.dependencies.database import db
from like.models.InstructionSet import t_instruction
from like.admin.schemas.InstructionSet import (
    InstructionListIn, InstructionAddIn, InstructionEditIn, InstructionOut)


class IInstructionService(ABC):
    """指令集服务抽象类"""

    @abstractmethod
    async def list(self, list_in: InstructionListIn) -> AbstractPage[InstructionOut]:
        pass

    @abstractmethod
    async def detail(self, ins_id: int) -> InstructionOut:
        pass

    @abstractmethod
    async def add(self, add_in: InstructionAddIn):
        pass

    @abstractmethod
    async def edit(self, edit_in: InstructionEditIn):
        pass

    @abstractmethod
    async def delete(self, ins_id: int):
        pass

    @abstractmethod
    async def batch_delete(self, del_in: List[int]):
        pass


class InstructionService(IInstructionService):
    """指令集服务实现类"""

    async def list(self, list_in: InstructionListIn) -> AbstractPage[InstructionOut]:
        """指令集列表"""
        columns = [t_instruction]
        where = []

        # 根据输入参数构建查询条件
        if list_in.fid is not None:
            where.append(t_instruction.c.fid == list_in.fid)
        if list_in.instruction is not None and list_in.instruction != "":
            where.append(t_instruction.c.instruction.like(f'%{list_in.instruction}%'))

        query = select(columns).where(*where).select_from(t_instruction).order_by(t_instruction.c.InsId.desc())
        res = await paginate(db, query)
        return res

    async def detail(self, ins_id: int) -> InstructionOut:
        """指令集详情"""
        model = await db.fetch_one(select([t_instruction]).where(t_instruction.c.InsId == ins_id).limit(1))
        assert model, '数据不存在!'
        return InstructionOut.from_orm(model)

    async def add(self, add_in: InstructionAddIn):
        """新增指令集"""
        await db.execute(
            insert(t_instruction).values({
                'fid': add_in.fid,
                'instruction': add_in.instruction,
                'input_data': add_in.input_data,
                'output_data': add_in.output_data,
                'history': add_in.history,
                'create_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
                'is_deleted': 0

            })
        )

    async def edit(self, edit_in: InstructionEditIn):
        """编辑指令集"""
        assert await db.fetch_one(
            select([t_instruction]).where(t_instruction.c.InsId == edit_in.InsId).limit(1)), '数据不存在!'

        await db.execute(
            update(t_instruction).where(t_instruction.c.InsId == edit_in.InsId).values({
                'fid': edit_in.fid,
                'instruction': edit_in.instruction,
                'input_data': edit_in.input_data,
                'output_data': edit_in.output_data,
                'history': edit_in.history,
                'update_time': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            })
        )

    async def delete(self, ins_id: int):
        """删除指令集"""
        assert await db.fetch_one(select([t_instruction]).where(t_instruction.c.InsId == ins_id).limit(1)), '数据不存在!'
        await db.execute(delete(t_instruction).where(t_instruction.c.InsId == ins_id))

    async def batch_delete(self, del_in: List[int]):
        """批量删除指令集"""
        print(del_in)
        assert await db.fetch_all(
            select([t_instruction]).where(t_instruction.c.InsId.in_(del_in)).limit(len(del_in))), '数据不存在!'
        for id in del_in:
            await db.execute(delete(t_instruction).where(t_instruction.c.InsId == id))


    @classmethod
    async def instance(cls):
        """实例化"""
        return cls()
