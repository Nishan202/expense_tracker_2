import 'package:expense_tracker_2/data/remote/models/user_data_model.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_bloc.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_state_bloc.dart';
import 'package:expense_tracker_2/data/state_management/navigation/navigation_provider.dart';
import 'package:expense_tracker_2/domain/app_routes.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    super.initState();
    context.read<SignupBloc>().add(FetchInitialData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Profile'),
            IconButton(onPressed: () async {
              var preference = await SharedPreferences.getInstance();
              preference.setInt('UID', 0);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User successfully logged out!! please Log in now')));
              // Navigator.pop(context);
              context.read<NavigationProvider>().navIndex = 0;
              Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_SCREEN_ROUTE);

            }, icon: Icon(Icons.exit_to_app_rounded)),
          ],
        )
      ),
      body: BlocBuilder<SignupBloc, SignupStateBloc>(builder: (ctx , state){
        List<UserDataModel> allData = state.uModel;
        return allData.isNotEmpty ? ListView.builder(itemCount: allData.length, itemBuilder: (_ , index){
          return Column(
            children: [
              CircleAvatar(
                maxRadius: 50,
                child: FlutterLogo(size: 50, style: FlutterLogoStyle.stacked,),
              ),
              SizedBox(height: 30,),
              Text('Personal information', textAlign: TextAlign.start, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("Name"),
                subtitle: Text(allData[index].name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                // trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              ),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.email),),
                title: Text("Email"),
                subtitle: Text(allData[index].email, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
              ),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.phone),),
                title: Text("Phone No"),
                subtitle: Text(allData[index].phoneNo.toString(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),),
                // trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
              )
            ],
          );
        }) : Center(child: Text('No user found'),);
      }),
    );
  }
}