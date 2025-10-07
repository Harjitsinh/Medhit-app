import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today"),
        backgroundColor: kBlueLightColor,
        leading: const BackButton(color: Colors.black),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Plan",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text("Meditation, Diet, Yoga, Kegel Exercises"),
          ],
        ),
      ),
    );
  }
}
