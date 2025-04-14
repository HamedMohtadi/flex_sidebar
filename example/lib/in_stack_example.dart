import 'package:flutter/material.dart';
import 'package:flex_sidebar/flex_sidebar.dart';

import 'package:pointer_interceptor/pointer_interceptor.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  Widget build(BuildContext context) {
    final flexSidebarController = FlexSidebarController();
    return Material(
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                title: Text(
                  "Title",
                  style: const TextStyle(
                      fontFamily: 'Yekan',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                centerTitle: true,
              ),
              body: SafeArea(child: Text("data"))),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 0,
            top: 0,
            bottom: 0,
            child: PointerInterceptor(
              child: FlexSidebar(
                controller: flexSidebarController,
                items: [
                  FlexSidebarItem(
                    icon: Icon(Icons.ac_unit_sharp),
                    onTap: () {
                      debugPrint("test");
                    },
                    label: Text("sharp"),
                  ),
                  FlexSidebarItem(
                    icon: Icon(Icons.ac_unit_sharp),
                    onTap: () {
                      debugPrint("test");
                    },
                    label: Text("sharp"),
                  ),
                ],
                primaryWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/person.png'),
                ),
                secondaryWidget: Text("data"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
