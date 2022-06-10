import sqlite3

class SQLighter:
    def __init__(self, database):
        self.connection = sqlite3.connect(database)
        self.cursor = self.connection.cursor()

    def execute(self, sql_query, args=None):
        if args is None:
            self.cursor.execute(sql_query)
        else:
            self.cursor.execute(sql_query, args)
        self.connection.commit()

    def select(self, sql_query, args=None):
        self.execute(sql_query, args)
        return self.cursor.fetchall()

    def close(self):
        self.connection.close() # close the connection to the database
    
    def get_user(self, login, password):
        obj = self.cursor.execute(f"SELECT HOUSE_ID FROM users WHERE LOGIN = '{login}' AND PASSWORD = '{password}'")

        if len(obj.fetchall()) == 0:
            return False, 0
        else:
            obj = self.cursor.execute(f"SELECT name FROM users WHERE LOGIN = '{login}' AND PASSWORD = '{password}'")
            name = obj.fetchall()[0][0]
            return True, name

    
    def is_user_registred(self, login):
        obj = self.cursor.execute(f"SELECT LOGIN FROM users WHERE LOGIN = '{login}'")
        if len(obj.fetchall()) == 0:
            return False
        else:
            return True

    def insert_feedback(self, user_id, content):
        self.cursor.execute(
            f"INSERT INTO feedback (user_id,content ) VALUES( {int(user_id)},'{content}')")
        self.connection.commit()

    def register_user(self, login, password):
        self.cursor.execute(f"INSERT INTO users (login, password) VALUES('{login}', '{password}')")
        self.connection.commit()