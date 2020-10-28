import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String title = routeArgs['title'];
    final String id = routeArgs['mealId'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
