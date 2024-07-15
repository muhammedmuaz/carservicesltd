import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:services_app/controllers/login_controller.dart';

class ForgtPasswordScreen extends StatefulWidget {
  final bool isChangePass;
  const ForgtPasswordScreen({this.isChangePass = false});
  @override
  _ForgtPasswordScreenState createState() => _ForgtPasswordScreenState();
}

class _ForgtPasswordScreenState extends State<ForgtPasswordScreen>
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
                  color: Color(0xffFFAC19),
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
                  color: Color(0xffFFAC19),
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
                            // Image.asset('assets/logo.png'),
                            Text(
                                widget.isChangePass
                                    ? 'Change Password'
                                    : 'Forgot Password',
                                style: GoogleFonts.actor(
                                  color: Colors.black,
                                  letterSpacing: 2,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                )
                                // TextStyle(
                                //   color: Colors.black,
                                //   fontFamily: 'Quicksand',
                                //   letterSpacing: 2,
                                //   fontSize: 32,
                                //   fontWeight: FontWeight.bold,
                                // ),
                                ),
                            // const SizedBox(height: 10.0),
                            TextFormField(
                              controller: controller.emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            RoundedLoadingButton(
                              color: const Color(0xff00DFA2),
                              width: 70,
                              elevation: 4.0,
                              borderRadius: 10.0,
                              controller: controller.signUpButtonController,
                              onPressed: () async => await controller.forgot(),
                              child: const Text('SUBMIT',
                                  style: TextStyle(color: Colors.white)),
                            ),

                            const SizedBox(height: 10.0),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     TextButton(
                            //       onPressed: () {
                            //         launchUrl(Uri.parse(
                            //             'https://carservicesltd.com/'));
                            //       },
                            //       child: const Text(
                            //         'Create an Account',
                            //         style: TextStyle(
                            //           color: Color(0xff00DFA2),
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //     TextButton(
                            //       onPressed: () => Get.to(const HomePage()),
                            //       child: const Text(
                            //         'Forgot Password?',
                            //         style: TextStyle(
                            //           color: Color(0xff00DFA2),
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
