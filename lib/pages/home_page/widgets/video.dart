import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String videoAssetPath; // Путь к видеофайлу
  final double? width; // Опциональная ширина
  final double? height; // Опциональная высота

  final key = videoKey;
  VideoWidget({
    Key? key,
    required this.videoAssetPath, // Обязательный параметр для пути к видео
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    _customVideoPlayerController.videoPlayerController.dispose(); // Освобождаем ресурсы
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity, // Устанавливаем ширину
      height: widget.height ?? 200.0, // Устанавливаем высоту по умолчанию
      child: CustomVideoPlayer(
        customVideoPlayerController: _customVideoPlayerController,
      ),
    );
  }

  void initializeVideoPlayer() {
    VideoPlayerController videoPlayerController = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {
          // Обновляем состояние после инициализации
        });
      });

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }
}
