import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/data/list.dart';
import 'package:flip_card/flip_card.dart';

Widget playerCards() {
  return Container(
    child: FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        height: displayHeight * 0.18,
        decoration: BoxDecoration(color: subColor),
        child: Text('FRONT'),
      ),
      back: Container(
        height: displayHeight * 0.18,
        child: Text('Back'),
        decoration: BoxDecoration(color: Colors.white),
      ),
    ),
  );
}
