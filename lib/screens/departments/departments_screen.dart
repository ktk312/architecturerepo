import 'package:cleanarchwithprovider/screens/users/users_screen.dart';
import 'package:cleanarchwithprovider/state/departments_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DepartmentsProvider>(
        builder: (context, departmentP, child) {
      departmentP.getDepartments();
      return Scaffold(
          body: departmentP.departmentsList.isEmpty
              ? const Center(
                  child: Text('No departments found'),
                )
              : ListView.separated(
                  itemCount: departmentP.departmentsList.length,
                  itemBuilder: (context, index) {
                    final department = departmentP.departmentsList[index];
                    return ListTile(
                      title: Text(department.name),
                      leading: Text(department.id.toString()),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UsersScreen(
                                    departmentID: department.id.toString())));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 10,
                      color: Colors.black,
                    );
                  },
                ));
    });
  }
}
