import 'package:flutter/material.dart';
import 'package:interview_fixity/app/functions.dart';
import 'package:interview_fixity/presentation/pdf_screen.dart';
import 'package:interview_fixity/presentation/tab_bar_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
          leading:const Icon(Icons.menu),
          automaticallyImplyLeading:false,
          bottom:const TabBar(
            tabs:  [
              Tab(icon: Icon(Icons.flight)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_car)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            TabBarScreen(),
            TabBarScreen(),
            TabBarScreen(),
          ],
        ),
      )
    );
  }
}
