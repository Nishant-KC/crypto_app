import 'package:aiiongold/feature/dashboard/widgets/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../utils/image_constants.dart';
import 'widgets/button.dart';
import 'widgets/register_screen.dart';
import 'widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool isPasswordVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email is required';
    }
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      width: 80.w,
                      child: Center(
                        child: Image.asset(ImageConstants.logo),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  height: 50.h,
                  width: 99.w,
                  decoration: BoxDecoration(
                    color: Colors.white60.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.sp),
                        topRight: Radius.circular(30.sp)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: validateEmail,
                            maxLength: 50,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 16),
                              counterText: "",
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white38),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white38),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              prefixIcon: const Icon(Icons.email_outlined),
                              hintText: 'Enter email',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Colors.white38,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          CustomTextFormField(
                            hintText: 'Enter Password',
                            validationString: 'Password is required',
                            regExString: "^[a-zA-Z0-9]*\$",
                            controller: _passwordController,
                            isPassword: !isPasswordVisible,
                            prefixIcon: const Icon(Icons.key_outlined),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                                icon: !isPasswordVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      color: Colors.blueAccent[200]),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          LoadingAnimatedButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                    (route) => false);
                              }
                            },
                            borderColor: Colors.deepPurpleAccent,
                            color: Colors.blue,
                            height: 6.h,
                            width: 70.w,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 15.sp, color: Colors.blueAccent[200]),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          RichText(
                            text: TextSpan(
                              text: "New here? ", // Initial text part
                              style: TextStyle(
                                fontSize: 10.0.sp, // Specify the font size
                              ),
                              children: [
                                // Add an InlineSpan for the "Register" part
                                TextSpan(
                                  text:
                                      " Create an account", // Text for the clickable part
                                  style: TextStyle(
                                    fontSize: 10.0.sp,
                
                                    color: Colors
                                        .deepPurpleAccent, // Specify a color for the clickable part
                                  ),
                                  // Wrap the text in a GestureRecognizer to handle tap events
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen(),
                                          ));
                                    },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // child: Text('data'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
