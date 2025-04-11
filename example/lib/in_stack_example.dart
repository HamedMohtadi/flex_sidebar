import 'package:flutter/material.dart';
import 'package:flex_sidebar/flex_sidebar.dart';

import 'package:pointer_interceptor/pointer_interceptor.dart';

class MainWidget extends StatelessWidget {
  const MainWidget(
      {super.key,
      required this.title,
      required this.currentIndex,
      required this.child});

  final String title;
  final int currentIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final flexSidebarController = FlexSidebarController();
    return Material(
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                title: Text(
                  title,
                  style: const TextStyle(
                      fontFamily: 'Yekan',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                centerTitle: true,
              ),
              body: SafeArea(child: child)),
          Positioned.directional(
            textDirection: Directionality.of(context),
            start: 0,
            top: 0,
            bottom: 0,
            child: PointerInterceptor(
              child: FlexSidebar(),
            ),
          ),
        ],
      ),
    );
  }
}
