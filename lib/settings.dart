import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solutions'),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Welcome To Solutions'),
        ),
      ),
    );
  }
}