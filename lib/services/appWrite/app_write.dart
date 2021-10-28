import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import '../../app_constants.dart';
import 'package:flutter/material.dart' show debugPrint;

// Singleton Patter
class AppWrite {
  final Client client = Client();
  Account? account;
  static final AppWrite _instance = AppWrite._internal();

  AppWrite._internal() {
    client.setEndpoint(AppConstants.endPoint).setProject(AppConstants.project);
    account = Account(client);
  }

  static AppWrite get instance => _instance;

  Future<User> createAccount() async {
    debugPrint("creating accout");
    return account!
        .create(email: 'me@appWrite.io', password: 'teste123', name: 'My name');
  }
}
