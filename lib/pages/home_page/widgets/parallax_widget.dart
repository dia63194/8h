import 'package:flutter/material.dart';
import 'package:parallax_image_ns/parallax_image.dart';

class ParallaxWidget extends StatelessWidget {
  final String image;
  final double initialHeight; // Начальная высота
  final double width;

  const ParallaxWidget({
    super.key,
    required this.image,
    required this.initialHeight,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана
    double screenWidth = MediaQuery.of(context).size.width;

    // Устанавливаем высоту в зависимости от ширины экрана,
    // но не больше начальной высоты
    double height = (screenWidth).clamp(0, initialHeight); // Например, 50% от ширины экрана, но не больше начальной высоты

    return SizedBox(
      height: height,
      width: width,
      child: ParallaxImage(
        image: NetworkImage(image),
        extent: height,
      ),
    );
  }
}
