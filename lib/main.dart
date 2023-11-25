import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sistem Navigasi Gambar')),
        body: ImageNavigator(),
      ),
    );
  }
}

class ImageNavigator extends StatefulWidget {
  @override
  _ImageNavigatorState createState() => _ImageNavigatorState();
}

class _ImageNavigatorState extends State<ImageNavigator> {
  List<String> images = List.generate(
    10,
    (index) => 'https://picsum.photos/id/${index + 1}/400/500',
  );

  int currentIndex = 0;

  void changeImage(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  void firstImage() {
    changeImage(0);
  }

  void nextImage() {
    if (currentIndex < images.length - 1) {
      changeImage(currentIndex + 1);
    }
  }

  void previousImage() {
    if (currentIndex > 0) {
      changeImage(currentIndex - 1);
    }
  }

  void lastImage() {
    changeImage(images.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.network(images[currentIndex]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: firstImage, child: Text('First')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: previousImage, child: Text('Previous')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: nextImage, child: Text('Next')),
            SizedBox(width: 10),
            ElevatedButton(onPressed: lastImage, child: Text('Last')),
          ],
        ),
      ],
    );
  }
}
