from datetime import datetime
from typing import Union

from fastapi import Query
from pydantic import BaseModel, Field


class TDatasetCollectionListIn(BaseModel):
    """【请填写功能名称】列表参数"""
    dataset_name: Union[str, None] = Query()  # 数据集名称
    dataset_type: Union[int, None] = Query()  # 数据集类型(0:代码，1:文档)
    dataset_source: Union[str, None] = Query()  # 数据集来源
    size: Union[str, None] = Query()  # 数据集大小
    filepath: Union[str, None] = Query()  # 文件路径

    description: Union[str, None] = Query()  # 数据集描述
    # is_deleted: Union[int, None] = Query()  # 是否删除


class TDatasetCollectionDetailIn(BaseModel):
    """【请填写功能名称】详情参数"""
    id: int = Query(gt=0)  # 


class TDatasetCollectionAddIn(BaseModel):
    """【请填写功能名称】新增参数"""
    dataset_name: str  # 数据集名称
    dataset_type: int  # 数据集类型(0:代码，1:文档)
    dataset_source: str  # 数据集来源
    size: str  # 数据集大小
    filepath: str  # 文件路径
    description: str  # 数据集描述


class TDatasetCollectionEditIn(BaseModel):
    """【请填写功能名称】编辑参数"""
    id: int = Field(gt=0)  # 
    dataset_name: str  # 数据集名称
    dataset_type: int  # 数据集类型(0:代码，1:文档)
    dataset_source: str  # 数据集来源
    size: str  # 数据集大小
    filepath: str  # 文件路径
    description: str  # 数据集描述


class TDatasetCollectionDelIn(BaseModel):
    """【请填写功能名称】删除参数"""
    id: int = Field(gt=0)  # 


class TDatasetCollectionOut(BaseModel):
    """【请填写功能名称】返回信息"""
    id: int  # 
    dataset_name: str  # 数据集名称
    dataset_type: int  # 数据集类型(0:代码，1:文档)
    dataset_source: str  # 数据集来源
    size: str  # 数据集大小
    filepath: str  # 文件路径

    description: str  # 数据集描述
    is_deleted: int  # 是否删除
    create_time: str    # 创建时间
    update_time: str  # 创建时间

    class Config:
        orm_mode = True

