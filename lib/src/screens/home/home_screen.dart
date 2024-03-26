// ignore_for_file: unnecessary_this, curly_braces_in_flow_control_structures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:estote_parati/src/models/models.dart';
import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/utils/utils.dart';
import 'package:estote_parati/src/widgets/widgets.dart';
import 'package:estote_parati/src/extensions/extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GroupAdvice? groupAdvice = Provider.of<GroupAdviceProvider>(context, listen: false).nextAdvice;
    Event? event = Provider.of<EventProvider>(context, listen: false).getNextEvent();

    String from = getHour(event?.from ?? Timestamp.now());
    String to = getHour(event?.to ?? Timestamp.now());

    return Scaffold(
      bottomNavigationBar: const MenuBottomNavigationBar(selectedTab: ApplicationTab.home),
      backgroundColor: groupColor,
      body: ScrollableBody(
        onTap: () => showModalBottomSheet(
          context: context,
          builder: (context) => const MissionsModal()
        ),
        scrollable: true,
        backgroundHeader: 'Misiones',
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            if(event != null)
              CustomizedCard(
                color: scoutColor,
                headerText: translateEventType(event.eventType),
                corner: Text(
                  getDayAndMonthShortFormat(event.from),
                  style: simpleStyle
                ),
                body: Text(event.name, style: bodyStyle),
                footerText: event.isAllDay ? null : '$from - $to',
                footerIcon: event.isAllDay ? null : Icons.watch_later_outlined
              ),
            CustomizedCard(
              color: groupColor,
              headerText: 'Próximo Consejo',
              corner: Text(
                getDayAndMonthShortFormat(groupAdvice?.date ?? Timestamp.now()),
                style: simpleStyle
              ),
              body: Text(groupAdvice?.topics.keys.join(', ').capitalize() ?? '', style: bodyStyle),
              footerText: '11:00 - 14:00',
              footerIcon: Icons.watch_later_outlined
            ),
            ImageCardBlock(
              icon: FontAwesomeIcons.solidShareFromSquare,
              onTapFunctions: [
                (){},
                (){},
                () async => await launchUrl(Uri.parse('https://docs.google.com/document/d/1WzQUBWx_46oIZ28JzNtupnL_P-ZBvFPC/edit?usp=drive_link&ouid=110085676831560216392&rtpof=true&sd=true')),
                (){}
              ],
              blockName: 'Plan de ramas',
              imagePaths: branchLogos,
              colors: branchColors,
            ),
          ],
        )
      )
    );
  }
}