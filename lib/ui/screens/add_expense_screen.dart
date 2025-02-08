import 'package:expense_tracker_2/data/models/category_data_model.dart';
import 'package:expense_tracker_2/domain/asset_management.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {

  List<String> categoryList = CategoryIcons.mCategory.map((category) => category.title).toList();

  List<String> expenseType = ['Select type','Debit', 'Credit'];
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

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
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
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
                      // Text(
                      //   _selectedDate == null
                      //       ? 'No date selected'
                      //       // : formatter.format(_selectedDate!),
                      //       : DateFormat.yM().format(_selectedDate!)
                      // ),
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
                    // width: double.infinity,
                    menuStyle: MenuStyle(
                      // fixedSize: WidgetStatePropertyAll(10),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 185, 193, 235))),
                    // initialSelection: categoryList[0],
                    inputDecorationTheme: InputDecorationTheme(
                        fillColor: Color.fromARGB(255, 144, 159, 242),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    dropdownMenuEntries: categoryList.map((value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                  ),
                // ),
                // const Spacer(),
                // const SizedBox(width: 10,),
                // Expanded(
                DropdownMenu(
                    // width: double.infinity,
                    menuStyle: MenuStyle(
                      // fixedSize: WidgetStatePropertyAll(Size.fromHeight(30)),
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 185, 193, 235))),
                    inputDecorationTheme: InputDecorationTheme(
                        fillColor: Color.fromARGB(255, 144, 159, 242),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    initialSelection: expenseType[0],
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
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent[50])),
                onPressed: () {},
                child: const Text('Save Expense'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
