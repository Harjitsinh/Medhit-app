import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/category_card.dart';

class KegelScreen extends StatelessWidget {
  const KegelScreen({super.key});

  final List<Map<String, String>> exercises = const [
    {"title": "Pelvic Tilt", "icon": "assets/icons/kegel1.svg"},
    {"title": "Bridge", "icon": "assets/icons/kegel2.svg"},
    {"title": "Clamshell", "icon": "assets/icons/kegel3.svg"},
    {"title": "Squats", "icon": "assets/icons/kegel4.svg"},
    {"title": "Leg Raises", "icon": "assets/icons/kegel5.svg"},
    {"title": "Hip Squeeze", "icon": "assets/icons/kegel6.svg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kegel Exercises"),
        backgroundColor: kBlueLightColor,
        leading: const BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: exercises.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return CategoryCard(
              title: exercise["title"]!,
              svgSrc: exercise["icon"]!,
              press: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${exercise["title"]} selected")),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
