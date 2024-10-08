import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:services_app/controllers/login_controller.dart';
import 'package:services_app/views/login/sign_up.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  loginController logic = Get.put(loginController());
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _formAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
    _formAnimation = Tween<double>(begin: 100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutBack,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<loginController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -100.0,
              right: -100.0,
              child: Container(
                width: 300.0,
                height: 300.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff5a189a),
                ),
              ),
            ),
            Positioned(
              top: -50.0,
              left: -50.0,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff5a189a),
                ),
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 8.0,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0.0, _formAnimation.value),
                            child: child,
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // const SizedBox(height: 10.0),
                            Image.asset('assets/logo.png'),
                            // const Text(
                            //   'Car Services Ltd',
                            //   style: TextStyle(
                            //     color: Colors.black,
                            //     fontFamily: 'Quicksand',
                            //     letterSpacing: 2,
                            //     fontSize: 32,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // const SizedBox(height: 10.0),
                            TextFormField(
                              controller: controller.emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: controller.passController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            RoundedLoadingButton(
                              color: const Color(0xff00DFA2),
                              width: 70,
                              elevation: 4.0,
                              borderRadius: 10.0,
                              controller: controller.signUpButtonController,
                              onPressed: () => controller.login(),
                              child: const Text('LOGIN',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     print('home');
                            //     // () => Get.to(const HomePage());
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: ((context) =>
                            //                 const HomePage())));
                            //   },
                            //   style: ElevatedButton.styleFrom(
                            //     primary: const Color(0xff00DFA2),
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //     padding: const EdgeInsets.symmetric(
                            //       vertical: 16.0,
                            //     ),
                            //     animationDuration:
                            //         const Duration(milliseconds: 200),
                            //     elevation: 4.0,
                            //     shadowColor: Colors.black.withOpacity(0.2),
                            //   ),
                            //   child: const Text('LOGIN'),
                            // ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.off(const CreateAnAccount());
                                  },
                                  child: const Text(
                                    'Create an Account',
                                    style: TextStyle(
                                      color: Color(0xff00DFA2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed('/forgotPasswordPage'),
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      color: Color(0xff00DFA2),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            GestureDetector(
                              onTap: () => Get.offAllNamed('/home'),
                              child: const Text(
                                'Continue without signup',
                                style: TextStyle(
                                  color: Color(0xff00DFA2),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
