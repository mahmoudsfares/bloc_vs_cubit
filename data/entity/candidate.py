from pony.orm import Database, Required, Optional
from db import db_manager   

db=db_manager()

class Candidate(db.Entity):
    email = Required(str)
    full_name = Required(str)
    phone_number=Required(str)
    test_code=Required(str)
    
