import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter_dev/models/models.dart';
import 'package:flutter_dev/ui/auth/auth.dart';
import 'package:flutter_dev/ui/ui.dart';
import 'package:flutter_dev/ui/components/components.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  String labels;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxBool admin = false.obs;

  @override
  void onReady() async {
    //run every time auth state changes
    // ever(firebaseUser, handleAuthChanged);
    // firebaseUser.value = await getUser;
    // firebaseUser.bindStream(user);
    handleAuthChanged(true);
    super.onReady();
  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

  handleAuthChanged(isNotLogin) async {
    if (isNotLogin) {
      Get.offAll(SignInUI());
    } else {
      Get.offAll(HomeUI());
    }
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword(BuildContext context) async {
    showLoadingIndicator();
    try {} catch (error) {
      hideLoadingIndicator();
    }
  }

  //password reset email
  Future<void> sendPasswordResetEmail(BuildContext context) async {}

  //check if user is an admin user
  isAdmin() async {}

  // Sign out
  Future<void> signOut() {}
}
