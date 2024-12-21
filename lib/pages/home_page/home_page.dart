import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/widgets/chat_bot.dart';
import 'package:site_project/pages/home_page/widgets/entry_element.dart';
import 'package:site_project/pages/home_page/widgets/whatis_ecosystem.dart';
import 'package:site_project/pages/home_page/widgets/specifications.dart';
import 'package:site_project/pages/home_page/widgets/text_blocks.dart';
import 'package:site_project/pages/home_page/widgets/carousel.dart';
import 'package:site_project/pages/home_page/widgets/video.dart';
import 'package:site_project/pages/home_page/widgets/parallax_widget.dart';
import 'package:site_project/pages/home_page/widgets/realizations.dart';
import 'package:site_project/pages/home_page/widgets/innovations.dart';
import 'package:site_project/pages/home_page/widgets/footer.dart';
import 'package:site_project/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, this.headerHeight = 80.0});

  final String title;
  final double headerHeight;

  @override
  State<HomePage> createState() => _HomePageState();
}

final whatIsKey = GlobalKey();
final videoKey = GlobalKey();
final specKey = GlobalKey();
final hisTextKey = GlobalKey();
final carouselKey = GlobalKey();
final realKey = GlobalKey();
final innoKey = GlobalKey();
final aboutKey = GlobalKey();

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  OverlayEntry? _overlayEntry;
  late AnimationController _controller;
  late Animation<double> _animation;
  Color _buttonColor = Colors.black; // Начальный цвет кнопки
  // ignore: unused_field
  bool _isChatOpen = false; // Состояние открытого чата
  bool _isMenuOpen = false; // Состояние открытого меню

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        right: 20,
        bottom: 80,
        child: Material(
          elevation: 4.0,
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 300,
            height: 400,
            child: DialogFlowWidget(
              url:
                  'https://console.dialogflow.com/api-client/demo/embedded/bba1b949-fed5-4c4f-8156-aad64c61b06b',
            ),
          ),
        ),
      ),
    );
  }

  void _showDialogFlowOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isChatOpen = true; // Меняем состояние при открытии чата
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isChatOpen = false; // Меняем состояние при закрытии чата
    });
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _toggleChat() {
    if (_overlayEntry == null) {
      _showDialogFlowOverlay();
      _controller.forward();
      setState(() {
        _buttonColor = Colors.red; // Цвет при открытии чата
      });
    } else {
      _removeOverlay();
      _controller.reverse();
      setState(() {
        _buttonColor = Colors.black; // Цвет при закрытии чата
      });
    }
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen; // Переключаем состояние меню
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Техническая Экосистема",
            style: TextStyle(fontSize: 30, color: Colors.white)),
        backgroundColor: Colors.black,
        toolbarHeight: widget.headerHeight,
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            tooltip: "Навигация",
            iconSize: 40,
            icon: Icon(_isMenuOpen ? Icons.close : Icons.menu,
                color: Colors
                    .white), // Меняем иконку в зависимости от состояния меню
            offset: const Offset(30, 55),
            onSelected: (value) {
              //_toggleMenu;
              switch (value) {
                case 'WhatIs':
                  scrollToSection(whatIsKey);
                  break;
                case 'Video':
                  scrollToSection(videoKey);
                  break;
                case 'Specifications':
                  scrollToSection(specKey);
                  break;
                case 'History':
                  scrollToSection(hisTextKey);
                  break;
                case 'Carousel':
                  scrollToSection(carouselKey);
                  break;
                case 'Realizations':
                  scrollToSection(realKey);
                  break;
                case 'Innovations':
                  scrollToSection(innoKey);
                  break;
                case 'About':
                  scrollToSection(aboutKey);
                  break;
              }
            },
            onOpened: _toggleMenu,
            itemBuilder: (context) => [
              const PopupMenuItem(
                  value: 'WhatIs',
                  child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text('Что такое техническая экосистема'))),
              const PopupMenuItem(
                  value: 'Video',
                  child: ListTile(
                      leading: Icon(Icons.play_circle_outline),
                      title: Text('Разъясняющее видео'))),
              const PopupMenuItem(
                  value: 'Specifications',
                  child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Характеристики технических экосистем'))),
              const PopupMenuItem(
                  value: 'History',
                  child: ListTile(
                      leading: Icon(Icons.book),
                      title: Text('История развития технических экосистем'))),
              const PopupMenuItem(
                  value: 'Carousel',
                  child: ListTile(
                      leading: Icon(Icons.category),
                      title: Text('Типы технических экосистем'))),
              const PopupMenuItem(
                  value: 'Realizations',
                  child: ListTile(
                      leading: Icon(Icons.check_circle_outline),
                      title: Text('Примеры успешных технических экосистем'))),
              const PopupMenuItem(
                  value: 'Innovations',
                  child: ListTile(
                      leading: Icon(Icons.new_releases),
                      title: Text('Новинки и инновации в этой сфере'))),
              const PopupMenuItem(
                  value: 'About',
                  child: ListTile(
                      leading: Icon(Icons.info_outline), title: Text('О нас'))),
            ],
            onCanceled: _toggleMenu, // Сброс состояния меню при закрытии
          ),
          const Padding(padding: EdgeInsets.only(right: 50)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EntryElement(theme: mainTheme, headerHeight: widget.headerHeight),
              Padding(padding: EdgeInsets.only(top: 200)),
              WhatIsElement(),
              Padding(padding: EdgeInsets.only(top: 200)),
              VideoWidget(
                  videoAssetPath: 'assets/video/video.mp4',
                  width: 1200.0,
                  height: 800.0),
              Padding(padding: EdgeInsets.only(top: 200)),
              TextImageSection(),
              Padding(padding: EdgeInsets.only(top: 200)),
              SimpleTextBlocks(),
              ImageSliderCarousel(
                images: [
                  'assets/images/bloc.png',
                  'assets/images/mob.png',
                  'assets/images/platforma.png',
                  'assets/images/media.png',
                  'assets/images/bisnes.jpeg',
                  'assets/images/ai.jpg',
                ],
                imageDescriptions: [
                  'Блокчейн-экосистемы',
                  'Мобильные экосистемы',
                  'Платформенные экосистемы',
                  'Социальные медиа экосистемы',
                  'Финансовые экосистемы',
                  'Интеллектуальные экосистемы',
                ],
                imageSubDescriptions: [
                  'Блокчейн-экосистемы основываются на технологии распределенных журналов (blockchain) и используются для создания децентрализованных систем.',
                  'Мобильные экосистемы фокусируются на мобильных приложениях и услугах, интегрированных вокруг них.',
                  'Платформенные экосистемы предоставляют набор инструментов и сервисов для разработки и использования приложений.',
                  'Социальные медиа экосистемы предоставляют платформы для общения и обмена информацией.',
                  'Финансовые экосистемы предоставляют комплексные решения для финансовых услуг и транзакций.',
                  'Интеллектуальные экосистемы фокусируются на искусственном интеллекте и связанных с ним технологиях.',
                ],
                pauseAutoPlayOnTouch: true,
              ),
              ParallaxWidget(
                image: 'assets/images/photo_2024-12-11_12-10-33.jpg',
                width: MediaQuery.of(context).size.width,
                initialHeight: MediaQuery.of(context).size.height * 0.4,
              ),
              RealizationSection(),
              SimpleTextBlocks2(),
              Footer(),
            ],
          ),
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          onPressed: _toggleChat,
          backgroundColor: _buttonColor,
          tooltip: 'Открыть чат',
          child: Icon(_overlayEntry == null
              ? Icons.messenger_sharp
              : Icons.close), // Меняем иконку на крестик при открытом меню
        ),
      ),
    );
  }
}
