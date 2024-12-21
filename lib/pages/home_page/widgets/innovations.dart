import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';

class SimpleTextBlocks2 extends StatelessWidget {
  final key = innoKey;
  SimpleTextBlocks2({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана
    double screenWidth = MediaQuery.of(context).size.width;

    // Устанавливаем размер шрифта в зависимости от ширины экрана
    double titleFontSize = screenWidth * 0.05; // Заголовок 5% от ширины экрана
    double bodyFontSize = screenWidth < 600 ? screenWidth * 0.025 : screenWidth * 0.03; // Увеличиваем текст на маленьких экранах

    // Устанавливаем максимальные размеры шрифта
    double maxTitleFontSize = 50; // Максимальный размер заголовка
    double maxBodyFontSize = 35; // Максимальный размер основного текста

    // Ограничиваем размеры шрифтов
    titleFontSize = titleFontSize > maxTitleFontSize ? maxTitleFontSize : titleFontSize;
    bodyFontSize = bodyFontSize > maxBodyFontSize ? maxBodyFontSize : bodyFontSize;

    return Padding(
      padding: const EdgeInsets.all(16.0), // Отступы по краям
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
        children: [
          // Заголовок, выровненный по центру
          Center(
            child: Text(
              "Новинки и инновации в этой сфере",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: titleFontSize, // Размер заголовка
              ),
              textAlign: TextAlign.center, // Центрируем текст
            ),
          ),
          SizedBox(height: 20), // Отступ между заголовком и текстом

          // Основной текст
          Text(
            "Технические экосистемы непрерывно развиваются благодаря новым технологиям и инновациям, "
            "которые изменяют ландшафт цифрового пространства. Эти изменения не только улучшают существующие "
            "продукты и сервисы, но и открывают новые возможности для бизнеса и общества.",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: bodyFontSize, // Размер основного текста
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 20), // Отступ между основным текстом и списком

          // Заголовок для списка
          Text(
            "Основные направления инноваций:",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: bodyFontSize, // Размер заголовка для списка
            ),
          ),
          SizedBox(height: 10), // Отступ между заголовком списка и списком

          // Список направлений инноваций
          const SimpleTextBlock2(text: "1) Искусственный интеллект (AI) и машинное обучение"),
          const SimpleTextBlock2(text: "2) Виртуальная и дополненная реальность (VR/AR)"),
          const SimpleTextBlock2(text: "3) Блокчейн-технологии"),
          const SimpleTextBlock2(text: "4) 5G и 6G сети"),
          const SimpleTextBlock2(text: "5) Инновации в дизайне пользовательских интерфейсов"),
          const SimpleTextBlock2(text: "6) Энергоэффективность и устойчивость"),
          const SimpleTextBlock2(text: "7) Цифровой долг и баланс цифрового и реального времени"),
        ],
      ),
    );
  }
}

class SimpleTextBlock2 extends StatelessWidget {
  final String text;

  const SimpleTextBlock2({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана
    double screenWidth = MediaQuery.of(context).size.width;

    // Устанавливаем размер шрифта в зависимости от ширины экрана
    double fontSize = screenWidth < 600 ? screenWidth * 0.025 : screenWidth * 0.03; // Увеличиваем текст на маленьких экранах

    // Устанавливаем максимальный размер шрифта
    double maxFontSize = 35; // Максимальный размер текста в списке

    // Ограничиваем размер шрифта
    fontSize = fontSize > maxFontSize ? maxFontSize : fontSize;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Отступы для блока текста
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
