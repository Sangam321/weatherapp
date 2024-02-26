import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String location = 'Kathmandu';
  int temperature = 25;
  int maxTemp = 30;
  String weatherStateName = 'clear';
  int humidity = 60;
  int windSpeed = 10;
  var currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
  String imageUrl = 'clear'; // Assuming you have assets for weather conditions

  void _updateWeatherData(String selectedLocation) {
    setState(() {
      location = selectedLocation;
      if (location == 'Kathmandu') {
        temperature = 25;
        maxTemp = 30;
        weatherStateName = 'clear';
        humidity = 60;
        windSpeed = 10;
        imageUrl = 'clear'; // Update image url based on weather condition
      } else if (location == 'Paris') {
        temperature = 20;
        maxTemp = 25;
        weatherStateName = 'heavycloud';
        humidity = 70;
        windSpeed = 12;
        imageUrl = 'heavycloud'; // Update image url based on weather condition
      }
      currentDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create a size variable for the media query
    Size size = MediaQuery.of(context).size;

    // Create a shader linear gradient
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Our profile image
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  'assets/profile.png',
                  width: 40,
                  height: 40,
                ),
              ),
              // Our location dropdown
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/pin.png',
                    width: 20,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: location,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: ['Kathmandu', 'Paris'].map((String location) {
                        return DropdownMenuItem(value: location, child: Text(location));
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          _updateWeatherData(newValue);
                        }
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weather Widget
            Text(
              location,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Text(
              currentDate,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _buildWeatherWidget(
              temperature: temperature,
              weatherStateName: weatherStateName,
              imageUrl: imageUrl,
              linearGradient: linearGradient,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherWidget({
    required int temperature,
    required String weatherStateName,
    required String imageUrl,
    required Shader linearGradient,
  }) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue, // Change color to whatever you like
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(.5), // Change color to whatever you like
            offset: const Offset(0, 25),
            blurRadius: 10,
            spreadRadius: -12,
          )
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -40,
            left: 20,
            child: Image.asset(
              'assets/' + imageUrl + '.png',
              width: 150,
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Text(
              weatherStateName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    temperature.toString(),
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                ),
                Text(
                  'o',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
