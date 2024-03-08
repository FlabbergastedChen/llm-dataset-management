from typing import List, Union,Any
from fastapi import Query
from pydantic import BaseModel, Field


class TFinetunedDirectivesListIn(BaseModel):
    """【请填写功能名称】列表参数"""
    fid: Union[int,str,None] = Query()
    instruction: Union[str, None] = Query()  # 数据集名称
    input: Union[str, None] = Query()  # 数据集类型(0:代码，1:文档)
    output: Union[str, None] = Query()  # 数据集来源


class TFinetunedDirectivesDetailIn(BaseModel):
    """【请填写功能名称】详情参数"""
    id: int = Query(gt=0)  #


class TFinetunedDirectivesAddIn(BaseModel):
    """【请填写功能名称】新增参数"""
    fid: Union[int,str] #对应的微调数据集id
    instruction: str  # 数据集名称
    input: str  # 数据集类型(0:代码，1:文档)
    output: str  # 数据集来源
    history: Union[str,None,Any]


class TFinetunedDirectivesEditIn(BaseModel):
    """【请填写功能名称】编辑参数"""
    id: int = Field(gt=0)  #id
    fid: Union[int,str] # 微调数据集id
    instruction: str  # 指令名称
    input: str  # 输入
    output: str  # 输出
    history: Union[str,None,Any] #历史


class TFinetunedDirectivesDelIn(BaseModel):
    """【请填写功能名称】删除参数"""
    id: int = Field(gt=0)  #


class TFinetunedDirectivesOut(BaseModel):
    """【请填写功能名称】返回信息"""
    id: int  #
    fid: int # 微调数据集id
    instruction: str  # 指令名称
    input: str  # 输入
    output: str  # 输出
    history: Union[str,Any]  # 历史对话
    is_deleted: int  # 是否删除
    create_time: Union[str,Any]    # 创建时间
    update_time: Union[str,Any]  # 更新时间

    class Config:
        orm_mode = True


