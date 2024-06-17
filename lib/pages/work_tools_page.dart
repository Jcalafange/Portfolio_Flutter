import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/screen_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToolsPage extends StatefulWidget {
  const ToolsPage({super.key});

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  final Map<String, bool> _isHovered = {};

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(desktopMaxWidth, context, isDesktop: true),
      tablet: _buildUi(tabletMaxWidth, context, isDesktop: false),
      mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context, isDesktop: false),
    );
  }

  Widget _buildUi(double width, BuildContext context, {required bool isDesktop}) {
    final textStyle = GoogleFonts.oswald(
      color: Colors.white,
      fontSize: 30,
      height: 1.3,
    );

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Minhas Ferramentas", style: textStyle.copyWith(fontSize: 50)),
              SizedBox(height: 8),
              Text(
                "Esses são minhas ferramentas utilizadas em meu dia a dia, seja em projetos pessoais, estagio ou por materias da minha faculdade.",
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildSkillIcon(FontAwesomeIcons.html5, "HTML5"),
                    _buildSkillIcon(FontAwesomeIcons.css3Alt, "CSS3"),
                    _buildSkillIcon(FontAwesomeIcons.js, "JavaScript"),
                    _buildSkillIcon(FontAwesomeIcons.vuejs, "Vue.js"),
                    _buildSkillIcon(FontAwesomeIcons.nodeJs, "Dart"),
                    _buildSkillIcon(FontAwesomeIcons.bootstrap, "Flutter"),
                    _buildSkillIcon(FontAwesomeIcons.gitAlt, "Git"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillIcon(IconData iconData, String label) {
    return MouseRegion(
      onEnter: (event) => _setHover(true, label),
      onExit: (event) => _setHover(false, label),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: Column(
          children: [
            Icon(iconData, color: _isHovered[label] == true ? primaryColor : Colors.white, size: 100),
            SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.oswald(
                color: _isHovered[label] == true ? primaryColor : Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setHover(bool isHovered, String label) {
    setState(() {
      _isHovered[label] = isHovered;
    });
  }
}