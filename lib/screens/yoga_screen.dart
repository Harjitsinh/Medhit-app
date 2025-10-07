import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/category_card.dart';

class YogaScreen extends StatelessWidget {
  const YogaScreen({super.key});

  final List<Map<String, String>> yogaPoses = const [
    {"title": "Mountain Pose", "icon": "assets/icons/yoga1.svg"},
    {"title": "Downward Dog", "icon": "assets/icons/yoga2.svg"},
    {"title": "Warrior I", "icon": "assets/icons/yoga3.svg"},
    {"title": "Tree Pose", "icon": "assets/icons/yoga4.svg"},
    {"title": "Child Pose", "icon": "assets/icons/yoga5.svg"},
    {"title": "Cobra Pose", "icon": "assets/icons/yoga6.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yoga Exercises"),
        backgroundColor: kBlueLightColor,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: yogaPoses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final pose = yogaPoses[index];
            return CategoryCard(
              title: pose["title"]!,
              svgSrc: pose["icon"]!,
              press: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${pose["title"]} selected")),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
