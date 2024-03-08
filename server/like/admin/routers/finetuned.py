import logging
from fastapi import APIRouter, Depends
from like.schema_base import PageInationResult
from like.http_base import unified_resp

from like.admin.schemas.finetuned import (TFinetunedDatasetListIn,TFinetunedDatasetOut,TFinetunedDatasetAddIn,
                                          TFinetunedDatasetDelIn,TFinetunedDatasetEditIn,TFinetunedDatasetDetailIn)
from like.admin.schemas.directives import (TFinetunedDirectivesOut,TFinetunedDirectivesAddIn,TFinetunedDirectivesListIn,
                                           TFinetunedDirectivesEditIn,TFinetunedDirectivesDelIn,TFinetunedDirectivesDetailIn)
from like.admin.service.dataset.finetuned import ITFinetunedDatasetService,TFinetunedDatasetService
from like.admin.service.dataset.finetuned_directives import ITFinetunedDirectivesService,TFinetunedDirectivesService

logger = logging.getLogger(__name__)
router = APIRouter(prefix='/finetuned')


@router.get('/list', response_model=PageInationResult[TFinetunedDatasetOut])
@unified_resp
async def finetuned_list(
        list_in: TFinetunedDatasetListIn = Depends(),
        t_finetuned_dataset_service: ITFinetunedDatasetService = Depends(TFinetunedDatasetService.instance)):
    """【请填写功能名称】列表"""
    return await t_finetuned_dataset_service.list(list_in)


@router.get('/detail')
@unified_resp
async def finetuned_detail(
        detail_in: TFinetunedDatasetDetailIn = Depends(),
        t_dataset_collection_service: ITFinetunedDatasetService = Depends(TFinetunedDatasetService.instance)):
    """【请填写功能名称】列表"""
    return await t_dataset_collection_service.detail(detail_in.id)



@router.post('/add')
@unified_resp
async def finetuned_add(
        add_in: TFinetunedDatasetAddIn,
        t_dataset_collection_service: ITFinetunedDatasetService = Depends(TFinetunedDatasetService.instance)):
    """【请填写功能名称】列表"""
    return await t_dataset_collection_service.add(add_in)



@router.post('/batchdel')
@unified_resp
async def finetuned_batchdel(
        del_in:list,
        t_dataset_collection_service: ITFinetunedDatasetService = Depends(TFinetunedDatasetService.instance)):
    """【请填写功能名称】列表"""
    return await t_dataset_collection_service.batch_delete(del_in)


@router.post('/edit')
@unified_resp
async def finetuned_edit(
        edit_in: TFinetunedDatasetEditIn,
        t_dataset_collection_service: ITFinetunedDatasetService = Depends(TFinetunedDatasetService.instance)):
    """【请填写功能名称】列表"""
    return await t_dataset_collection_service.edit(edit_in)

# ----------------------------------------------------------------------
@router.get('/directives/list', response_model=PageInationResult[TFinetunedDirectivesOut])
@unified_resp
async def finetuned_list(
        list_in: TFinetunedDirectivesListIn = Depends(),
        t_finetuned_directives_service: ITFinetunedDirectivesService = Depends(TFinetunedDirectivesService.instance)):
    """【请填写功能名称】列表"""
    return await t_finetuned_directives_service.list(list_in)


@router.get('/directives/detail')
@unified_resp
async def finetuned_detail(
        detail_in: TFinetunedDatasetDetailIn = Depends(),
        t_finetuned_directives_service: ITFinetunedDirectivesService = Depends(TFinetunedDirectivesService.instance)):
    """【请填写功能名称】列表"""
    return await t_finetuned_directives_service.detail(detail_in.id)



@router.post('/directives/add')
@unified_resp
async def finetuned_add(
        add_in: TFinetunedDirectivesAddIn,
        t_finetuned_directives_service: ITFinetunedDirectivesService = Depends(TFinetunedDirectivesService.instance)):
    """【请填写功能名称】列表"""
    return await t_finetuned_directives_service.add(add_in)



@router.post('/directives/batchdel')
@unified_resp
async def finetuned_batchdel(
        del_in:list,
        t_finetuned_directives_service: ITFinetunedDirectivesService = Depends(TFinetunedDirectivesService.instance)):
    """【请填写功能名称】列表"""
    return await t_finetuned_directives_service.batch_delete(del_in)


@router.post('/directives/edit')
@unified_resp
async def finetuned_edit(
        edit_in: TFinetunedDirectivesEditIn,
        t_finetuned_directives_service: ITFinetunedDirectivesService = Depends(TFinetunedDirectivesService.instance)):
    """【请填写功能名称】列表"""
    return await t_finetuned_directives_service.edit(edit_in)


