import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_task/models/personal_data_model.dart';

class FireStoreService {
  final db = FirebaseFirestore.instance;

  setDoc({
    required String email,
    required String password,
    required String firstName,

    required String lastName,
  }) async {
    Map<String, dynamic> user = {
      'email': email,
      'password': password,
      'name': {'first_name': firstName, 'last_name': lastName},
      'timestamp': FieldValue.serverTimestamp(),
    };

    await db.collection('users').doc(email).set(user);
  }

  updateDoc({required email}) async {
    await db.collection('users').doc(email).update({
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  _getData({required String email}) async {
    var data = await db.collection('users').doc(email).get();
    return data.data();
  }

  getPersonalData({required String email}) async {
    dynamic json = await _getData(email: email);
    return PersonalDataModel.fromJson(json);
  }

  updateData({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    await db.collection('users').doc(email).update({
      'password': password,
      'name': {'first_name': firstName, 'last_name': lastName},
    });
  }

  deleteData({required String email}) async {
    await db.collection('users').doc(email).delete();
  }
}
