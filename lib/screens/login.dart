import 'package:flutter/material.dart';
import 'package:flutter_with_provider_state_management/provider/authprovider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: Text('Login Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 30),
            InkWell(
              onTap: () {
                authProvider.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: authProvider.loading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
