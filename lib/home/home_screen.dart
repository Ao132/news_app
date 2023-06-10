import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_widget.dart';
import 'package:news_app/widgets/home_drawer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
// child: Image.asset('assets/images/main_background.png'),
//TODO back to news part1 video to see about mainbackground image
          ),
      Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.home_sc_appBar,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: const Drawer(
          child: HomeDrawer(),
        ),
        body: CategoryWidget(),
      ),
    ]);
  }
}
