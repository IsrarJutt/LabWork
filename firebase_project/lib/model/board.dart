import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Board {
  String key;
  String subject;
  String body;

  Board(this.subject, this.body,this.key);

  Board.fronSnapshot(DataSnapshot snapshot)
      : key = snapshot.key ??'',
        subject = snapshot.value["snapshot"],
        body = snapshot.value["body"];

  toJson() {
    return {
      "subject": subject,
      "body": body,
      "key":key
    };
  }

}