from flask import Blueprint
from .exetensions import mongo


main = Blueprint('main', __name__)

@main.route('/')
def index():
    user_collection = mongo.db.users
    user_collection.insert({'name' : 'Karol'})
    return '<h1>Added a User!</h1>'