import 'package:crud_fire_app/model/user.model.dart';
import 'package:crud_fire_app/repositories/user.repo.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Pour recuperer les objets user
    final _ctrname = TextEditingController();
    final _ctrage = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextField(
                controller: _ctrname,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: _ctrage,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)))
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    // Creer un objet
                    final user = User(name: _ctrname.text, age: int.parse(_ctrage.text));
                    addUser(user);

                    // Pour vider un champ apres l'ajout d'un user
                    _ctrname.text = '';
                    _ctrage.text = '';
                  },
                  child: Container(
                    width: double.infinity, child: Icon(Icons.add, size: 32,),
                  ))

            ],
          ),
        ),
      ),
    );
  }
}
