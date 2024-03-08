from typing import Union

from fastapi import Query
from pydantic import BaseModel, Field


class InstructionListIn(BaseModel):
    """指令集合列表参数"""
    fid: Union[int, None] = Query()  # 微调数据集id
    instruction: Union[str, None] = Query()  # 指令
    input_data: Union[str, None] = Query()  # 输入数据
    output_data: Union[str, None] = Query()  # 输出数据
    history: Union[dict, None] = Query()  # 历史

    class Config:
        orm_mode = True


class InstructionDetailIn(BaseModel):
    """指令集合详情参数"""
    InsId: int = Query(gt=0)  # 指令标识


class InstructionAddIn(BaseModel):
    """新增指令集合参数"""
    fid: int  # 文件标识
    instruction: str  # 指令
    input_data: str  # 输入数据
    output_data: str  # 输出数据
    history: dict  # 操作历史


class InstructionEditIn(BaseModel):
    """编辑指令集合参数"""
    InsId: int = Field(gt=0)  # 指令标识
    fid: int  # 文件标识
    instruction: str  # 指令
    input_data: str  # 输入数据
    output_data: str  # 输出数据
    history: dict  # 操作历史


class InstructionDelIn(BaseModel):
    """删除指令集合参数"""
    InsId: int = Field(gt=0)  # 指令标识


class InstructionOut(BaseModel):
    """返回指令集合信息"""
    InsId: int  # 指令标识
    fid: int  # 文件标识
    instruction: str  # 指令
    input_data: str  # 输入数据
    output_data: str  # 输出数据
    history: dict  # 操作历史

    class Config:
        orm_mode = True
