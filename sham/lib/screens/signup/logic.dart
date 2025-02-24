import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sham/screens/profile/view.dart';

import '../../models/user.dart';

class SignupLogic extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isPhoneHidden = true.obs;
  var isPasswordHidden = true.obs;
  var isConfirmPasswordHidden = true.obs;
  var isChecked = false.obs;
  var isLoading = false.obs;

  Future<void> signUp() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }

    isLoading.value = true;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      String userId = userCredential.user!.uid;
      ShamUser newUser = ShamUser(
        id: userId,
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        imageUrl: '',
        createdAt: DateTime.now(),
        status: 'Active',
        lastSeen: DateTime.now(),
        phoneNumber: phoneController.text,
        isVerified: userCredential.user!.emailVerified,
        bio: '',
        friends: [],
      );

      await firestore.collection('ShamUsers').doc(userId).set(newUser.toJson());

      // Show success snackbar
      Get.snackbar("Success", "Signup successful!", snackPosition: SnackPosition.BOTTOM);

      // Navigate to profile page after success message
      Future.delayed(Duration(seconds: 2), () {
        Get.offAll(() => ProfilePage());
      });

    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

}
