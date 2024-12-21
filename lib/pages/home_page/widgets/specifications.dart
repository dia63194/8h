import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';

class TextImageBlock extends StatelessWidget {
  final String text;
  final String imagePath;

  const TextImageBlock({
    Key? key,
    required this.text,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double imageWidth = constraints.maxWidth >= 600
            ? constraints.maxWidth * 0.2 // 20% ширины для больших экранов
            : constraints.maxWidth * 0.3; // 30% ширины для мобильных устройств

        double textWidth = constraints.maxWidth >= 600
            ? constraints.maxWidth * 0.6 // 60% ширины для больших экранов
            : constraints.maxWidth * 0.5; // 50% ширины для мобильных устройств

        // Определение размера шрифта в зависимости от ширины экрана
        double fontSize = constraints.maxWidth >= 1300 ? 40 : constraints.maxWidth * 0.03; // Фиксированный размер для больших экранов

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
            SizedBox(width: 16.0), // Добавляем отступ 16 пикселей
            // Блок с текстом
            Container(
              width: textWidth,
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: fontSize, // Применяем динамический размер шрифта
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

class TextImageSection extends StatelessWidget {
  final key = specKey;
  TextImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Характеристики технических экосистем",
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
          shrinkWrap: true, // Позволяет ListView занимать только необходимое пространство
          physics: NeverScrollableScrollPhysics(), // Отключает прокрутку
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Отступы сверху и снизу
              child: TextImageBlock(
                text: "Управление \"многоскоростными\" IT-функциями, требующими координации различных аспектов информационных технологий.",
                imagePath: 'assets/images/control.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Отступы сверху и снизу
              child: TextImageBlock(
                text: "Интеграция внутренних систем с внешними платформами и сервисами для создания открытых интерфейсов и гибких архитектур.",
                imagePath: 'assets/images/int.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Отступы сверху и снизу
              child: TextImageBlock(
                text: "Модернизация IT для инноваций через тестирование новых технологий, формирование партнерств и привлечение экспертов.",
                imagePath: 'assets/images/mod.jpg',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
