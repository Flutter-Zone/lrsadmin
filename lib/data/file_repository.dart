import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FileRepository {
  final FirebaseStorage _firebaseStorage;

  FileRepository(this._firebaseStorage);

  Future uploadFile(File file) async {
    final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final UploadTask uploadTask =
        _firebaseStorage.ref("images/$fileName").putFile(file);

    final storageTaskSnapshot = await uploadTask;
    return storageTaskSnapshot.ref.getDownloadURL();
  }
}
