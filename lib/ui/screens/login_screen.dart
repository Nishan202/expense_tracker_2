import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:expense_tracker_2/ui/widgets/custom_button.dart';
import 'package:expense_tracker_2/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(15), child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(Assets.login_screen_image, height: 200,),
            Align(alignment: Alignment.topLeft, child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),)),
            const SizedBox(height: 8,),
            Align(alignment: Alignment.topLeft, child: Text('Please sign in your account to get started!', style: TextStyle(color: Colors.grey, fontSize: 16),)),
            const SizedBox(height: 15,),
            CustomTextfield(controller: _emailController, labelText: 'Email',),
            const SizedBox(height: 10,),
            CustomTextfield(labelText: 'Password', controller: _passwordController),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: (){}, child: Text('Forgot password')),
            ),
            const SizedBox(height: 15,),
            CustomButton(title: 'Sign In', onClick: (){})
          ],
        ),
      ),),
    );
  }
}