from flask import Flask
from .exetensions import mongo


def create_app(config_object="mongo_example.settings"):
    app = Flask(__name__)

    app.config.from_object(config_object)

    mongo.init_app(app)

    return app