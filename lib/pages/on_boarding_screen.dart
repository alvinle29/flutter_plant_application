import 'package:flutter/material.dart';
import 'package:flutter_plant_application/constants/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: InkWell(
              onTap: () => null,
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) => {
              setState(
                () {
                  currentIndex = page;
                },
              )
            },
            controller: _pageController,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 350,
                        child: Image.asset('assets/images/plant-one.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        Constants.titleOne,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        Constants.descriptionOne,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ]),
              )
            ],
          )
        ],
      ),
    );
  }
}
