import 'package:flutter/material.dart';
import 'package:recipe_bank/data.dart';
import 'package:recipe_bank/recipe.dart';
import 'package:recipe_bank/recipeWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Recipe Bank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sizedBoxWidth = screenSize.width*.8;

    List<Recipe> allRecipes = Recipe.fetchAll();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: sizedBoxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  ListView.builder (
                      shrinkWrap: true,
                      itemCount: allRecipes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: RecipeWidget(
                            recipe: allRecipes[index],
                            index: index,
                            deleteRecipe: deleteRecipe,
                          )
                        );
                      },
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
      ),
    );
  }

  void deleteRecipe(int index) {
    setState(() {
      Recipe.delete(index);
    });
  }
}
