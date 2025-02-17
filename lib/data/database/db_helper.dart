import 'dart:collection';

import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/user_data_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  // glbal static variable for table and columns

  // User table
  static const String USER_TABLE = 'user';
  static const String COLUMN_USER_ID = 'user_id';
  static const String COLUMN_USER_NAME = 'user_name';
  static const String COLUMN_USER_EMAIL = 'user_email';
  static const String COLUMN_USER_PASSWORD = 'user_password';
  static const String COLUMN_USER_PHONE_NO = 'user_phoneNo';
  static const String COLUMN_USER_CREATED_AT = 'user_created_at';
  // static const String COLUMN_USER_CREATED = 'user_created_at';

  // Expense table
  static const String EXPENSE_TABLE = 'expense';
  static const String COLUMN_EXPENSE_ID = 'expense_id';
  static const String COLUMN_EXPENSE_TITLE = 'expense_title';
  static const String COLUMN_EXPENSE_DESCRIPTION = 'expense_description';
  static const String COLUMN_EXPENSE_AMOUNT = 'expense_amount';
  static const String COLUMN_EXPENSE_BALANCE = 'expense_balance';
  static const String COLUMN_EXPENSE_DATE = 'expense_date';
  static const String COLUMN_FK_USER_ID = 'user_id';
  static const String COLUMN_EXPENSE_TYPE = 'expense_type'; // to define it's debit or credit
  static const String COLUMN_EXPENSE_CATEGORY_ID = 'expense_category_id';

  // Category table
  static const String CATEGORY_TABLE = 'category';
  static const String CATEGORY_ID = 'category_id';
  static const String CATEGORY_TITLE = 'category_title';
  static const String CATEGORY_IMAGE = 'category_image';
  

// to privatize the constructor
  DBHelper._();

// Singleton Object
  static DBHelper getInstense() => DBHelper._();

  Database? mDB;

  Future<Database> getDB () async {
    // if(mDB != null){
    //   return mDB!;
    // } else {
    //   mDB = await openDB();
    //   return mDB!;
    // }
    // ? : Else -> This is more sorter version than previous
    // return mDB!= null ? mDB! : await openDB();
    // we can make it one line -> This is most sorter version
    return mDB ??= await openDB();
  }
  // Step 1 -> Open DB if created ?? then open, if Not then first create DB then open
  Future<Database> openDB()async{
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");
    return await openDatabase(dbPath,version: 1, onCreate: (db , version){

      // user table creation
      db.execute(
        'CREATE TABLE $USER_TABLE ($COLUMN_USER_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_USER_NAME TEXT NOT NULL, $COLUMN_USER_EMAIL TEXT NOT NULL, $COLUMN_USER_PASSWORD TEXT NOT NULL, $COLUMN_USER_PHONE_NO INTEGER NOT NULL, $COLUMN_USER_CREATED_AT TEXT)'
      );

      // Expense table creation
      db.execute(
        'CREATE TABLE $EXPENSE_TABLE ($COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_EXPENSE_TITLE TEXT NOT NULL, $COLUMN_EXPENSE_DESCRIPTION TEXT, $COLUMN_EXPENSE_AMOUNT REAL NOT NULL, $COLUMN_EXPENSE_BALANCE REAL, $COLUMN_EXPENSE_DATE TEXT NOT NULL, $COLUMN_FK_USER_ID INTEGER NOT NULL, $COLUMN_EXPENSE_TYPE TEXT, $COLUMN_EXPENSE_CATEGORY_ID INTEGER NOT NULL)'
      );

      // Category table creation
      // db.execute(
      //   'CREATE TABLE $USER_TABLE ($CATEGORY_ID INTEGER PRIMARY KEY AUTOINCREMENT, $CATEGORY_TITLE TEXT NOT NULL, $CATEGORY_IMAGE BLOB)'
      // );
    });
  }

  // Queries for Auth Model

  // Check the user already registered or not
  Future<bool> isAlreadyRegistered({required String email, required int phoneNO}) async {
    Database db = await getDB();

    List<Map<String , dynamic>> userData = await db.query(USER_TABLE, where: "$COLUMN_USER_EMAIL = ? OR $COLUMN_USER_PHONE_NO  = ?" , whereArgs: [email, phoneNO]);
    return userData.isNotEmpty;
  }

  // Add user data in database
  Future<bool> registerUser({required UserDataModel userModel}) async {
    Database db = await getDB();

    int rowsEffected = await db.insert(USER_TABLE, userModel.toMap());
    return rowsEffected>0;
  }

  // Authenticate uer details
  Future<bool> authenticateUser({required String email, required String password}) async {
    Database db = await getDB();

    List<Map<String, dynamic>> userData = await db.query(USER_TABLE, where: '$COLUMN_USER_EMAIL = ? AND $COLUMN_USER_PASSWORD = ?', whereArgs: [email, password]);

    // to manage session store UID in shared preference
    if(userData.isNotEmpty){
      // var preference = await SharedPreferences.getInstance();
      // preference.setInt('UID', userData[0][COLUMN_USER_ID]);
      // preference.setInt('username', userData[0][U]);
      setUID(UserDataModel.fromMap(userData[0]).uId);
    }
    return userData.isNotEmpty;
  }

  Future<List<UserDataModel>> fetchAllData() async {
    var db = await getDB();
    var sprefer = await SharedPreferences.getInstance();
    int uID = sprefer.getInt('UID') ?? 0;
    List<Map<String, dynamic>> mData = await db.query(USER_TABLE, where: "$COLUMN_USER_ID = ?", whereArgs: [uID]);
    List<UserDataModel> userInfo = [];
    for(int i=0; i<mData.length; i++){
      UserDataModel dataModel = UserDataModel.fromMap(mData[i]);
      userInfo.add(dataModel);
    }
    return userInfo;
  }


  // Queries for Expenses

  // Add expenses
  Future<bool> addExpense ({required ExpenseDataModel newExpense}) async {
    var db = await getDB();
    // var sprefer = await SharedPreferences.getInstance();
    // int uID = sprefer.getInt('UID') ?? 0;
    int uid = await getUID();
    newExpense.uId = uid;
    int rowsEffected = await db.insert(EXPENSE_TABLE, newExpense.toMap(),);
    return rowsEffected > 0;
  }

  // Fetch data from database
  Future<List<ExpenseDataModel>> fetchAllExpenses() async {
    var db = await getDB();
    var sprefer = await SharedPreferences.getInstance();
    int uID = sprefer.getInt('UID') ?? 0;
    // int uID = await getUID();
    List<Map<String, dynamic>> mData = await db.query(EXPENSE_TABLE, orderBy: "$COLUMN_EXPENSE_DATE DESC", where: "$COLUMN_USER_ID = ?", whereArgs: [uID]);
    List<ExpenseDataModel> expenses = [];
    for(int i=0; i<mData.length; i++){
      ExpenseDataModel dataModel = ExpenseDataModel.fromMap(mData[i]);
      expenses.add(dataModel);
    }
    return expenses;
  }

  // get UID
  Future<int> getUID() async{
    var sprefer = await SharedPreferences.getInstance();
    return sprefer.getInt('UID')!;
  }

  // set UID
  void setUID(int uid) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt("UID", uid);
  }
}