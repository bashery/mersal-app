import 'package:flutter/material.dart';
import 'package:mersal/contacts.dart';

void natigatTo(context) {
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => const Contacts()), // ChatPage()),
    );
}
