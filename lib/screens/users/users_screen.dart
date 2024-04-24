import 'package:cleanarchwithprovider/state/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  final String departmentID;
  const UsersScreen({required this.departmentID, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UsersProvider>(builder: (context, usersP, child) {
      usersP.getUsers(departmentID);
      return Scaffold(
          body: usersP.usersList.isEmpty
              ? const Center(
                  child: Text('No users found'),
                )
              : ListView.separated(
                  itemCount: usersP.usersList.length,
                  itemBuilder: (context, index) {
                    final user = usersP.usersList[index];
                    return ListTile(
                      title: Text('${user.firstName} ${user.lastName}'),
                      leading: Text(user.id.toString()),
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
