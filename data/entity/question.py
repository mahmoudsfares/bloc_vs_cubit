from pony.orm import Database, Required, Optional
from db import db_manager   

db=db_manager()

class Question(db.Entity):
    question_id = Required(int)
    question_heading = Required(str)
    
