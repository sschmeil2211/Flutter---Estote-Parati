// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

import 'package:estote_parati/src/widgets/widgets.dart';

class AnnouncementCard extends StatelessWidget {
  final Color color;
  final String date;
  final String hour;
  final String type;
  final String title;

  const AnnouncementCard({
    required this.color,
    required this.date,
    required this.hour,
    required this.type,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.type,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, right: 45),
              child: Text(
                this.title,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.watch_later_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Text(
                  this.hour,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
      color: this.color,
      corner: Text(
        this.date,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}