import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormValidator {
  static String? empty(
    String? value,
  ) {
    if (value == null || value.isEmpty) {
      return 'ThisFieldRequired'.tr();
    }
    return null;
  }
  

  //  static String? isNumeric(){}

  static String? isNumeric(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

   static String? isSteps(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 7000){
        return 'too_many_steps'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isDistance(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 3500){
        return 'too_many_distance'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isPeriodWalk(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 120){
        return 'too_many_period'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isPressure(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 290){
        return 'too_many_value'.tr();
      }
      else if(i<10){
        return 'too_low_value'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isPulse(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 200){
        return 'too_many_pulse'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isRespiratoryRate(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 50){
        return 'too_many_respiratory'.tr();
      }
      else if (i < 10) {
        return "too_low_respiratory".tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isBloodSaturation(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 100){
        return 'too_many_percent'.tr();
      }
      else if(i<50){
        return 'too_low_percent'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? isTemperature(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double i = double.parse(s);
      if(i > 42){
        return 'too_many_temperature'.tr();
      }
      else if(i< 34){
        return 'too_low_temperature'.tr();
      }
      return null;
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? pollingPeriod(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double n = double.parse(s);
      if (n <= 120 && n >= 30) {
        return null;
      } else {
        return 'ThisFieldRequiredBeBetween30and120'.tr();
      }
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? topPoint(
    String? s,
  ) {
    if (s == null) {
      return 'ThisFieldRequired'.tr();
    } else if (double.tryParse(s) != null) {
      double n = double.parse(s);
      if (n <= 500 && n >= 100) {
        return null;
      } else {
        return 'ThisFieldRequiredBeBetween100and500'.tr();
      }
    } else {
      return 'ThisFieldRequiredBeNumeric'.tr();
    }
    //  return double.tryParse(s) != null;
  }

  static String? validateEmail(value) {
    bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value ?? '');
    if (value == null || value.isEmpty || !emailValid) {
      return 'PleaseEnterEmail'.tr();
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null) {
      return 'ThisFieldRequired'.tr();
    }

    // RegExp regEx = RegExp(r"(?=.*[A-Z])\w+");

    if (value.length < 8) {
      return 'PleaseEnterPassword'.tr();
    }

    if (value[0].toUpperCase() != value[0]) {
      return "PasswordStartWithCapitalLetter".tr();
    }

    return null;
  }

  static String? passwordConfirm(value, TextEditingController controller) {
    if (value == null || value.isEmpty) {
      return 'ThisFieldRequired'.tr();
    }

    if (value.toString() != controller.text) {
      return 'PasswordDontMatch'.tr();
    }

    return null;
  }
}
