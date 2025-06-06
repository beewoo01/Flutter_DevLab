import 'package:flutter/material.dart';

enum CardInfo {
  camera('Cameras', Icons.video_call, Color(0xff2354C7), Color(0xffECEFFD)),
  lighting('Lighting', Icons.lightbulb, Color(0xff806C2A), Color(0xffFAEEDF)),
  climate('Climate', Icons.thermostat, Color(0xffA44D2A), Color(0xffFAEDE7)),
  wifi('Wifi', Icons.wifi, Color(0xff417345), Color(0xffE5F4E0)),
  media('Media', Icons.library_music, Color(0xff2556C8), Color(0xffECEFFD)),

  security(
    'Security',
    Icons.crisis_alert,
    Color(0xff794C01),
    Color(0xffFAEEDF),
  ),
  safety(
    'Safety',
    Icons.medical_services,
    Color(0xff2251C5),
    Color(0xffECEFFD),
  ),
  more('', Icons.add, Color(0xff201D1C), Color(0xffE3DFD8));

  const CardInfo(this.label, this.icon, this.color, this.backgroundColor);

  final String label;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
}
