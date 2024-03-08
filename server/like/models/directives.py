import sqlalchemy as sa

from like.models.base import Base

__all__ = [
    'TFinetunedDirectives',
    't_fineturned_directives',
]


class TFinetunedDirectives(Base):
    """【请填写功能名称】实体"""
    __tablename__ = 'la_t_finetuned_directives'
    __table_args__ = {
        'mysql_engine': 'InnoDB',
        'mysql_charset': 'utf8mb4',
        'mysql_collate': 'utf8mb4_general_ci',
        'mysql_row_format': 'Dynamic',
        'comment': '【dataset】表',
    }
    id = sa.Column(sa.Integer(), primary_key=True)  #
    fid = sa.Column(sa.Integer())  # 数据集名称
    instruction = sa.Column(sa.String())  # 数据集类型(0:代码，1:文档)
    input = sa.Column(sa.String())  # 数据集来源
    output = sa.Column(sa.String())  # 数据指令数量
    history = sa.Column(sa.String())  # 历史记录
    is_deleted = sa.Column(sa.Integer())  # 是否删除
    create_time = sa.Column(sa.DateTime())  # 创建时间
    update_time = sa.Column(sa.DateTime())  # 更新时间


t_fineturned_directives = TFinetunedDirectives.__table__


