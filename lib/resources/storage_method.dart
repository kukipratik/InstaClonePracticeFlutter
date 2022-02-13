import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethod {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {

    //.ref() method is used to give reference to the child and child is like a folder in firebaseStorage...
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    //.putDate() is used simple to put data nothing else...
    UploadTask uploadTask = ref.putData(file);

    // Just hover ur mouse on the TaskSnapshot...bruh...
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
