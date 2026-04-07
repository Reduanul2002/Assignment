import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/recipe_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  void loadRecipes() async {
    var data = await ApiService.fetchRecipes();
    setState(() {
      recipes = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe App")),
      body: recipes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: [
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                var r = recipes[index];
                return RecipeCard(
                  title: r['title'],
                  image: r['image'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(recipe: r),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}