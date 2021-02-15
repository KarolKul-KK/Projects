from flask import Flask
from flask import render_template
from flask import request
from markupsafe import escape
import models as dbHandler


app = Flask(__name__)

# login page
@app.route('/', methods=['POST', 'GET'])
def home():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        users = dbHandler.retrieve_Users()
        return render_template('index.html', users=users)
    else:
        return render_template('index.html')


# register page
@app.route('/register/', methods=['POST', 'GET'])
def register():
   return render_template('register.html')


if __name__ == '__main__':
    app.run(debug=True, host='127.0.0.1')


