import 'dart:math';

import 'package:flutter/material.dart';
import 'package:site_project/pages/home_page/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final key = aboutKey;
  Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 255, 255, 255), // Background color of the footer
      child: Column(
        children: [
          // Title "About Us" centered
          Text(
            'О нас',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16), // Space between title and footer content

          // Main footer content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company logo in the top left corner
              Container(
                width: screenWidth * 0.1, // 10% of screen width
                height: screenWidth * 0.1, // Height equal to width for square logo
                child: Image.asset(
                  'assets/images/logo.png', // Path to logo image
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16), // Space between logo and info blocks

              // Info blocks
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildInfoBlock(
                      context,
                      'Диана',
                      'Любит китайскую культуру',
                      'https://t.me/Runmary',
                      'assets/images/diana.jpg', // Path to image
                    ),
                    _buildInfoBlock(
                      context,
                      'Лера',
                      'Нравятся книги про Гари Поттера',
                      'https://t.me/lerochkaTsvetochek',
                      'assets/images/lera.jpg',
                    ),
                    _buildInfoBlock(
                      context,
                      'Оксана',
                      'Тоже любит китайскую культуру',
                      'https://t.me/OksanaTetchenko',
                      'assets/images/oksana.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBlock(BuildContext context, String name, String description, String url, String imagePath) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click, // Change cursor to pointer
        child: Container(
          width: MediaQuery.of(context).size.width * 0.25, // Set width to 25% of screen width
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: min(MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.height * 0.2), // Adjust width for larger screens
                height: min(MediaQuery.of(context).size.width * 0.2, MediaQuery.of(context).size.height * 0.2), // Adjust height for larger screens
              ),
              SizedBox(height: 8), // Space between image and text
              Text(
                name,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4), // Space between name and description
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
