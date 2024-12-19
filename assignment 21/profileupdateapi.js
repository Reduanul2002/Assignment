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

# User Profile Update Route
@app.route('/profile', methods=['PUT'])
@jwt_required()
def update_profile():
    # Get the current user's identity from the JWT
    current_user_username = get_jwt_identity()

    # Fetch the user's details from the database
    user = User.query.filter_by(username=current_user_username).first()

    if not user:
        return jsonify({'message': 'User not found'}), 404

    # Get the updated data from the request
    data = request.get_json()
    new_username = data.get('username')
    new_email = data.get('email')

    # Validate input
    if not new_username or not new_email:
        return jsonify({'message': 'Both username and email are required'}), 400

    # Check if the new username or email already exists for another user
    if User.query.filter(User.username == new_username, User.id != user.id).first():
        return jsonify({'message': 'Username already taken'}), 400

    if User.query.filter(User.email == new_email, User.id != user.id).first():
        return jsonify({'message': 'Email already taken'}), 400

    # Update the user's profile
    user.username = new_username
    user.email = new_email
    db.session.commit()

    return jsonify({'message': 'Profile updated successfully', 'profile': {
        'id': user.id,
        'username': user.username,
        'email': user.email
    }}), 200

if __name__ == '__main__':
    app.run(debug=True)
