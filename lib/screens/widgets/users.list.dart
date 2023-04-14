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

    // Les controller recuperer les infos
    final _ctrupdatename = TextEditingController();
    final _ctrupdateage = TextEditingController();

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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>AlertDialog(
                            title: Text('Update: ${allUsers[index].name}'),
                            content: SingleChildScrollView(
                              child: Container(
                                height: 250,
                                child: Column(
                                  children: [
                                    TextField(
                                      style: TextStyle(fontSize: 22, color: Colors.pink),
                                      decoration: InputDecoration(labelText: 'Name',
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                                      controller: _ctrupdatename
                                    ),
                                    SizedBox(height: 20,),
                                    TextField(
                                      style: TextStyle(fontSize: 22, color: Colors.pink),
                                      decoration: InputDecoration(labelText: 'Age',
                                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))),
                                      controller: _ctrupdateage
                                    ),
                                    SizedBox(height: 20,),
                                    ElevatedButton(
                                        onPressed: (){},
                                        child: Container(
                                          width: double.infinity,
                                          child: Text('Update'),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context, 'Annuler');
                                  },
                                  child: Text('Annuler'))
                            ],
                          ),
                      );
                    },
                    child: Icon(Icons.edit, size: 32, color: Colors.green),
                  ),
                  TextButton(
                    onPressed: (){},
                    child: Icon(Icons.delete, size: 32, color: Colors.red),
                  ),
                ],
              )
            ),
          );
        }
    );
  }
}
