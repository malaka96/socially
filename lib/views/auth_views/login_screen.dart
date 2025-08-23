import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socially/utils/constants/colors.dart';
import 'package:socially/widgets/reusable/custom_button.dart';
import 'package:socially/widgets/reusable/custom_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    CustomInput(
                      controller: _emailController,
                      labelText: 'Email',
                      icon: Icons.mail,
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
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Loing',
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Sign in with Google to access the app's features",
                      style: TextStyle(
                        fontSize: 13,
                        color: mainWhiteColor.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Sigin With Gooogle',
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Navigate to signup screen
                        GoRouter.of(context).go('/register');
                      },
                      child: const Text(
                        'Don\'t have an account? Sign up',
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
    );
  }
}
