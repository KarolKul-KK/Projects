import sqlite3
import time


def login():
    while True:
        name = input("Please enter your name: ")
        password = input("Please enter your password: ")
        with sqlite3.connect("sqldatabase.db") as db:
            cursor = db.cursor()
        find_user = ("SELECT * FROM usernames WHERE name = ? AND password = ?")
        cursor.execute(find_user,[(name),(password)])
        results = cursor.fetchall()

        if results:
            for i in results:
                print("Hello " +i[1])
            break

        else:
            print("Username and password not recognised")
            again = input("Do you want try again?(Y/N): ")
            if again.lower() == "n":
                print("Good Bye")
                time.sleep(1)


def new_user():
    found = 0
    while found == 0:
        name = input("Please check is your name available: ")
        with sqlite3.connect("sqldatabase.db") as db:
            cursor = db.cursor()
        findUser = ("SELECT * FROM usernames WHERE name = ?")
        cursor.execute(findUser, [(name)])

        if cursor.fetchall():
            print("Name is taken, please try again")
        else:
            found = 1
        
    name = input("Enter your name: ")
    password = input("Enter your password: ")
    password1 = input("Please remember your password: ")
    while password != password1:
        print("Your password didn't match. Pleasetry again.")
        password = input("Enter your password: ")
        password1 = input("Please remember your password: ")
    insertData = """INSERT INTO usernames(name, password)
    VALUES(?,?)"""
    cursor.execute(insertData, [(name), (password)])
    db.commit()


def main():
    while True:
        print("Welcome to my app!")
        menu = ("""
        1 - Create New User
        2 - Login to system
        3 - Exit System\n
        """)

        userChoice = input(menu)

        if userChoice == '1':
            new_user()
    
        elif userChoice == '2':
            login()

        elif userChoice == '3':
            break

        else:
            print("Command not revognized")


main()



