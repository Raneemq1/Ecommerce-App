import 'package:ecommerce_app/views/widgets/categories_tap_widget.dart';
import 'package:ecommerce_app/views/widgets/home_tap_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(tabs: <Widget>[
              Tab(child: Text('Home')),
              Tab(
                child: Text('Categories'),
              )
            ]),
            Expanded(
              child: TabBarView(children: <Widget>[
                HomeTap(),
                CategoriesTap(),
              ]),
            )
          ],
        ));
  }
}
