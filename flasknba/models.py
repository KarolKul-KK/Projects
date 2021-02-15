import sqlite3 as sql

def insert_User(username, password):
    con = sql.connect("database.db")
    cur = con.cursor()
    cur.execute("INSERT INTO users (username, password VALUES (?,?)", (username, password))
    con.commit()
    con.close()

def retrieve_Users():
    con = sql.connect("database.db")
    cur = con.cursor()
    cur.execute("SELECT username, password FROM users")
    users = cur.fetchall()
    con.close()
    return users
