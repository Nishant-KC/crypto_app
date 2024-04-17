import 'package:aiiongold/feature/auth/login_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/dropdown_values.dart';
import '../../../utils/image_constants.dart';
import 'button.dart';
import 'text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  DropDownValues? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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

  String? validatePasswordMatch(String? value) {
    if(value == null || value.isEmpty){
      return 'Confirm Password is required';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 3.h),
                    SizedBox(
                      height: 15.0.h,
                      width: 80.w,
                      child: Center(
                        child: Image.asset(ImageConstants.logo),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Create An account',
                      style: TextStyle(fontSize: 24.sp),
                    ),
                    SizedBox(height: 1.h),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  height: 65.h,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextFormField(
                            hintText: 'Enter Name',
                            validationString: 'Name is required',
                            regExString: "[a-zA-Z ]",
                            controller: _nameController,
                            prefixIcon: const Icon(Icons.person),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
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
                              hintStyle:
                                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.white38,
                                      ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFormField(
                            hintText: 'Enter Phone Number',
                            validationString: 'Phone number  is required',
                            regExString: "^[1-9][0-9]*\$",
                            keyboardType: TextInputType.number,
                            controller: _phoneController,
                            prefixIcon: const Icon(Icons.person),
                          ),
                          SizedBox(height: 2.h),
                          CustomTextFormField(
                            hintText: 'Enter Password',
                            validationString: 'Password is required',
                            regExString: r'.*',
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
                          SizedBox(height: 2.h),
                          TextFormField(
                            obscureText: !isConfirmPasswordVisible,
                            controller: _confirmPasswordController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: validatePasswordMatch,
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

                              prefixIcon: const Icon(Icons.key_outlined),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isConfirmPasswordVisible =
                                      !isConfirmPasswordVisible;
                                    });
                                  },
                                  icon: !isConfirmPasswordVisible
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                              hintText: 'Confirm Password',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                color: Colors.white38,
                              ),
                            ),
                          ),
                          // CustomTextFormField(
                          //   hintText: 'Confirm Password',
                          //   validationString: 'Password is required',
                          //   regExString: "^[a-zA-Z0-9]*\$",
                          //   controller: _confirmPasswordController,
                          //   isPassword: isConfirmPasswordVisible,
                          //   prefixIcon: const Icon(Icons.key_outlined),
                          //   suffixIcon: IconButton(
                          //       onPressed: () {
                          //         setState(() {
                          //           isConfirmPasswordVisible =
                          //               !isConfirmPasswordVisible;
                          //         });
                          //       },
                          //       icon: !isConfirmPasswordVisible
                          //           ? const Icon(Icons.visibility_off)
                          //           : const Icon(Icons.visibility)),
                          // ),
                          SizedBox(
                            height: 2.h,
                          ),
                          DropdownSearch<DropDownValues?>(
                            items: countriesList,
                            popupProps: PopupProps.menu(
                              constraints: const BoxConstraints(
                                maxHeight: 150,
                              ),
                              itemBuilder:
                                  (context, DropDownValues? item, isSelected) =>
                                      Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 12),
                                child: Text(
                                  item!.name,
                                  style: _selectedCountry == item
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: Colors.deepPurpleAccent)
                                      : Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              menuProps: const MenuProps(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                            validator: (value) =>
                                value == null ? "Please select the country" : null,
                            onChanged: (DropDownValues? value) {
                              _selectedCountry = value;
                            },
                            selectedItem: _selectedCountry,
                            itemAsString: (DropDownValues? item) => item!.name,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                              prefixIcon: const Icon(Icons.language_outlined),
                              isDense: true,
                              hintText: 'Select Country',
                              hintStyle:
                                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        color: Colors.white38,
                                      ),
                              focusColor: Colors.black,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 16),
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
                              // errorText: errorText,
                            )),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          LoadingAnimatedButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
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
                            height: 3.h,
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
                                      Navigator.pop(
                                          context);
                                    },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
