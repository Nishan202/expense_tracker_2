import 'package:d_chart/commons/data_model/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:expense_tracker_2/data/remote/models/expense_filter_model.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_event_bloc.dart';
import 'package:expense_tracker_2/data/state_management/expense/expense_state_bloc.dart';
import 'package:expense_tracker_2/ui/widgets/statistics_expense_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  List<String> monthDropdownMenu = <String>[
    'This Month',
    'February',
    'March',
    'April'
  ];

  List<String> graphDropdownMenu = <String>[
    'Week',
    'Month',
    'Year'
  ];


  List<Map<String, dynamic>> expeseDetails = [
    {
      "icon": Icons.shopping_cart,
      "title": "Shop Lorem ipsum",
      "color": Colors.blue[300],
      "amount": -50,
    },
    {
      "icon": Icons.phone_iphone,
      "title": "Mobile",
      "color": Colors.green[200],
      "amount": -120,
    },
    {
      "icon": Icons.bike_scooter,
      "title": "bike",
      "color": Colors.yellow[100],
      "amount": -2000,
    },
    {
      "icon": Icons.movie,
      "title": "Movie",
      "color": Colors.orange[100],
      "amount": -20,
    },
    {
      "icon": Icons.food_bank,
      "title": "Food",
      "color": Colors.pink[100],
      "amount": -10,
    },
    {
      "icon": Icons.airlines,
      "title": "Flight ticket Lorem ipsum",
      "color": Colors.indigo[300],
      "amount": -10,
    }
  ];

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchFilteredExpenses(filterType: 0));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Statistics',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // DropdownButton<String>(
                  //   value: dropDownValue,
                  //   items: month.map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       dropDownValue = value!;
                  //     });
                  //   },
                  // ),
                  DropdownMenu(
                    initialSelection: monthDropdownMenu[0],
                    dropdownMenuEntries: monthDropdownMenu.map((value) {
                      return DropdownMenuEntry(value: value, label: value);
                    }).toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF4C61DB),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total expense',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: 30, // Set the width of the circle
                          height: 30, // Set the height of the circle
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent, // Circle color
                            shape:
                                BoxShape.circle, // Makes the container circular
                          ),
                          child: Center(
                            child: Icon(
                              Icons.more_horiz, // The "..." icon
                              color: Colors.white, // Set the color of the dots
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          '\$3,734',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          '/ \$4000 per month',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
          
                    // Linear percentage Progress bar
                    // LinearPercentIndicator(
                    //   width: MediaQuery.of(context).size.width - 65,
                    //   animation: true,
                    //   lineHeight: 20.0,
                    //   animationDuration: 2500,
                    //   percent: 0.8,
                    //   center: Text("80.0%"),
                    //   barRadius: Radius.circular(10),
                    //   progressColor: Colors.green,
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Expense breakdown',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  // DropdownButton<String>(
                  //   value: dropDownValue,
                  //   items: month.map<DropdownMenuItem<String>>((String value) {
                  //     return DropdownMenuItem<String>(
                  //       value: value,
                  //       child: Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       dropDownValue = value!;
                  //     });
                  //   },
                  // ),
                  DropdownMenu(initialSelection: graphDropdownMenu[0], dropdownMenuEntries: graphDropdownMenu.map((value){
                    return DropdownMenuEntry(value: value, label: value);
                  }).toList(),)
                ],
              ),
              Text(
                'Limit \$900 / week',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 250,
              ),
              // Bar chart
              // BlocBuilder<ExpenseBloc, ExpenseStateBloc>(builder: (ctx, state){
              //   if(state is ExpenseFilterLoadedState){
              //     List<OrdinalGroup> mList = [];
              //     OrdinalGroup singleData;
              //     for(ExpenseFilterModel eachFilterModel in state.mFilteredExpense){
              //       // mList.add(OrdinalGroup(id: eachFilterModel.expenseType, data: eachFilterModel.balance));
              //       singleData
              //     }
              //     mList.add(singleData);
              //     return AspectRatio(aspectRatio: 16/9 , child: DChartBarO(groupList: ),);
              //   }
              //   return Container();
              // }),
              Text(
                'Spending Details',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'your experience are divided into 6 categories',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(
                height: 8,
              ),
          
              // Multi colored progress bar
              // StepProgressIndicator(
              //   totalSteps: 100,
              //   currentStep: 32,
              //   size: 8,
              //   padding: 0,
              //   selectedColor: Colors.yellow,
              //   // unselectedColor: Colors.cyan,
              //   roundedEdges: Radius.circular(10),
              //   selectedGradientColor: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [Colors.yellowAccent, Colors.deepOrange],
              //   ),
              //   unselectedGradientColor: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [Colors.black, Colors.blue],
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: expeseDetails.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 11,
                    crossAxisSpacing: 11,
                    childAspectRatio: 3 / 1),
                itemBuilder: (context, index) {
                  return StatisticsExpenseDetails(
                      icon: expeseDetails[index]['icon'],
                      color: expeseDetails[index]['color'],
                      title: expeseDetails[index]['title'],
                      amount: expeseDetails[index]['amount'].toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
