import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {
  // Base URL of the API
  static const String _baseUrl =
      'https://untold-strapi.api.prod.loomi.com.br/api';

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Map<String, String>> _getAuthHeaders() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception("User is not authenticated.");
    }
    final token = await user.getIdToken();
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
  }

  Future<dynamic> login(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
      if (userCredential.user == null) {
        throw Exception("Failed to authenticate with Firebase.");
      }

      final headers = await _getAuthHeaders();

      final response = await http.get(
        Uri.parse('$_baseUrl/users/me'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception("API error: ${response.statusCode} ${response.body}");
      }

      return json.decode(response.body);
    } catch (error) {
      print("Error in login: $error");
      rethrow;
    }
  }

  Future<dynamic> register(
      String username, String email, String password, String uid) async {
    final firebaseUID = uid;

    final headers = await _getAuthHeaders();

    final body = json.encode({
      'username': username,
      'email': email,
      'password': password,
      'firebase_UID': firebaseUID,
    });

    final response = await http.post(
      Uri.parse('$_baseUrl/auth/local/register'),
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("API error: ${response.statusCode} ${response.body}");
    }

    return json.decode(response.body);
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (error) {
      print("Error during logout: $error");
      rethrow;
    }
  }

  Future<void> delete() async {
    try {
      final headers = await _getAuthHeaders();
      int userId = await getUserId();

      final response = await http.delete(
        Uri.parse('$_baseUrl/users/$userId'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception("API error: ${response.statusCode} ${response.body}");
      }
    } catch (error) {
      print("Error during delete: $error");
      rethrow;
    }
  }

  Future<int> getUserId() async {
    try {
      final headers = await _getAuthHeaders();

      final response = await http.get(
        Uri.parse('$_baseUrl/users/me'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception("API error: ${response.statusCode} ${response.body}");
      }

      return json.decode(response.body)['id'];
    } catch (error) {
      print("Error during getUserId: $error");
      rethrow;
    }
  }

  getUser() {}
}
