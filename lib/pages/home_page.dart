import 'package:flutter/material.dart';

import 'contact_page.dart';
import 'project_page.dart';
import 'work_tools_page.dart';
import 'about_page.dart';
import 'welcome_page.dart';
import 'experience_page.dart';

import '../widgets/drawer_widget.dart';
import '../widgets/top_bar_contents.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    const WelcomePage(),
    const AboutPage(),
    const ExperiencePage(),
    const ProjectPage(),
    const ToolsPage(),
    const ContactPage(),
  ];

  final pageController = PageController(initialPage: 0);
  final itemScrollController = ItemScrollController();
  final itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: TopBarContents(
          opacity: 0.0,
          itemsScrollController: itemScrollController,
        ),
      ),
      endDrawer: DrawerWidget(itemController: itemScrollController),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../../assets/back.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ScrollablePositionedList.builder(
          initialScrollIndex: 0,
          shrinkWrap: true,
          itemPositionsListener: itemPositionsListener,
          itemScrollController: itemScrollController,
          itemCount: pages.length,
          itemBuilder: (context, index) {
            final page = pages[index];

            return page;
          },
        ),
      ),
    );
  }
}
