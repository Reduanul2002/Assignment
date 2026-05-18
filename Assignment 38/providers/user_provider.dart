import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  // Dummy Data
  final String _userName = "Reduan";
  final String _userPhone = "+880 1893-404179";
  final String _profileImageUrl = "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg"; // ডামি ইমেজ ইউআরএল

  String get userName => _userName;
  String get userPhone => _userPhone;
  String get profileImageUrl => _profileImageUrl;
}