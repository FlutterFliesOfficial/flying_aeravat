import 'package:fake_fireman/config/config.dart';
import 'package:flutter/material.dart';

class CreditCard {
  String cardNumber;
  String date;
  String cardBalance;

  Color color1;
  Color color2;
  Color color3;

  CreditCard(
      {required this.cardNumber,
      required this.cardBalance,
      required this.date,
      this.color1 = primaryColor,
      this.color2 = Colors.yellow,
      this.color3 = Colors.pinkAccent});
}
