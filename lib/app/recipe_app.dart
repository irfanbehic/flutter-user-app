// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: "Recipe App"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
   
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height ;
    final double screenWidth = screenInfo.size.width ;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              child: Image.asset("images/yemekresim.jpeg")
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                        height: screenWidth / 9 ,
                        width: screenWidth / 3,                    
                      child: TextButton(
                        child: RecipeText("Like",screenWidth / 25),
                        onPressed: () => print("Liked"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                        height: screenWidth / 9 ,
                        width: screenWidth / 3,                   
                      child: TextButton(
                        child: RecipeText("Favourite",screenWidth / 25),
                        onPressed: () => print("Favourited"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: screenWidth / 9 ,
                      width: screenWidth / 3,
                      child: TextButton(
                        child: RecipeText("Comment",screenWidth / 25),
                        onPressed: () => print("Commented"),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrangeAccent,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight / 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Meatball",style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth / 20 ,
                      ),
                    ),
                    Row(
                      children: [
                        RecipeText("Suitable for Cooking on the Grill", screenWidth / 25,),
                        Spacer(),
                        RecipeText("August 8", screenWidth / 25)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenHeight / 100),
                child: RecipeText("Preheat the Grill: Preheat the grill over medium-high heat."
                  "Prepare Meatball Mixture: In a large mixing bowl, combine ground beef, bread crumbs, finely chopped onion, crushed garlic, salt, pepper, and optional Italian seasoning."
                  "Shape the Meatballs: Take pieces from the mixture and shape them into meatballs by rolling them."
                  "Oil the Grill: Oil the grill grate with olive oil or spray it with cooking spray to prevent sticking."
                  "Place the Meatballs on the Grill: Place the meatballs you prepared on the grill and cook for about 10-12 minutes, turning them occasionally."
                  "Check Cooking Status: Use a meat thermometer to check the internal temperature of the meatballs."
                  "Optional: Spread BBQ Sauce: If desired, brush the meatballs with your favorite BBQ sauce in the last few minutes."
                  "Serving: When cooking is complete, remove the meatballs from the grill and let them rest for a few minutes.", screenWidth/25,),
              )
                          ],
        ),
      )
    );
  }
}
class RecipeText extends StatelessWidget {
  String recipeContent ;
  double RecipeTextSize ;
  RecipeText(this.recipeContent,this.RecipeTextSize);

  @override
  Widget build(BuildContext context) {
    return Text(recipeContent,style: TextStyle(fontSize: RecipeTextSize),);
  }
}
