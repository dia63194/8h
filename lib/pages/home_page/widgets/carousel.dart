import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';

class ImageSliderCarousel extends StatefulWidget {
  final List<String> images;
  final List<String> imageDescriptions;
  final List<String> imageSubDescriptions;
  final bool pauseAutoPlayOnTouch;

  final key = carouselKey;
  ImageSliderCarousel({
    super.key,
    required this.images,
    required this.imageDescriptions,
    required this.imageSubDescriptions,
    required this.pauseAutoPlayOnTouch,
  });

  @override
  State<ImageSliderCarousel> createState() => _ImageSliderCarouselState();
}

class _ImageSliderCarouselState extends State<ImageSliderCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Типы технических экосистем", style: TextStyle(fontSize: 50.0, color: Colors.black, fontWeight: FontWeight.bold),),
        SizedBox(height: 50),

        CarouselSlider(
          options: CarouselOptions(
            height: 800 / 1.5,
            viewportFraction: MediaQuery.of(context).size.width < 1400 ? 0.9 : 0.4,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            pauseAutoPlayOnTouch: widget.pauseAutoPlayOnTouch,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800), // Уменьшена длительность анимации
            autoPlayCurve: Curves.easeInOut, // Изменена кривая анимации
            enlargeCenterPage: false, // Отключено увеличение центральной страницы
          ),
          items: widget.images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.images.map((image) {
            int index = widget.images.indexOf(image);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double textScaleFactor = constraints.maxWidth < 400 ? 0.8 : 1.0; // Уменьшаем размер шрифта при узкой ширине

              return Column(
                children: [
                  Text(
                    widget.imageDescriptions[_currentIndex],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 40 * textScaleFactor),
                  ),
                  SizedBox(
                    height: 200,
                    width: constraints.maxWidth, // Используем доступную ширину
                    child: Text(
                      widget.imageSubDescriptions[_currentIndex],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 24 * textScaleFactor),
                    ),
                  ),
                  SizedBox(height: 50), // Отступ снизу
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
