import 'package:book_app/constants.dart';
import 'package:flutter/material.dart';
//المقياس هنا هو fontsize,fontweight

abstract class Styles {
  static const textstyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const textstyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const textstyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
    fontFamily: kGtSectraFine,
  );
  static const textstyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const textstyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
