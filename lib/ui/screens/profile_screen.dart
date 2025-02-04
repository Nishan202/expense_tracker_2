import 'package:expense_tracker_2/data/models/user_data_model.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_bloc.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Profile'),
        leading: TextButton(onPressed: (){}, child: const Text('Logout')),
      ),
      body: BlocBuilder<SignupBloc, SignupStateBloc>(builder: (ctx , state){
        List<UserDataModel> allData = state.uModel;
        return allData.isNotEmpty ? ListView.builder(itemCount: allData.length, itemBuilder: (_ , index){
          return ListTile(
            title: Text(allData[index].email),
            subtitle: Text(allData[index].password),
          );
        }) : Center(child: Text('No user found'),);
      }),
    );
  }
}