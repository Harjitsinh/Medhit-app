import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/category_card.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  final List<Map<String, String>> dietPlans = const [
    {
      "title": "Balanced Breakfast",
      "icon": "assets/icons/Hamburger.svg",
      "description":
          "Oatmeal with fresh fruits, nuts, and a cup of green tea to kickstart metabolism."
    },
    {
      "title": "Protein Rich Lunch",
      "icon": "assets/icons/Hamburger.svg",
      "description":
          "Grilled chicken or tofu with quinoa, mixed vegetables, and a side salad."
    },
    {
      "title": "Light Snack",
      "icon": "assets/icons/Hamburger.svg",
      "description":
          "A handful of almonds or walnuts with a fruit like apple or banana."
    },
    {
      "title": "Dinner Detox",
      "icon": "assets/icons/Hamburger.svg",
      "description":
          "Steamed vegetables, lentil soup, and brown rice to aid digestion and sleep."
    },
    {
      "title": "Hydration Boost",
      "icon": "assets/icons/Hamburger.svg",
      "description":
          "Infused water with cucumber, lemon, or mint throughout the day."
    },
    {
      "title": "Mindful Eating",
      "icon": "assets/icons/Hamburger.svg",
      "description":
          "Focus on small portions, chew slowly, and avoid processed foods for better wellness."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Diet Recommendations"),
        backgroundColor: kBlueLightColor,
        leading: const BackButton(color: Colors.black),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: dietPlans.map((diet) {
          return CategoryCard(
            title: diet["title"]!,
            svgSrc: diet["icon"]!,
            press: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(diet["title"]!),
                  content: Text(diet["description"]!),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Close"),
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
