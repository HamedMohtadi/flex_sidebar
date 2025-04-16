import 'package:flex_sidebar_example/mobile_drawer_example.dart';
import 'package:flex_sidebar_example/row_example.dart';
import 'package:flex_sidebar_example/rtl_example.dart';
import 'package:flex_sidebar_example/stack_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          child: Text("Stack Example"),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const StackExample()),
          ),
        ),
        MaterialButton(
          child: Text("Row Example"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RowExample()),
          ),
        ),
        MaterialButton(
          child: Text("RTL Example"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: const RtlExample())),
          ),
        ),
        MaterialButton(
          child: Text("Mobile Drawer Example"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MobileDrawerExample()),
          ),
        ),
      ],
    );
  }
}
