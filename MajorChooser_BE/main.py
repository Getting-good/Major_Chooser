from fastapi  import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from models.database import engine, Base, SessionLocal
from models.major_model import Major
from models.question_model import Question
from models.weight_model import QuestionWeight
from dotenv import load_dotenv
import os   

load_dotenv()  # Load environment variables from .env file


app = FastAPI()

Base.metadata.create_all(bind=engine)


app.add_middleware(
    CORSMiddleware,
    allow_origins= ["http://localhost:5173"],
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def root(): 
    return {"message": "Major Chooser Backend"}

@app.get("/majors")
def get_majors():
    db = SessionLocal()

    majors = db.query(Major).all()
    db.close()
    return majors

@app.get("/questions")
def get_questions():
    db = SessionLocal()

    questions = db.query(Question).all()
    db.close()
    return questions

@app.get("/weights")
def get_weights():
    db = SessionLocal()

    weights = db.query(QuestionWeight).all()
    db.close()
    return weights


# # test 창
# @app.get("/items/{item_id}")
# def itemfunc(item_id: int):
#     return {"items id": item_id}


# @app.get("/search")
# def searchfunc(q: str):
#     return {"keyword": q}