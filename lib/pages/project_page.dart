import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/screen_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(desktopMaxWidth, context, isDesktop: true),
      tablet: _buildUi(tabletMaxWidth, context, isDesktop: false),
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context,
          isDesktop: false),
    );
  }

  Widget _buildUi(double width, BuildContext context,
      {required bool isDesktop}) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textStyle = GoogleFonts.oswald(
      color: Colors.white,
      fontSize: 30,
      height: 1.3,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Meus Projetos',
            style: textStyle,
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            items: projects.map((project) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(project['image'],
                          height: screenHeight * 0.40,
                          width: screenWidth * 0.40,
                          fit: BoxFit.fill),
                      const SizedBox(height: 10),
                      Text(project['name'],
                          style:
                              const TextStyle(fontSize: 40, color: Colors.white)),
                      const SizedBox(height: 5),
                      Container(
                        width: screenWidth * 0.40,
                        child: Text(project['desc'],
                            style: const TextStyle(fontSize:16, color: Colors.white)),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.github,
                            color: Colors.white),
                        onPressed: () =>
                            launchUrl(Uri.parse(project['githubUrl'])),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: isDesktop ? 500 : 350,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              aspectRatio: isDesktop ? 16 / 9 : 1,
              viewportFraction: isDesktop ? 0.7 : 0.9,
            ),
          ),
        ],
      ),
    );
  }
}
