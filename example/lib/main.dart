import 'package:flex_sidebar_example/row_example.dart';
import 'package:flex_sidebar_example/rtl_example.dart';
import 'package:flex_sidebar_example/stack_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Directionality(
          textDirection: TextDirection.rtl, child: const RtlExample()),
    );
  }
}
