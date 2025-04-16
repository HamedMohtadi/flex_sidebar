import 'package:flutter/material.dart';
import 'package:flex_sidebar/flex_sidebar.dart';

class RtlExample extends StatefulWidget {
  const RtlExample({super.key});

  @override
  State<RtlExample> createState() => _RtlExampleState();
}

class _RtlExampleState extends State<RtlExample> {
  String label = "آیتم انتخاب شده";
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: Theme.of(context).primaryColor.withAlpha(100),
        child: Row(
          children: [
            FlexSidebar(
              controller: FlexSidebarController(),
              theme: FlexThemeData(
                  normalDecoration:
                      BoxDecoration(color: Theme.of(context).primaryColorLight),
                  minimizedDecoration:
                      BoxDecoration(color: Theme.of(context).primaryColorLight),
                  itemsAlignment: MainAxisAlignment.center),
              items: [
                FlexSidebarItem(
                  icon: Icon(Icons.import_contacts),
                  onTap: () {
                    setState(() {
                      label = "آیتم انتخاب شده";
                    });
                  },
                  label: Text("آیتم انتخاب شده"),
                ),
                FlexSidebarItem(
                  icon: Icon(Icons.import_contacts),
                  onTap: () {
                    setState(() {
                      label = "آیتم معمولی";
                    });
                  },
                  label: Text("آیتم معمولی"),
                ),
                FlexSidebarItem(
                    icon: Icon(Icons.disabled_by_default),
                    label: Text("آیتم غیر فعال")),
                FlexSidebarItem(
                  icon: Icon(Icons.dashboard_customize),
                  onTap: () {
                    setState(() {
                      label = "آیتم شخصی سازی شده";
                    });
                  },
                  label: Text("آیتم شخصی سازی شده"),
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
                    width: 200, child: Image.asset('assets/images/person.png')),
              ),
              secondaryWidget: Column(
                children: [
                  Text(
                    "عنوان",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Text(
                    "می تواند توضیحات باشد",
                    style: TextStyle(color: Theme.of(context).dividerColor),
                  ),
                  Text(
                    "کاملا بر اساس سلیقه شما ویجت اختصاصی است",
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
                  style: TextStyle(
                      fontSize: 53, color: Theme.of(context).hintColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
