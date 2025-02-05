import 'package:expense_tracker_2/data/models/user_data_model.dart';

abstract class SignupEventBloc {}

class FetchInitialData extends SignupEventBloc{}

class RegisterUser extends SignupEventBloc{
  UserDataModel user;
  RegisterUser({required this.user});
}