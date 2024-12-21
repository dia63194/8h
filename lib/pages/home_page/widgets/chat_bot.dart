// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:fastor_app_ui_widget/fastor_app_ui_widget.dart'  if (dart.library.html)  'dart:ui' as ui;

class DialogFlowWidget extends StatelessWidget {
  final String url;

  DialogFlowWidget({super.key, required this.url}) {
    // Регистрация IFrameElement
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) {
        final iframe = IFrameElement()
          ..width = '300'
          ..height = '400'
          ..src = url ..style.border = 'none';
        return iframe;
      },
    );
  }

  @override Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'iframeElement');
  }
}