import 'dart:convert';
import 'package:apollocode_flutter_utilities/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:live_tester/src/configs/environment.dart';
import 'package:http/http.dart' as http;

class AdminUsersService {
  static const endpoint = 'users';

  static Future<List<UserInfo>> getUsers() async {
    final token = await Auth.getToken();
    if (token == null) {
      throw ErrorDescription('Not authorized');
    }
    try {
      return await http.get(
        Uri.parse('$apiUrl/$apiVersion/admin/$endpoint'),
        headers: {
          'authorization': 'Bearer $token',
          'content-type': 'application/json',
          'x-auth-token': apiToken,
        },
      ).then((response) async {
        switch (response.statusCode) {
          case 200:
            final data = jsonDecode(response.body)['data'];
            final users = <UserInfo>[];
            for (var i = 0; i < data.length; i++) {
              final entry = data[i] as Map<String, dynamic>;
              users.add(
                UserInfo(
                  entry.cast<String, String?>(),
                ),
              );
            }
            return users;
          default:
            throw ErrorDescription('Failed to get users.');
        }
      });
    } on Exception {
      throw ErrorDescription('Failed to get users.');
    }
  }

  static Future<bool> setAdmin(String userUid) async {
    var token = await Auth.getToken();
    if (token == null) {
      throw ErrorDescription('Not authorized');
    }
    try {
      return await http
          .patch(
        Uri.parse('$apiUrl/$apiVersion/admin/$endpoint/role/$userUid'),
        headers: {
          'authorization': 'Bearer $token',
          'content-type': 'application/json',
          'x-auth-token': apiToken,
        },
        body: jsonEncode({
          'role': 'admin',
        }),
      )
          .then((response) async {
        switch (response.statusCode) {
          case 200:
            return true;
          default:
            throw ErrorDescription('Failed to set as admin.');
        }
      });
    } on Exception {
      throw ErrorDescription('Failed to set as admin.');
    }
  }
}
