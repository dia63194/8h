import 'dart:math';
import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';

class WhatIsElement extends StatelessWidget {
  final key = whatIsKey;

  WhatIsElement({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth; // Доступная ширина
        final double availableHeight = constraints.maxHeight; // Доступная высота

        // Определяем масштаб текста в зависимости от ширины экрана
        double titleFontSize = (availableWidth / 12).clamp(24.0, 48.0); // Заголовок, изменено на 12 для увеличения на больших экранах
        double textFontSize = (availableWidth / 20).clamp(18.0, 30.0); // Основной текст, изменено на 20 для увеличения на больших экранах

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: availableHeight, // Высота без параметров
          ),
          child: Column(
            children: [
              // Заголовок
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0), // Отступы для заголовка
                child: Text(
                  "Что такое техническая экосистема", // Текст заголовка
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: titleFontSize, // Устанавливаем динамический размер заголовка
                  ),
                  textAlign: TextAlign.center, // Центрируем заголовок
                ),
              ),
              // Wrap с текстом и изображением
              Wrap(
                alignment: WrapAlignment.center, // Центрируем содержимое
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // Текст
                  SizedBox(
                    width: min(availableWidth * 0.65, 800), // Ограничиваем ширину текста
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          "Технические экосистемы представляют собой комплекс взаимодействующих технологических компонентов, обеспечивающих функционирование современной цифровизированной инфраструктуры. Они включают в себя расширенный набор IT-возможностей и функций, служащие платформой для инноваций и цифрового развития организации.",
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: textFontSize, // Устанавливаем динамический размер текста
                          ),
                          textAlign: TextAlign.justify, // Центрируем текст
                        ),
                      ),
                    ),
                  ),
                  // Изображение
                  Container(
                    width: max(MediaQuery.of(context).size.width * 0.40, MediaQuery.of(context).size.height * 0.60), // Увеличиваем размер изображения
                    child: Image.asset(
                      'assets/images/te.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
