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
              body: SafeArea(
                  child: Center(
            child: Container(
                color: Theme.of(context).primaryColor.withAlpha(100),
                child: Center(
                  child: Text(
                    "Item 1",
                    style: TextStyle(
                        fontSize: 53, color: Theme.of(context).hintColor),
                  ),
                )),
          ))),
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
                  child: SizedBox(
                      width: 200,
                      child: Image.asset('assets/images/person.png')),
                ),
                secondaryWidget: Column(
                  children: [
                    Text(
                      "title",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      "This can be a description",
                      style: TextStyle(color: Theme.of(context).dividerColor),
                    ),
                    Text(
                      "another description!",
                      style: TextStyle(
                          color: Theme.of(context).dividerColor.withAlpha(200)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
