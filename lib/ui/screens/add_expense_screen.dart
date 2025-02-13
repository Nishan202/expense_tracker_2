import 'package:expense_tracker_2/data/remote/models/category_data_model.dart';
import 'package:expense_tracker_2/data/remote/models/expense_data_model.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_event_bloc.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:expense_tracker_2/ui/widgets/custom_button.dart';
import 'package:expense_tracker_2/ui/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  // List<String> categoryList = CategoryIcons.mCategory.map((category) => category.title).toList();

  List<String> expenseType = ['Select type', 'Debit', 'Credit'];
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  int cateSelectedId = -1;
  DateTime? _selectedDate;
  String selectedExpenseType = 'Select type';
  String selectedCategoryType = 'Parking';
  DateFormat dateFormatter = DateFormat.yMMMd();

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = DateTime.tryParse(pickedDate!.toIso8601String());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Add Expenses'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
        child: Column(
          children: [
            CustomTextfield(labelText: 'Title', controller: _titleController),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
                labelText: 'Description', controller: _descriptionController),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '\$ ',
                      label: Text('Amount'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'No date selected'
                            : dateFormatter.format(_selectedDate!),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Expanded(
                DropdownMenu(
                  menuHeight: 250,
                  onSelected: (CategoryDataModel? value) {
                    cateSelectedId = value!.cId;
                    // selectedCategoryType = value.title;
                  },
                  // width: double.infinity,
                  menuStyle: const MenuStyle(
                      // fixedSize: WidgetStatePropertyAll(10),
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 185, 193, 235))),
                  // initialSelection: ,
                  inputDecorationTheme: InputDecorationTheme(
                      fillColor: const Color.fromARGB(255, 144, 159, 242),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  dropdownMenuEntries: CategoryIcons.mCategory.map((CategoryDataModel value) {
                    return DropdownMenuEntry(value: value, label: value.title);
                  }).toList(),
                ),
                // ),
                // const Spacer(),
                // const SizedBox(width: 10,),
                // Expanded(
                DropdownMenu(
                  // width: double.infinity,
                  menuStyle: const MenuStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 185, 193, 235))),
                  inputDecorationTheme: InputDecorationTheme(
                      fillColor: const Color.fromARGB(255, 144, 159, 242),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  initialSelection: expenseType[0],
                  onSelected: (value) => selectedExpenseType = value!,
                  dropdownMenuEntries: expenseType.map((value) {
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),
                ),
                // ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: double.infinity,
                child: CustomButton(
                    title: 'Add Expense',
                    onClick: () async {
                      var prefs = await SharedPreferences.getInstance();
                      int uid = prefs.getInt('UID') ?? 0;
                      context.read<ExpenseBloc>().add(AddExpenseData(
                              expenses: ExpenseDataModel(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            amount: double.parse(_amountController.text),
                            // amount: _amountController.text.toString(),
                            balance: 0,
                            date: (_selectedDate ?? DateTime.now()).millisecondsSinceEpoch.toString(),
                            expenseType: selectedExpenseType,
                            uId: uid,
                            categoryId: cateSelectedId
                          )));
                          // Navigator.pop(context);
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Expense is added, now go to home screen')));
                      // BlocProvider.of<ExpenseBloc>(context).add(AddExpenseData(expenses: expenses))
                    })),
          ],
        ),
      ),
    );
  }
}
