import sqlite3

class Database:
    def __init__(self, db):
        try:
            with open('create_insert.sql', 'r') as sql_file:
                sql_script = sql_file.read()
        except FileNotFoundError:
            print("Problem with oppening a file")

        self.conn = sqlite3.connect(db)
        self.cur = self.conn.cursor()
        self.cur.executescript(sql_script)
        self.conn.commit()

    def view(self):
        sql_script = """SELECT B.book_id, B.title, A.name || ' ' || A.last_name, T.type_name, 
                    S.company_name, L.link, Ter.territory_name
                    FROM Books B 
                    JOIN Authors A ON(B.author_id = A.author_id)
                    JOIN Types T ON(T.type_id = B.type_id)
                    JOIN Suppliers S ON(S.supplier_id = B.supplier_id)
                    JOIN Links L ON(L.book_id = B.book_id)
                    JOIN Authors_territories At ON(A.author_id = At.author_id)
                    JOIN Territories Ter ON(Ter.territory_id = At.territory_id)"""

        self.cur.execute(sql_script)
        rows = self.cur.fetchall()
        return rows
    
    def search(self, title=""):
        self.cur.execute("SELECT B.title, A.name || ' ' || A.last_name, T.type_name, S.company_name, L.link, Ter.territory_name FROM Books B JOIN Authors A ON(B.author_id = A.author_id) JOIN Types T ON(T.type_id = B.type_id) JOIN Suppliers S ON(S.supplier_id = B.supplier_id) JOIN Links L ON(L.book_id = B.book_id) JOIN Authors_territories At ON(A.author_id = At.author_id) JOIN Territories Ter ON(Ter.territory_id = At.territory_id) WHERE B.title = ? ", (title,))

        rows = self.cur.fetchall()
        return rows

    def update(self, title, book_id):
        self.cur.execute("UPDATE Books SET title = ? WHERE book_id = ?", (title, book_id))
        self.conn.commit()

    def delete(self, book_id):
        print(book_id)
        self.cur.execute("DELETE FROM Books WHERE book_id = ?", (book_id))
        self.conn.commit()

    # def __del__(self):
    #     self.conn.close()
