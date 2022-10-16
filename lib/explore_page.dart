import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_sinau/theme_app.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeApp myThemeApp = ThemeApp();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.close),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Your Location',
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.red),
              ],
            ),
            Text(
              'Jl. Raya Bukit Tengger Kel No.38, '
              'Kandangan Kec Benowo',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.bookmark_outline,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        //--> unbounded constraint , batasan tak terbatas
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const SearchTextField(),
          const SizedBox(height: 16),
          TextDescriptionWidget(myThemeApp: myThemeApp),
          const SizedBox(height: 24),
          ProductListWidget(screenWidth: screenWidth, myThemeApp: myThemeApp),
        ],
      ),
    );
  }
}

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    Key? key,
    required this.screenWidth,
    required this.myThemeApp,
  }) : super(key: key);

  final double screenWidth;
  final ThemeApp myThemeApp;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        ///i dont want padding right  for list view
        height: screenHeight * 0.40,
        // width: double.infinity,
        width: screenWidth * 0.95,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal, //direction scoll menyamping
          children: [
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
            ProductCard(myThemeApp: myThemeApp),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.myThemeApp,
  }) : super(key: key);

  final ThemeApp myThemeApp;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Card(
          elevation: 20,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: SizedBox(
            height: screenHeight * 0.50,
            width: screenWidth * 0.55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    image: NetworkImage(
                        'https://i.gojekapi.com/darkroom/gofood-indonesia/v2/images/uploads/4dfb1afd-bc0c-43e9-9c95-77154a2c293a_restaurant-image_1624525710588.jpg'),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 18, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0.32 km',
                          style: myThemeApp.textStyle.black87Size14Normal,
                        ),
                        SizedBox(height: 8),
                        Flexible(
                          child: Text(
                            'David Kitchen, Benowo Indah',
                            // maxLines: 2,
                            style: myThemeApp.textStyle.blackSize18Bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Colors.deepOrange),
                            const SizedBox(width: 8),
                            Text('4.7',
                                style:
                                    ThemeApp().textStyle.black87Size14SemiBold),
                            const SizedBox(width: 4),
                            // const Flexible(child: SmallCircleWidget()),
                            const Icon(Icons.circle,
                                color: Colors.black, size: 4),
                            const SizedBox(width: 4),
                            Text('12k+ ratings',
                                style:
                                    ThemeApp().textStyle.black87Size14SemiBold),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class SmallCircleWidget extends StatelessWidget {
  const SmallCircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.all(100.0),
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
    );
  }
}

class TextDescriptionWidget extends StatelessWidget {
  const TextDescriptionWidget({
    Key? key,
    required this.myThemeApp,
  }) : super(key: key);

  final ThemeApp myThemeApp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Support your local resto',
                  style: myThemeApp.textStyle.blackSize18Bold
                      .copyWith(height: 2.0)),
              Text('Order from UMKM GoFooddieland',
                  style: myThemeApp.textStyle.black87Size16Normal
                      .copyWith(height: 2.0)),
              Text('Didcount up to 33k',
                  style: myThemeApp.textStyle.black87Size16Normal),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: TextField(
        style: GoogleFonts.openSans(
            fontSize: 16, color: Colors.black12, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            fillColor: Colors.white38,
            filled: true,
            prefixIcon: Icon(Icons.search),
            hintText: 'What would you like to eat?',
            contentPadding: const EdgeInsets.all(15),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        onChanged: (value) {
          // do something
        },
      ),
    );
  }
}
