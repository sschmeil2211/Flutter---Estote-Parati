// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CustomizedCardElements> cards = CustomizedCardElements.resourceCards;

    return Scaffold(
        bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.resource),
        backgroundColor: groupColor,
        body: ScrollableBody(
          onTap: () async => await launchUrl(Uri.parse('https://scouts.org.ar')),
          backgroundHeader: 'S.A.',
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: cards.map((e) => InkWell(
                  child: CustomizedCard(
                    color: e.color,
                    headerText: e.headerText,
                    footerText: e.footerText,
                    footerIcon: e.footerIcon,
                  ),
                  onTap: () => Navigator.pushNamed(context, e.route!),
                )).toList(),
              ),
              ImageCardBlock(
                onTapFunctions: [
                  () async => await launchUrl(Uri.parse('https://www.cruz-del-sur.org.ar/auth/login')),
                  () async => await launchUrl(Uri.parse('https://rumbosur.scouts.org.ar'))
                ],
                icon: FontAwesomeIcons.solidShareFromSquare,
                blockName: 'Scouts de Argentina',
                colors: const [Color(0xFF187DEE), Color(0xFF187DEE)],
                imagePaths: saLogos,
              )
            ],
          )
        )
    );
  }
}