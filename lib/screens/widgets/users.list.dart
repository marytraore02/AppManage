import 'package:flutter/material.dart';

import '../../model/user.model.dart';

class ListUsers extends StatefulWidget {

  // L'attribut qui va retourner tout les users
  List<User> users;
  ListUsers({required this.users});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {

    // Acceder a l'attribut user
    final allUsers = widget.users;

    return ListView.builder(
        itemCount: allUsers.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                child: Text(allUsers[index].name.substring(0,2).toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              title: Text(allUsers[index].name, style: TextStyle(fontSize: 22),),
              subtitle: Text(allUsers[index].age.toString()),
            ),
          );
        }
    );
  }
}
