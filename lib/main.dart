import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_flutter/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: name,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: Theme.of(context).copyWith(
          platform: TargetPlatform.android,
          scaffoldBackgroundColor: backgroundColor,
          primaryColor: primaryColor,
          canvasColor: backgroundColor,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        builder: (context, widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, widget!),
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.resize(450, name: TABLET),
            const ResponsiveBreakpoint.resize(450, name: DESKTOP),
          ],
        ),
        home: const HomePage(),
      );
}
