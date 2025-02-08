import 'package:expense_tracker_2/data/database/db_helper.dart';
import 'package:expense_tracker_2/data/models/user_data_model.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/auth/signup_state_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignupEventBloc, SignupStateBloc> {
  DBHelper dbHelper;
  SignupBloc({required this.dbHelper}) : super(SignupStateBloc(uModel: [])) {
    on<FetchInitialData>((event, emit) async {
      List<UserDataModel> currentStateValue = state.uModel;
      currentStateValue = await dbHelper.fetchAllData();
      emit(SignupStateBloc(uModel: currentStateValue));
    });
    on<RegisterUser>((event, emit) async {
      bool check = await dbHelper.registerUser(userModel: event.user);

      if (check) {
        List<UserDataModel> currentStateValue = await dbHelper.fetchAllData();
        emit(SignupStateBloc(uModel: currentStateValue));
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User successfully registered, Log in now')));
      } 
      // else {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text('Something went wrong, please try again!!')));
      // }
    });
  }
}
