import 'package:expense_tracker_2/data/models/user_data_model.dart';
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
        'CREATE TABLE $EXPENSE_TABLE ($COLUMN_EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT, $COLUMN_EXPENSE_TITLE TEXT NOT NULL, $COLUMN_EXPENSE_DESCRIPTION TEXT, $COLUMN_EXPENSE_AMOUNT REAL NOT NULL, $COLUMN_EXPENSE_BALANCE REAL, $COLUMN_EXPENSE_DATE TEXT NOT NULL, $COLUMN_FK_USER_ID INTEGER NOT NULL, FOREIGN KEY($COLUMN_FK_USER_ID) REFERENCES $USER_TABLE($COLUMN_USER_ID), $COLUMN_EXPENSE_TYPE TEXT, $COLUMN_EXPENSE_CATEGORY_ID INTEGER NOT NULL)'
      );

      // Category table creation
      // db.execute(
      //   'CREATE TABLE $USER_TABLE ($CATEGORY_ID INTEGER PRIMARY KEY AUTOINCREMENT, $CATEGORY_TITLE TEXT NOT NULL, $CATEGORY_IMAGE BLOB)'
      // );
    });
  }

/*
// Add data in Database
  Future<bool> addNote ({required DataModel newNote}) async {
    var db = await getDB();

    int rowsEffected = await db.insert(NOTE_TABLE, newNote.toMap());
    return rowsEffected > 0;
  }

// Update data in Database
  Future<bool> updateNote ({required DataModel updateNote}) async {
    var db = await getDB();

    int rowsEffected = await db.update(NOTE_TABLE, updateNote.toMap(), where: "$COLUMN_NOTE_ID = ${updateNote.id}");
    return rowsEffected > 0;
  }

  // Delete data from Database
  Future<bool> deleteNote ({required int id}) async {
    var db = await getDB();

    int rowsEffected = await db.delete(NOTE_TABLE , where: "$COLUMN_NOTE_ID = $id");
    return rowsEffected > 0;
  }

// Fetch data from Database
  Future<List<DataModel>> fetchAllData() async {
    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(NOTE_TABLE);
    List<DataModel> mNotes = [];
    for(int i=0; i<mData.length; i++){
      DataModel dataModel = DataModel.fromMap(mData[i]);
      mNotes.add(dataModel);
    }

    return mNotes;
  }
  */

  // Queries

  // Check the user already registered or not
  Future<bool> isAlreadyRegistered({required String email, required int phoneNO}) async {
    var db = await getDB();

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
      var preference = await SharedPreferences.getInstance();
      preference.setInt('UID', userData[0][COLUMN_USER_ID]);
    }
    return userData.isNotEmpty;
  }
}