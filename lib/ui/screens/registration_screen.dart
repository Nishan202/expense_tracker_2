import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/ui/widgets/custom_button.dart';
import 'package:expense_tracker_2/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confPasswordContoller = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: EdgeInsets.all(15), child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign Up', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
            const SizedBox(height: 20,),
            Text('Please register your account to sign in', style: TextStyle(color: Colors.grey, fontSize: 16),),
            const SizedBox(height: 30,),
            CustomTextfield(controller: _nameController, labelText: 'Name', placeholder: 'Enter your full name',),
            const SizedBox(height: 10,),
            CustomTextfield(controller: _emailController, labelText: 'Email', placeholder: 'Enter email address', inputType: TextInputType.emailAddress,),
            const SizedBox(height: 10,),
            CustomTextfield(controller: _phoneNoController, labelText: 'Phone No', placeholder: 'Enter phone no', inputType: TextInputType.number,),
            const SizedBox(height: 10,),
            CustomTextfield(controller: _passwordController, labelText: 'Password', placeholder: 'Enter password', suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off),),),
            const SizedBox(height: 10,),
            CustomTextfield(controller: _confPasswordContoller, labelText: 'Confirm password', placeholder: 'Re-Enter password', suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.visibility_off),),),
            const SizedBox(height: 30,),
            CustomButton(title: 'Sign Up', onClick: (){}),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style: TextStyle(fontSize: 16),),
                TextButton(onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN_ROUTE), child: Text('Sign in', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),),)
              ],
            )
          ],
        ),
      ),),
    );
  }
}