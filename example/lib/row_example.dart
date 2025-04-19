import 'package:flutter/material.dart';
import 'package:flex_sidebar/flex_sidebar.dart';

class RowExample extends StatefulWidget {
  const RowExample({super.key});

  @override
  State<RowExample> createState() => _RowExampleState();
}

class _RowExampleState extends State<RowExample> {
  String label = "Selected Item";
  @override
  Widget build(BuildContext context) {
    Row(
      children: [
        FlexSidebar(
          primaryWidget: Image.asset('assets/images/header.png'),
          secondaryWidget: Text("This can be a description"),
          controller: FlexSidebarController(),
          items: [
            FlexSidebarItem(
              icon: Icon(Icons.import_contacts),
              label: Text("contacts"),
            ),
          ],
        ),
      ],
    );

    return Material(
      color: Theme.of(context).primaryColor.withAlpha(100),
      child: Row(
        children: [
          FlexSidebar(
            controller: FlexSidebarController(),
            theme: FlexThemeData(
                normalDecoration:
                    BoxDecoration(color: Theme.of(context).primaryColorLight),
                minimizedDecoration:
                    BoxDecoration(color: Theme.of(context).primaryColorLight)),
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
                  icon: Icon(
                    Icons.disabled_by_default,
                  ),
                  label: Text("disabled Item")),
              FlexSidebarItem(
                icon: Icon(
                  Icons.dashboard_customize,
                ),
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
                    itemPadding: EdgeInsetsDirectional.fromSTEB(5, 10, 0, 50)),
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
          Expanded(
            child: Center(
              child: Text(
                label,
                style:
                    TextStyle(fontSize: 53, color: Theme.of(context).hintColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
