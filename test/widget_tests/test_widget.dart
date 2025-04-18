import 'package:flex_sidebar/flex_sidebar.dart';
import 'package:flutter/material.dart';

Widget testFlexSideBar(bool isPinned) => MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            const Placeholder(),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: FlexSidebar(
                controller: FlexSidebarController(pinned: isPinned),
                items: const [
                  FlexSidebarItem(
                      icon: Icon(Icons.abc),
                      label: Text("test FlexSidebar Item"))
                ],
                primaryWidget: Placeholder(),
                secondaryWidget: const Text("Secondary Widget"),
              ),
            )
          ],
        ),
      ),
    );
