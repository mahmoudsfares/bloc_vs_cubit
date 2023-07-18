from pony.orm import Database, Required, Optional
from db import db_manager   

db=db_manager()

class Answer(db.Entity):
    question_id = Required(int)
    answer_id = Required(int)
    answer_text = Required(str)