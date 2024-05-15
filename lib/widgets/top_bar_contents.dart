import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:portfolio_flutter/utils/screen_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({
    super.key,
    required this.opacity,
    required this.itemsScrollController,
  });

  final double opacity;
  final ItemScrollController itemsScrollController;

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final desktopheader = PreferredSize(
        child: DesktopTabBar(
          widget: widget,
          screenSize: screenSize,
          itemsScrollController: widget.itemsScrollController,
        ),
        preferredSize: Size(screenSize.width, 70));

    return ScreenHelper(
      desktop: desktopheader,
      tablet: desktopheader,
      mobile: buildMobileHeader(),
    );
  }
}

class DesktopTabBar extends StatelessWidget {
  const DesktopTabBar(
      {super.key,
      required this.screenSize,
      required this.widget,
      this.itemsScrollController});

  final Size screenSize;
  final TopBarContents widget;
  final ItemScrollController? itemsScrollController;

  InkWell menuItem({required int toPage, required String title}) {
    return InkWell(
      onTap: () => itemsScrollController?.scrollTo(
        index: toPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 24),
            menuItem(toPage: 0, title: 'Home'),
            const SizedBox(width: 24),
            menuItem(toPage: 1, title: 'Sobre'),
            const SizedBox(width: 24),
            menuItem(toPage: 2, title: 'Meus Projetos'),
            const SizedBox(width: 24),
            menuItem(toPage: 3, title: 'Educação'),
            const SizedBox(width: 24),
            menuItem(toPage: 4, title: 'Linguagens'),
            const SizedBox(width: 24),
            menuItem(toPage: 5, title: 'Contato')
          ],
        ),
      ),
    );
  }
}

Widget buildMobileHeader() => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderLogo(),
            GestureDetector(
              // onTap: () => Globals.scaffoldKey.currentState!.openEndDrawer(),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 28,
              ),
            )
          ],
        ),
      ),
);

class HeaderLogo extends StatelessWidget {
  HeaderLogo({super.key});

  final style = GoogleFonts.oswald(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 30, right: 10),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: name.characters.first, style: style),
              TextSpan(text: '.', style: style),
            ],
          ),
        ),
      );
}