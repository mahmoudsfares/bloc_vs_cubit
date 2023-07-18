from pony.orm import Database, Required, Optional


class db_manager:
    _instance = None

    def __new__(db):
        if db._instance is None:
            db._instance = super().__new__(db)
            db.bind(provider='mssql', host='10.16.0.44', database='CvParser')
            db.generate_mapping(create_tables=False)
        return db._instance
