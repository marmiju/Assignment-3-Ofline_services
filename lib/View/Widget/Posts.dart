import 'package:flutter/material.dart';

class posts extends StatelessWidget {
  posts({super.key, required this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: ListTile(
        title: Text(data['title']),
        subtitle: Text(data['body']),
      ),
    );
  }
}
