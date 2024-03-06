import logging

from fastapi import APIRouter, Depends

from like.schema_base import PageInationResult
from like.http_base import unified_resp
from like.admin.schemas.dataset import (
    TDatasetCollectionListIn, TDatasetCollectionDetailIn, TDatasetCollectionAddIn,
    TDatasetCollectionEditIn, TDatasetCollectionDelIn, TDatasetCollectionOut)
from like.admin.service.dataset.collect import ITDatasetCollectionService, TDatasetCollectionService

logger = logging.getLogger(__name__)

router = APIRouter(prefix='/dataset')


@router.get('/collection/list', response_model=PageInationResult[TDatasetCollectionOut])
@unified_resp
async def collection_list(
        list_in: TDatasetCollectionListIn = Depends(),
        t_dataset_collection_service: ITDatasetCollectionService = Depends(TDatasetCollectionService.instance)):
    """【请填写功能名称】列表"""
    return await t_dataset_collection_service.list(list_in)


@router.get('/collection/detail')
@unified_resp
async def collection_detail(
        detail_in: TDatasetCollectionDetailIn = Depends(),
        t_dataset_collection_service: ITDatasetCollectionService = Depends(TDatasetCollectionService.instance)):
    """【请填写功能名称】详情"""
    return await t_dataset_collection_service.detail(detail_in.id)


@router.post('/collection/add')
@unified_resp
async def collection_add(
        add_in: TDatasetCollectionAddIn,
        t_dataset_collection_service: ITDatasetCollectionService = Depends(TDatasetCollectionService.instance)):
    """【请填写功能名称】新增"""
    return await t_dataset_collection_service.add(add_in)


@router.post('/collection/edit')
@unified_resp
async def collection_edit(
        edit_in: TDatasetCollectionEditIn,
        t_dataset_collection_service: ITDatasetCollectionService = Depends(TDatasetCollectionService.instance)):
    """【请填写功能名称】编辑"""
    return await t_dataset_collection_service.edit(edit_in)


@router.post('/collection/del')
@unified_resp
async def collection_del(
        del_in: TDatasetCollectionDelIn,
        t_dataset_collection_service: ITDatasetCollectionService = Depends(TDatasetCollectionService.instance)):
    """【请填写功能名称】删除"""
    return await t_dataset_collection_service.delete(del_in.id)


@router.post('/collection/batchdel')
@unified_resp
async def collection_batch_del(
        del_in: list,
        t_dataset_collection_service: ITDatasetCollectionService = Depends(TDatasetCollectionService.instance)):
    """批量删除"""
    logger.info("开始执行collection_batch_del")
    return await t_dataset_collection_service.batch_delete(del_in)

