import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';

class SimpleTextBlocks extends StatelessWidget {
  final key = hisTextKey;
  SimpleTextBlocks({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана
    double screenWidth = MediaQuery.of(context).size.width;

    // Устанавливаем размер шрифта в зависимости от ширины экрана
    double fontSize = screenWidth < 1000 ? screenWidth * 0.025 : screenWidth * 0.015; // Увеличиваем для маленьких экранов

    return Padding(
      padding: const EdgeInsets.all(16.0), // Отступы по краям
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Выравнивание по левому краю
        children: [
          // Заголовок
          Text(
            "История развития технических экосистем",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: fontSize * 1.5, // Заголовок немного больше
            ),
          ),
          SizedBox(height: 20), // Отступ между заголовком и текстовыми блоками

          // Создание отдельных виджетов для текстовых блоков
          const SimpleTextBlock(text: "• 1960-е годы: Появление крупных корпоративных решений, таких как IBM System/360, первые примеры интеграции различных компонентов в единые системы."),
          const SimpleTextBlock(text: "• 1970-е годы: Появление микропроцессоров, что позволило создавать более компактные и эффективные системы."),
          const SimpleTextBlock(text: "• 1990-е годы: Прорыв с появлением интернета и всемирной паутины, рост популярности открытого исходного кода."),
          const SimpleTextBlock(text: "• 2000-е годы: Развитие платформенных экосистем крупными технологическими компаниями (Google, Apple, Amazon)."),
          const SimpleTextBlock(text: "• Современный период: Распространение мобильных устройств и приложений, развитие облачных технологий, появление экосистем на основе искусственного интеллекта и блокчейн-технологий."),
        ],
      ),
    );
  }
}

class SimpleTextBlock extends StatelessWidget {
  final String text;

  const SimpleTextBlock({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана
    double screenWidth = MediaQuery.of(context).size.width;

    // Устанавливаем размер шрифта в зависимости от ширины экрана
    double fontSize = screenWidth < 1000 ? screenWidth * 0.03 : screenWidth * 0.02; // Увеличиваем для маленьких экранов

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Отступы для блока текста
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: fontSize, // Увеличиваем размер шрифта
        ),
      ),
    );
  }
}
