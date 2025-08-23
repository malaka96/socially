import 'dart:io';

import 'package:flutter/material.dart';
import 'package:socially/utils/constants/colors.dart';
import 'package:socially/widgets/reusable/custom_button.dart';
import 'package:socially/widgets/reusable/custom_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(image: AssetImage("assets/logo.png"), height: 70),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            _imageFile != null
                                ? CircleAvatar(
                                    radius: 64,
                                    backgroundColor: mainPurpleColor,
                                    backgroundImage: FileImage(_imageFile!),
                                  )
                                : CircleAvatar(
                                    radius: 64,
                                    backgroundColor: mainPurpleColor,
                                    backgroundImage: NetworkImage(
                                      'https://i.stack.imgur.com/l60Hf.png',
                                    ),
                                  ),
                            Positioned(
                              bottom: -10,
                              left: 75,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_a_photo),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomInput(
                        controller: _nameController,
                        labelText: 'Name',
                        icon: Icons.person,
                        isObsecure: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomInput(
                        controller: _emailController,
                        labelText: 'Email',
                        icon: Icons.mail_outline,
                        isObsecure: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomInput(
                        controller: _jobTitleController,
                        labelText: 'Job Title',
                        icon: Icons.work,
                        isObsecure: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Job Title';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomInput(
                        controller: _passwordController,
                        labelText: 'Password',
                        icon: Icons.password,
                        isObsecure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomInput(
                        controller: _confirmPasswordController,
                        labelText: 'Confirm Password',
                        icon: Icons.password,
                        isObsecure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm the password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: 'Register',
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {},
                      ),
                      TextButton(
                        onPressed: () {
                        },
                        child: const Text(
                          'Already have an account? Log in',
                          style: TextStyle(color: mainWhiteColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
