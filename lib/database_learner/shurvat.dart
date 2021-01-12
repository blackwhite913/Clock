import 'package:expensetracker/database_learner/employee.dart';
import 'package:flutter/material.dart';
import 'database_helper.dart';


class Learn extends StatefulWidget {
  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  List<Employee> employees;
  final dbHelper= DBHelper();
  int id=0;
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
              ),
              RaisedButton(
                  child: Text("insert"),
                  onPressed: (){
                var name= controller.text;
                id++;
                final worker= Employee(id,name);
                dbHelper.save(worker);
              }),
              RaisedButton(
                  child: Text("show"),
                  onPressed: () async {
                    employees = await dbHelper.getEmployees();
                    print(employees);
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
