import 'package:flutter/material.dart';
import 'package:flex_sidebar/flex_sidebar.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  String label = "Parent Item";
  @override
  Widget build(BuildContext context) {
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
                    label,
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
                controller: FlexSidebarController(),
                theme: FlexThemeData(itemsAlignment: MainAxisAlignment.start),
                items: [
                  FlexSidebarItem(
                    icon: Icon(Icons.import_contacts),
                    onTap: () {
                      setState(() {
                        label = "Parent Item";
                      });
                    },
                    label: Text("Parent Item"),
                    subitems: [
                      FlexSidebarItem(
                        itemThemeData: FlexItemThemeData(
                            itemPadding:
                                EdgeInsetsDirectional.fromSTEB(30, 5, 0, 5)),
                        icon: Icon(Icons.circle),
                        onTap: () {
                          setState(() {
                            label = "Sub Item 1";
                          });
                        },
                        label: Text("Sub Item 1"),
                      ),
                      FlexSidebarItem(
                        itemThemeData: FlexItemThemeData(
                            itemPadding:
                                EdgeInsetsDirectional.fromSTEB(30, 5, 0, 5)),
                        icon: Icon(Icons.circle),
                        onTap: () {
                          setState(() {
                            label = "Sub Item 2";
                          });
                        },
                        label: Text("Sub Item 2"),
                      ),
                    ],
                  ),
                  FlexSidebarItem(
                    icon: Icon(Icons.import_contacts),
                    onTap: () {
                      setState(() {
                        label = "Regular Item";
                      });
                    },
                    label: Text("regular Item"),
                  ),
                  FlexSidebarItem(
                      icon: Icon(Icons.disabled_by_default),
                      label: Text("disabled Item")),
                  FlexSidebarItem(
                    icon: Icon(Icons.dashboard_customize),
                    onTap: () {
                      setState(() {
                        label = "Custom Item";
                      });
                    },
                    label: Text("custom Item"),
                    itemThemeData: FlexItemThemeData(
                        itemColor: Theme.of(context).primaryColorDark,
                        selectedItemColor: Theme.of(context).cardColor,
                        hoverAnimColor: Theme.of(context).focusColor,
                        itemPadding:
                            EdgeInsetsDirectional.fromSTEB(5, 10, 0, 50)),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "another description!",
                        style: TextStyle(
                            color:
                                Theme.of(context).dividerColor.withAlpha(200)),
                      ),
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
