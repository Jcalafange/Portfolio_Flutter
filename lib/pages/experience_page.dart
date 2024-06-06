import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/screen_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});
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
      fontSize: 18,
      height: 1.3,
    );

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildExperienceColumn(
                        'Experiências Profissionais', professionalExperiences, textStyle),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: _buildExperienceColumn(
                        'Experiências Acadêmicas', academicExperiences, textStyle),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildExperienceColumn(
                      'Experiências Profissionais', professionalExperiences, textStyle),
                  const SizedBox(height: 32),
                  _buildExperienceColumn(
                      'Experiências Acadêmicas', academicExperiences, textStyle),
                ],
              ),
      ),
    );
  }

  Widget _buildExperienceColumn(String title, List<Map<String, String>> experiences, TextStyle textStyle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        ..._buildTimeline(experiences, textStyle),
      ],
    );
  }

  List<Widget> _buildTimeline(List<Map<String, String>> experiences, TextStyle textStyle) {
    return experiences.map((experience) {
      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.3,
        isFirst: experiences.first == experience,
        isLast: experiences.last == experience,
        indicatorStyle: const IndicatorStyle(
          width: 20,
          color: Colors.white,
          padding: EdgeInsets.all(6),
        ),
        endChild: Container(
          constraints: const BoxConstraints(minHeight: 120),
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                experience['title']!,
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (experience.containsKey('date'))
                Text(
                  experience['date']!,
                  style: textStyle,
                ),
              if (experience.containsKey('location'))
                Text(
                  experience['location']!,
                  style: textStyle,
                ),
              if (experience.containsKey('description'))
                Text(
                  experience['description']!,
                  style: textStyle,
                ),
            ],
          ),
        ),
        beforeLineStyle: const LineStyle(
          color: Colors.white,
          thickness: 2,
        ),
      );
    }).toList();
  }
}