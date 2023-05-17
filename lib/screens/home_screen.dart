import 'package:flutter/material.dart';
import 'package:flutter_plant_application/constants/constants.dart';
import 'package:page_transition/page_transition.dart';

import '../models/plants.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    List<String> _plantTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    //Toggle Fav
    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.black54.withOpacity(.6),
                      ),
                      const Expanded(
                          child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                            hintText: 'Search Plant',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      )),
                      Icon(Icons.mic, color: Colors.black54.withOpacity(.6))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 50.0,
            width: size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _plantTypes[index],
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: selectedIndex == index
                                  ? Constants.primaryColor
                                  : Constants.blackColor),
                        ),
                      ));
                }),
          ),
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: DetailScreen(plantId: _plantList[index].plantId),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {
                                bool isFavorited = toggleIsFavorite(
                                    _plantList[index].isFavorated);
                                _plantList[index].isFavorated = isFavorited;
                              },
                              icon: Icon(
                                _plantList[index].isFavorated == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Constants.primaryColor,
                              ),
                              color: Constants.primaryColor,
                              iconSize: 20,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          right: 50,
                          top: 50,
                          bottom: 50,
                          child: Image.asset(_plantList[index].imageURL),
                        ),
                        Positioned(
                          bottom: 15,
                          left: 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _plantList[index].category,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                _plantList[index].plantName,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 15,
                            right: 20,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text(
                                  r'$' + _plantList[index].price.toString(),
                                  style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontSize: 16)),
                            ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: _plantList.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
            child: const Text(
              'New Plants',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: size.height * .5,
            child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: DetailScreen(plantId: _plantList[index].plantId,),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 80,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      width: size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(clipBehavior: Clip.none, children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(.8),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 80,
                                  child:
                                      Image.asset(_plantList[index].imageURL),
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  left: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(_plantList[index].category),
                                      Text(
                                        _plantList[index].plantName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Constants.blackColor),
                                      )
                                    ],
                                  ))
                            ]),
                            Container(
                              padding: const EdgeInsets.only(right: 10),
                              child: Text(
                                  r'$' + _plantList[index].price.toString(),
                                  style: TextStyle(
                                      color: Constants.primaryColor,
                                      fontSize: 18)),
                            )
                          ]),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
