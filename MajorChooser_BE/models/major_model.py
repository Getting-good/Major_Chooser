from sqlalchemy import Column, Integer, String, Text
from models.database import Base

class Major(Base):
    __tablename__ = "majors"

    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    college = Column(String(100), nullable=False)
    academics = Column(Text)
    experience = Column(Text)
    opportunities = Column(Text)

    base_affinity = Column(Integer, nullable=False, default=10)