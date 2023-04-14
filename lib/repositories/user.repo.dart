import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.model.dart';

Future addUser(User user) async {
  // Pour creer un document dans le FireStore
  final docUser = FirebaseFirestore.instance.collection("users").doc();

  // Pour stocker dans l'objet user
  user.id = docUser.id;

  // Le stockage de l'enregistrement
  await docUser.set(user.toJson());

}