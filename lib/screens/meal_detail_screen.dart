import 'package:flutter/material.dart';
import 'package:flutter_shop_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(10),
        width: 300,
        height: 200,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String title = routeArgs['title'];
    final String id = routeArgs['mealId'];
    final mealSelected = DUMMY_MEALS.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                mealSelected.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      mealSelected.ingredients[index],
                    ),
                  ),
                ),
                itemCount: mealSelected.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(mealSelected.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: mealSelected.steps.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
