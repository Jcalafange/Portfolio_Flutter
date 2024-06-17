import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:portfolio_flutter/utils/screen_helper.dart';

import '../data/footer_items.dart';
import '../utils/constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) => ScreenHelper(
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context), context),
        tablet: _buildUi(tabletMaxWidth, context),
        desktop: _buildUi(desktopMaxWidth, context),
      );

  Widget _buildUi(double width, BuildContext context) => Center(
        child: ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: footerItems
                          .map(
                            (footerItem) => SizedBox(
                              height: 120,
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2 - 20
                                  : constraints.maxWidth / 4 - 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(footerItem.iconPath,
                                          width: 25),
                                      const SizedBox(width: 15),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.oswald(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '${footerItem.text1}\n',
                                          style: const TextStyle(
                                            color: captionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${footerItem.text2}\n',
                                          style: const TextStyle(
                                              color: captionColor),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Flex(
                    direction: ScreenHelper.isMobile(context)
                        ? Axis.vertical
                        : Axis.horizontal,
                    mainAxisAlignment: ScreenHelper.isMobile(context)
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Copyright (c) 2023 $name. All right Reserved',
                          style: TextStyle(color: captionColor),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: const MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                'Privacy Policy',
                                style: TextStyle(color: captionColor),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Text(
                              '|',
                              style: TextStyle(color: captionColor),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Text(
                                'Terms & Condition',
                                style: TextStyle(color: captionColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16)
                ],
              );
            },
          ),
        ),
      );
}
