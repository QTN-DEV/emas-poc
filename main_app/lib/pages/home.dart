import 'package:flutter/material.dart';
import 'package:main_app/components/bn_mini_apps_card.dart';
import 'package:main_app/components/brunei_wx_home_card.dart';

class BNHomePage extends StatefulWidget {
  const BNHomePage({super.key});

  @override
  State<StatefulWidget> createState() => BNHomePageState();
}

class BNHomePageState extends State<BNHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: BruneiWXHomeCard()),
        SliverToBoxAdapter(
          child: Wrap(
            direction: Axis.vertical,
            spacing: 16,
            children: [
              BNMiniAppsCard(),
            ],
          ),
        ),
      ],
    );
  }
}