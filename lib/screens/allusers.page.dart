import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_fire_app/screens/widgets/users.list.dart';
import 'package:flutter/material.dart';

import '../model/user.model.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {

    // Les donnees recuper sont dans une list d'objet users
    List<User> allUsers = [];

    return Scaffold(
      body: FutureBuilder<QuerySnapshot>(

        // Recuperation de tous les documents
        future: FirebaseFirestore.instance.collection('users').orderBy('name').get(),
        builder: (context, snp){
          if(snp.hasError){
            return Center(child: Text('Error'),);
          }
          if(snp.hasData){
            allUsers = snp.data!.docs
              .map((doc) => User.fromJson(doc.data() as Map<String, dynamic>)).toList();
            return ListUsers(users: allUsers);

          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
