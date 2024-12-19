from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager, jwt_required, get_jwt_identity

app = Flask(__name__)

# Configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///users.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['JWT_SECRET_KEY'] = 'your_secret_key'

db = SQLAlchemy(app)
jwt = JWTManager(app)

# User model
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password = db.Column(db.String(120), nullable=False)

# Initialize database
with app.app_context():
    db.create_all()

# Profile read route
@app.route('/profile', methods=['GET'])
@jwt_required()
def get_profile():
    # Get the current user's identity from the JWT
    current_user_username = get_jwt_identity()

    # Fetch the user's details from the database
    user = User.query.filter_by(username=current_user_username).first()

    if not user:
        return jsonify({'message': 'User not found'}), 404

    # Return user details (excluding password)
    user_data = {
        'id': user.id,
        'username': user.username,
        'email': user.email
    }
    return jsonify({'profile': user_data}), 200

if __name__ == '__main__':
    app.run(debug=True)
