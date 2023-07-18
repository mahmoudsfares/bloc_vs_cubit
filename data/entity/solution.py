from pony.orm import Database, Required, Optional
from db import db_manager   

db=db_manager()

class Solution(db.Entity):
    candidate_email=Required(str)
    solution=list(int,int)