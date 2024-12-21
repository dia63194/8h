import 'package:flutter/material.dart';

class EntryElement extends StatelessWidget {
  const EntryElement({
    super.key,
    required this.theme,
    this.headerHeight, // Новый параметр для высоты заголовка
  });

  final ThemeData theme;
  final double? headerHeight; // Параметр для высоты заголовка (может быть null)

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double availableHeight = MediaQuery.of(context).size.height - (headerHeight ?? 0);
    final double screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (screenWidth < 1400) {
          // Для мобильных устройств  
          return Column(
            children: [
              // Изображение с ограничением по высоте
              Container(
                width: double.infinity, // Растянуть по ширине
                height: availableHeight * 0.6, // Ограничение высоты до 60%
                child: Image.asset(
                  'assets/images/previu.png',
                  fit: BoxFit.cover, // Растянуть изображение по контейнеру, сохраняя пропорции
                ),
              ),
              // Текст под изображением
              Container(
                width: double.infinity, // Растянуть по ширине
                height: availableHeight * 0.4, // Задайте высоту, например, 40% от доступной высоты
                child: Center(
                  child: Text(
                    "Техническая Экосистема",
                    style: theme.textTheme.headlineLarge,
                    textAlign: TextAlign.center, // Центрировать текст
                  ),
                ),
              ),
            ],
          );
        } else {
          // Для больших экранов
          double imageWidth = constraints.maxWidth * 0.3; // 30% ширины для больших экранов
          double textWidth = constraints.maxWidth * 0.6; // 60% ширины для больших экранов

          return Wrap(
            alignment: WrapAlignment.center, // Центрировать содержимое
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16.0, // Пробел между элементами
            children: [
              // Левая сторона с изображением
              Container(
                width: imageWidth, // Ширина изображения
                height: availableHeight, // Занимает полную высоту
                child: FittedBox(
                  child: Image.asset(
                    'assets/images/previu.png',
                    fit: BoxFit.contain, // Сохранять пропорции
                  ),
                  fit: BoxFit.contain, // Сохранять пропорции
                ),
              ),
              // Правая сторона с текстом
              Container(
                width: textWidth, // Ширина текстового столбца
                height: availableHeight, // Занимает полную высоту
                child: Center( // Центрировать текст
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Центрировать вертикально
                    crossAxisAlignment: CrossAxisAlignment.center, // Центрировать горизонтально
                    children: [
                      Text(
                        "Техническая Экосистема",
                        style: theme.textTheme.headlineLarge,
                        textAlign: TextAlign.center, // Центрировать текст
                      ),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
