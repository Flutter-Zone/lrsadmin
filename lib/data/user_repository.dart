import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/user.dart' as ModelUser;

import 'firebase_paths.dart';

class UserRepository {
  static const UID = "uid";
  static const NAME = "name";
  static const PHONE = "phone";
  static const EMAIL = "email";
  static const IMAGE = "image";
  static const TOKEN = "token";

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  const UserRepository(
    this._firebaseAuth,
    this._firestore,
  );

  Stream<ModelUser.User> getUserStream(userId) {
    return _firestore
        .collection(FirestorePaths.PATH_USERS)
        .doc(userId)
        .snapshots()
        .map((userSnapshot) {
      return fromDoc(userSnapshot);
    });
  }

  Future<ModelUser.User> getUser(userId) async {
    final firestoreResult = _firestore
        .collection(FirestorePaths.PATH_USERS)
        .doc(userId)
        .snapshots()
        .map((userSnapshot) => fromDoc(userSnapshot));
    return await firestoreResult.first;
  }

  Stream<List<ModelUser.User>> getUsersStream() {
    return _firestore
        .collection(FirestorePaths.PATH_USERS)
        .snapshots()
        .map((userSnapshot) {
      final users = userSnapshot.docs.map(fromDoc).toList();
      return users;
    });
  }

  Stream<ModelUser.User> getAuthenticationStateChange() {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) {
      return _fromFirebaseUser(firebaseUser);
    });
  }

  Future<Map<String, dynamic>> signIn(String email, String password) async {
    bool isEmailVerified = false;
    final firebaseUser = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    final modelUser = await _fromFirebaseUser(firebaseUser.user);
    if (firebaseUser.user.emailVerified) {
      isEmailVerified = true;
    }
    return Future.value({
      "user": modelUser,
      "isVerified": isEmailVerified,
    });
  }

  Future<void> resetPassword(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<ModelUser.User> signUp(
      String email, String password, String name, String phone) async {
    final firebaseUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      await firebaseUser.user.sendEmailVerification();
    } catch (e) {}
    return await _fromFirebaseUser(firebaseUser.user, name: name, phone: phone);
  }

  Future<void> updateUser(ModelUser.User user) async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      final documentReference =
          _firestore.doc(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.update({
        NAME: user.name,
        IMAGE: user.image,
        EMAIL: user.email,
        PHONE: user.phone,
      });
    }
  }

  Future<void> changePassword(newPassword) async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser.updatePassword(newPassword);
  }

  Future<ModelUser.User> _fromFirebaseUser(User firebaseUser,
      {String name = "", String phone = ""}) async {
    if (firebaseUser == null) return Future.value(null);

    final downloadURL = await FirebaseStorage.instance
        .ref('images/avatar.png')
        .getDownloadURL();

    final DocumentReference documentReference =
        _firestore.doc(FirestorePaths.userPath(firebaseUser.uid));
    final snapshot = await documentReference.get();

    ModelUser.User user;
    if (!snapshot.exists) {
      user = ModelUser.User(
        (u) => u
          ..uid = firebaseUser.uid
          ..email = firebaseUser.email ?? ""
          ..name = name
          ..phone = phone
          ..image = downloadURL,
      );
      await documentReference.set(toMap(user));
    } else {
      user = fromDoc(snapshot);
    }
    return user;
  }

  Future<void> logOut() async {
    await updateUserToken(null);
    await _firebaseAuth.signOut();
  }

  Future<void> updateUserToken(String token) async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      final documentReference =
          _firestore.doc(FirestorePaths.userPath(firebaseUser.uid));
      return documentReference.update({
        TOKEN: token,
      });
    }
  }

  static toMap(dynamic user) {
    return {
      UID: user.uid,
      NAME: user.name,
      PHONE: user.phone,
      EMAIL: user.email,
      IMAGE: user.image,
    };
  }

  static ModelUser.User fromDoc(DocumentSnapshot document) {
    return ModelUser.User(
      (u) => u
        ..uid = document.id
        ..name = document[NAME]
        ..email = document[EMAIL]
        ..image = document[IMAGE]
        ..phone = document[PHONE],
    );
  }
}
