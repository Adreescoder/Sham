import 'package:get/get.dart';
import 'package:sham/screens/profile/view.dart';

class SignupLogic extends GetxController {
  var isChecked = false.obs;

  void signUp() {
    if (isChecked.value) {

      Get.to(() =>ProfilePage());
      // Sign-up logic yahan add karo (Firebase/Auth API call)
      print("User signed up successfully!");
    } else {
      print("Please agree to the terms and conditions.");
    }
  }
}
