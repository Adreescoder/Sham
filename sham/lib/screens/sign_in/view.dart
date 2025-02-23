import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../signup/view.dart';
import 'logic.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final SignInLogic controller = Get.put(SignInLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE3E3),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              decoration: _boxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader("Welcome Back!", "Sign in to continue"),
                  _buildTextField("Email"),
                  _buildTextField("Password", obscureText: true),
                  _buildButton("Sign In", () {

                  }),
                  _buildSwitchAuth("Don't have an account? Sign Up", SignupPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Color(0xFFFFCCCC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFC44D4D),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildSwitchAuth(String text, Widget screen) {
    return Center(
      child: TextButton(
        onPressed: () => Get.to(() => screen),
        child: Text(text, style: TextStyle(color: Color(0xFF6B1919), fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(color: Color(0xFF6B1919), fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text(subtitle, style: TextStyle(color: Color(0xFFC44D4D), fontSize: 16, fontWeight: FontWeight.w600)),
        SizedBox(height: 16),
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 20, spreadRadius: 2, offset: Offset(0, 8)),
      ],
    );
  }
}
