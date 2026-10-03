import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String name = 'Jane Doe';
  String email = 'jane.doe@email.com';
  String age = '28';
  String username = '@jane_doe';
  String bio = '';

  void updateProfile({
    required String newName,
    required String newEmail,
    required String newAge,
    required String newUsername,
    required String newBio,
  }) {
    name = newName;
    email = newEmail;
    age = newAge;
    username = newUsername;
    bio = newBio;

    notifyListeners();
  }
}