import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/details_screen.dart';
import 'package:meditation_app/screens/diet_screen.dart';
import 'package:meditation_app/screens/kegel_screen.dart';
import 'package:meditation_app/screens/yoga_screen.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_app/widgets/category_card.dart';
import 'package:meditation_app/widgets/search_bar.dart' as custom_search_bar;
import 'package:meditation_app/screens/settings_screen.dart';

// ----------------- THEME NOTIFIER ----------------
ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Meditation App',
          theme: ThemeData(
            fontFamily: "Cairo",
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            fontFamily: "Cairo",
            scaffoldBackgroundColor: Colors.black,
            textTheme: Theme.of(context).textTheme.apply(displayColor: Colors.white),
            brightness: Brightness.dark,
          ),
          themeMode: currentMode,
          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SettingsScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/menu.svg",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Breathe. Balance. Become. \n",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(fontWeight: FontWeight.w900),
                  ),
                  const custom_search_bar.SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Diet Recommendation",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DietScreen()),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Kegel Exercises",
                          svgSrc: "assets/icons/kegel_icon.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const KegelScreen()),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Meditation",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DetailsScreen()),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Yoga",
                          svgSrc: "assets/icons/yoga_icon.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const YogaScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
