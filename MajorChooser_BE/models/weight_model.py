from sqlalchemy import Column, Integer, String, Text, ForeignKey, UniqueConstraint
from models.database import Base

class QuestionWeight(Base):
    __tablename__ = "question_weights"

    id = Column(Integer, primary_key=True, index=True)
    question_id = Column(Integer, ForeignKey("questions.id", ondelete="CASCADE"), nullable=False)
    major_id = Column(Integer, ForeignKey("majors.id", ondelete="CASCADE"), nullable=False)
    weight = Column(Integer, nullable=False, default=0)
    __table_args__ = (
        UniqueConstraint(
            "question_id",
            "major_id",
            name="uq_question_major"
        ),
    )
