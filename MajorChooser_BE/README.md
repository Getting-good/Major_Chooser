# Major Chooser Backend

FastAPI backend for the Major Chooser project.

-------
# Tech Stack
## Frontend
- React
- Vite
- React Router

## Backend
- FastAPI
- SQLAlchemy
- PyMySQL

## Database
- MySQL

-------
# Requirements

Before running this project, make sure the following software is installed.

- Python 3.12+
- Node.js 20+
- npm
- MySQL 8+

-------


## (Optional) Create a Virtual Environment

Creating a virtual environment is recommended to isolate project dependencies.

```bash
python3 -m venv .venv
source .venv/bin/activate
```

-------
# Backend Setup

1. Install dependencies for backend

```bash
pip3 install -r requirements.txt
```

2. Create Database

```bash
mysql -u root -p < MajorChooser_BE/major_chooser.sql
```

4. create .env file from .env.example

You should fill it with your sql info to run the sql server.

```bash
cp MajorChooser_BE/.env.example MajorChooser_BE/.env
```


3. Run Backend
```bash
uvicorn main:app --reload
```

-------
# Frontend Setup

1. move to frontend directory
```bash
cd cd MajorChooser_FE
```

2. install dependencies
```bash
npm install
```

3. Run frontend
```bash
npm run dev
```

-------
## API Documentation

After running the backend, open:

http://127.0.0.1:8000/docs

Swagger UI provides interactive API documentation.