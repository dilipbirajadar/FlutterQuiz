import 'package:flutter/material.dart';
import 'package:quiz/models/home_tile_select.dart';
import 'package:quiz/models/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userName = 'Dilip';

  void onTileClick(String tile) {
    switch (tile) {
      case 'Flutter':
        Navigator.pushNamed(context, '/quiz',arguments: HomeTileModel(tileName: tile));
        break;

      case 'React Native':
        Navigator.pushNamed(context, '/quiz',arguments: HomeTileModel(tileName: tile));
        break;

      case 'Android':
        Navigator.pushNamed(context, '/quiz',arguments: HomeTileModel(tileName: tile));
        break;

      case 'Swift':
        Navigator.pushNamed(context, '/quiz',arguments: HomeTileModel(tileName: tile));
        break;
      default :{
        Navigator.pushNamed(context, '/quiz',arguments: HomeTileModel(tileName: 'Flutter'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //screen size dynamically
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    //get elements from the last page
    final routingArgument =
        ModalRoute.of(context)!.settings.arguments as Profile;

    userName = routingArgument.userName;


    return Scaffold(
      appBar: AppBar(
        title: const Text('QUIZ'),
      ),
      body: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 125,
                  width: width,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 15,
                      color: const Color(0xffb8e893),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              width: width / 7,
                              height: height / 2,
                              alignment: Alignment.center,
                              image:
                                  const AssetImage('images/storytelling.png')),
                          Container(
                            width: width / 2,
                            height: height / 2,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    'Welcome $userName'),
                                const SizedBox(
                                  width: 5,
                                  height: 5,
                                ),
                                const Text(
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black),
                                    'Its Quiz Time, Choose the skill and processed '),
                              ],
                            ),
                          ),
                          Image(
                              width: width / 4,
                              height: height / 2,
                              image:
                                  const AssetImage('images/undraw_exams.png')),
                        ],
                      ) //Text('Welcome to $userName')
                      ),
                ),
                const SizedBox(width: 10, height: 15),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 103, 153, 255),
                        Colors.pinkAccent
                      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child:  listTileView('Flutter')

                  ),
                ),
                const SizedBox(width: 10, height: 15),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(241, 128, 163, 255),
                        Colors.blueAccent
                      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child:  listTileView('React Native')

                  ),
                ),
                const SizedBox(width: 10, height: 15),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(194, 156, 221, 255),
                        Colors.deepPurpleAccent
                      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child:  listTileView('Android')

                  ),
                ),
                const SizedBox(width: 10, height: 15),
                Container(
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(113, 182, 249, 255),
                        Colors.lightBlueAccent
                      ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child:  listTileView('Swift')
                  ),
                ),
                const SizedBox(width: 10, height: 15),
              ],
            ),
          )),
    );
  }


  Widget listTileView(String tileName) {
    return ListTile(
      leading: Text(tileName),
      trailing: const Text('1h:20m'),
      onTap: () => onTileClick(tileName),
    );
  }
}
