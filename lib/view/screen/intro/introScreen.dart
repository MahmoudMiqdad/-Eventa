
import 'package:eventa_project/view/screen/intro/LogIn_option.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  final List<String> images = [
    'assets/images/intro 3.jpg',
    'assets/images/intro 1.jpg',
    'assets/images/intro 2.jpg',
    
  ];

  final List<String> texts = [
     'Flexible main interface with lots of details',
    'Organize your event with a wide range of service providers.',
    'Choose what you want carefully and in detail.',
   
  ];

  void nextPage() {
    setState(() {
      currentPage =
          (currentPage + 1) % images.length; // يتغير إلى الصورة التالية
    });
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 7,
      width: 7,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 3, right: 3, top: 40),
            child: SizedBox(
              height: 600,
              width: 800,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image(
                  image: AssetImage(images[currentPage]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // ... النصوص والأزرار ...
        ],
      ),
      bottomSheet: Container(
        height: 250,
        padding: const EdgeInsets.only(bottom: 20.0, left: 50, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              texts[currentPage],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8.0),
            // ... النص الثاني ...
            const SizedBox(height: 25.0), // Spacing before the buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: const Text('Skip'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      images.length, (index) => buildDot(index, context)),
                ),
                TextButton(
                  onPressed: nextPage, // تغيير الصورة والنص عند الضغط
                  child: const Text('Next'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF5669FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
      ),
    );
  }
}
