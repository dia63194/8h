import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';

class RealizationBlock extends StatelessWidget {
  final String text;
  final String imagePath;

  const RealizationBlock({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Определяем ширину изображения в зависимости от ширины экрана
        double imageWidth = constraints.maxWidth >= 1000
            ? constraints.maxWidth * 0.15 // 15% для больших экранов
            : constraints.maxWidth * 0.25; // 25% для маленьких экранов

        // Определяем ширину текста в зависимости от ширины экрана
        double textWidth = constraints.maxWidth >= 1000
            ? constraints.maxWidth * 0.5 // 50% для больших экранов
            : constraints.maxWidth * 0.65; // 65% для маленьких экранов

        // Определяем размер шрифта в зависимости от ширины экрана
        double fontSize = constraints.maxWidth >= 1000
            ? constraints.maxWidth * 0.018 // Меньше для больших экранов
            : constraints.maxWidth * 0.025; // Больше для маленьких экранов

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Блок с изображением
            Container(
              width: imageWidth,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            // Отступ между изображением и текстом
            SizedBox(width: 8.0), // Отступ между изображением и текстом
            // Блок с текстом
            Container(
              width: textWidth,
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize:
                            fontSize, // Применяем динамический размер шрифта
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class RealizationSection extends StatelessWidget {
  final key = realKey;
  RealizationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Примеры успешных технических экосистем",
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 50, // Размер заголовка
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        // Блоки с текстом и изображениями
        ListView(
          shrinkWrap:
              true, // Позволяет ListView занимать только необходимое пространство
          physics: NeverScrollableScrollPhysics(), // Отключает прокрутку
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Отступы сверху и снизу
              child: RealizationBlock(
                text: "iOS экосистема (Apple)",
                imagePath: 'assets/images/ios.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Отступы сверху и снизу
              child: RealizationBlock(
                text: "Android экосистема (Google)",
                imagePath: 'assets/images/android.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Отступы сверху и снизу
              child: RealizationBlock(
                text: "Amazon Web Services (AWS) экосистема",
                imagePath: 'assets/images/amazon.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Отступы сверху и снизу
              child: RealizationBlock(
                text: "Facebook (Meta) экосистема",
                imagePath: 'assets/images/meta.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 8.0), // Отступы сверху и снизу
              child: RealizationBlock(
                text: "Microsoft Azure экосистема",
                imagePath: 'assets/images/azure (1).png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
