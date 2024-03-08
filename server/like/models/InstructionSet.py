import sqlalchemy as sa
from like.models.base import Base

__all__ = [
    'TInstruction',
    't_instruction',
]


class TInstruction(Base):
    """指令集实体"""
    __tablename__ = 'la_t_instruction'
    __table_args__ = {
        'mysql_engine': 'InnoDB',
        'mysql_charset': 'utf8mb4',
        'mysql_collate': 'utf8mb4_general_ci',
        'mysql_row_format': 'Dynamic',
        'comment': '指令集表',
    }

    InsId = sa.Column(sa.Integer(), primary_key=True)  # 指令标识
    fid = sa.Column(sa.Integer())  # 文件标识
    instruction = sa.Column(sa.String())  # 指令
    input_data = sa.Column(sa.String())  # 输入数据
    output_data = sa.Column(sa.String())  # 输出数据
    history = sa.Column(sa.JSON())  # 操作历史
    is_deleted = sa.Column(sa.Integer())  # 是否删除
    create_time = sa.Column(sa.DateTime())  # 创建时间
    update_time = sa.Column(sa.DateTime())  # 更新时间



t_instruction = TInstruction.__table__
