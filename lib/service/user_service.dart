import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/d4u_error_dialog.dart';
import '../main.dart';
import '../models/user.dart';

class UserService {
  final String? documentName;
  final Map<String, dynamic>? data;

  UserService({this.documentName, this.data});

  static CollectionReference get userCollection =>
      FirebaseFirestore.instance.collection('users');

  Future<void> set(String documentName, Map<String, dynamic> data) async {
    try {
      await userCollection.doc(documentName).set(data);
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document set successfully',
        refresh: true,
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  static Future<SingleUser> getSingleUser(String documentName) async {
    SingleUser user = SingleUser();
    try {
      DocumentSnapshot snapshot = await userCollection.doc(documentName).get();
      user = SingleUser.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print(e);
    }
    return user;
  }

  static Future<List<SingleUser>> getAllUsers() async {
    List<SingleUser> users = [];
    try {
      final snapshot = await userCollection.get();
      if (snapshot.docs.isNotEmpty) {
        for (var element in snapshot.docs) {
          users
              .add(SingleUser.fromJson(element.data() as Map<String, dynamic>));
        }
      }
    } catch (e) {
      print(e);
    }
    return users;
  }

  Future<void> update(String documentName, Map<String, dynamic> data) async {
    try {
      await userCollection.doc(documentName).update(data);
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document update successfully',
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  Future<void> delete() async {
    try {
      await userCollection.doc(documentName).delete();
      showCrudDialog(
        titleMsg: 'Successful',
        contentMsg: 'Document delete successfully',
      );
    } catch (e) {
      showCrudDialog(
          titleMsg: 'Unsuccessful', contentMsg: 'Error setting document: $e');
    }
  }

  static Future<void> readAll(String collectionName) async {
    final snapshot =
        await FirebaseFirestore.instance.collection(collectionName).get();
    snapshot.docs.forEach((doc) {
      print(doc.id);
      print(doc.data());
    });
  }

  void showCrudDialog(
      {required String titleMsg, String? contentMsg, bool? refresh}) {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (context) => D4uErrorDialog(
        title: titleMsg,
        content: contentMsg,
      ),
    );
  }
}
