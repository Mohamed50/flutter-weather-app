import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/widgets/home/gradient_background.dart';
import 'package:weather_app/view/widgets/home/header.dart';
import 'package:weather_app/view/widgets/home/week_tab_view.dart';
import 'package:weather_app/view/widgets/location_checker.dart';
import 'package:weather_app/viewModel/day_view_model.dart';
import 'widgets/home/weak_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<DayViewModel>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 8);
    _tabController.addListener(_handleIndexChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        padding: const EdgeInsets.all(16.0),
        child: LocationChecker(
          child: Column(
            children: [
              Header(),
              Expanded(child: WeekTabView(tabController: _tabController)),
              WeekTabBar(
                tabController: _tabController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleIndexChanged() {
    if (!_tabController.indexIsChanging &&
        _tabController.index != _tabController.previousIndex) {
      controller.onTabViewChanged(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
