import logging

from fastapi import APIRouter, Depends

from like.schema_base import PageInationResult
from like.http_base import unified_resp
from like.admin.schemas.InstructionSet import (
    InstructionListIn, InstructionDetailIn, InstructionAddIn, InstructionEditIn, InstructionDelIn, InstructionOut)
from like.admin.service.dataset.InstructionSet import IInstructionService, InstructionService

logger = logging.getLogger(__name__)

router = APIRouter(prefix='/instruction')


@router.get('/list', response_model=PageInationResult[InstructionOut])
@unified_resp
async def instruction_list(
        list_in: InstructionListIn = Depends(),
        instruction_service: IInstructionService = Depends(InstructionService.instance)):
    """指令集列表"""
    return await instruction_service.list(list_in)


@router.get('/detail')
@unified_resp
async def instruction_detail(
        detail_in: InstructionDetailIn = Depends(),
        instruction_service: IInstructionService = Depends(InstructionService.instance)):
    """指令集详情"""
    return await instruction_service.detail(detail_in.InsId)


@router.post('/add')
@unified_resp
async def instruction_add(
        add_in: InstructionAddIn,
        instruction_service: IInstructionService = Depends(InstructionService.instance)):
    """新增指令集"""
    return await instruction_service.add(add_in)


@router.post('/edit')
@unified_resp
async def instruction_edit(
        edit_in: InstructionEditIn,
        instruction_service: IInstructionService = Depends(InstructionService.instance)):
    """编辑指令集"""
    return await instruction_service.edit(edit_in)


@router.post('/del')
@unified_resp
async def instruction_del(
        del_in: InstructionDelIn,
        instruction_service: IInstructionService = Depends(InstructionService.instance)):
    """删除指令集"""
    return await instruction_service.delete(del_in.InsId)


@router.post('/batchdel')
@unified_resp
async def instruction_batch_del(
        del_in: list,
        instruction_service: IInstructionService = Depends(InstructionService.instance)):
    """批量删除指令集"""
    logger.info("开始执行instruction_batch_del")
    return await instruction_service.batch_delete(del_in)
