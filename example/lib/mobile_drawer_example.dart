import 'package:flex_sidebar/flex_sidebar.dart';
import 'package:flutter/material.dart';

class MobileDrawerExample extends StatefulWidget {
  const MobileDrawerExample({super.key});

  @override
  State<MobileDrawerExample> createState() => _MobileDrawerExampleState();
}

class _MobileDrawerExampleState extends State<MobileDrawerExample> {
  String label = "Selected Item";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SafeArea(
        child: FlexSidebar(
          controller: FlexSidebarController(),
          theme: FlexThemeData(
              itemThemeData: FlexItemThemeData(
                  itemPadding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 10))),
          items: [
            FlexSidebarItem(
              icon: Icon(Icons.import_contacts),
              onTap: () {
                setState(() {
                  label = "Selected Item";
                });
              },
              label: Text("selected Item"),
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
                  itemPadding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 10)),
            ),
          ],
          primaryWidget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 200, child: Image.asset('assets/images/person.png')),
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
      body: Expanded(
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 53, color: Theme.of(context).hintColor),
          ),
        ),
      ),
    );
  }
}
