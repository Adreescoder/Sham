import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sham/screens/sign_in/logic.dart';
import 'package:sham/screens/sign_in/view.dart';

import 'logic.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final SignupLogic controller = Get.put(SignupLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE3E3),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            decoration: _boxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader("Welcome!", "Sign up to continue"),
                _buildTextField("Name", controller.nameController),
                _buildTextField("Email", controller.emailController),
                _buildObscureTextField("Phone Number", controller.phoneController, controller.isPhoneHidden),
                _buildObscureTextField("Password", controller.passwordController, controller.isPasswordHidden),
                _buildObscureTextField("Confirm Password", controller.confirmPasswordController, controller.isConfirmPasswordHidden),
                _buildTermsCheckbox(),
                _buildButton("Sign up", () {
                  controller.signUp();
                }),
                _buildSwitchAuth("Already have an account? Sign In", SignInPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
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

  Widget _buildObscureTextField(String label, TextEditingController controller, RxBool isHidden) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Obx(
            () => TextField(
          controller: controller,
          obscureText: isHidden.value,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Color(0xFFFFCCCC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isHidden.value ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                isHidden.value = !isHidden.value;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsCheckbox() {
    return Obx(
          () => Row(
        children: [
          Checkbox(
            value: controller.isChecked.value,
            onChanged: (bool? value) {
              controller.isChecked.value = value ?? false;
            },
            activeColor: Color(0xFFC44D4D),
          ),
          Expanded(
            child: Text(
              "By signing up you agree to our terms & conditions and privacy policy",
              style: TextStyle(color: Colors.grey[700], fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Obx(
          () => SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: controller.isChecked.value && !controller.isLoading.value ? onPressed : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFC44D4D),
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: controller.isLoading.value
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
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