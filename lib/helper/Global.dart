import 'package:flutter/material.dart';

class Global {
  static List<Map<String, String>> language = [
    {
      'languages1': 'Afrikaans',
      'language2': 'Afrikaans',
    },
    {
      'languages1': 'Arabic',
      'language2': 'عربي',
    },
    {
      'languages1': 'Bangla',
      'language2': 'বাংলা',
    },
    {
      'languages1': 'Czech',
      'language2': 'čeština',
    },
    {
      'languages1': 'Dutch',
      'language2': 'Nederlands',
    },
    {
      'languages1': 'English',
      'language2': 'English',
    },
    {
      'languages1': 'Persian',
      'language2': 'فارسی',
    },
    {
      'languages1': 'finnish',
      'language2': 'Afrikaans',
    },
    {
      'languages1': 'French',
      'language2': 'Suomalainen',
    },
    {
      'languages1': 'German',
      'language2': 'Deutsch',
    },
    {
      'languages1': 'Hindi',
      'language2': 'हिंदी',
    },
    {
      'languages1': 'Indonesian',
      'language2': 'bahasa Indonesia',
    },
    {
      'languages1': 'Korean',
      'language2': '한국인',
    },
    {
      'languages1': 'Marathi',
      'language2': 'मराठी',
    },
    {
      'languages1': 'Polish',
      'language2': 'Polski',
    },
    {
      'languages1': 'Russian',
      'language2': 'Русский',
    },
    {
      'languages1': 'Spanish',
      'language2': 'Española',
    },
    {
      'languages1': 'Thai',
      'language2': 'แบบไทย',
    },
    {
      'languages1': 'urdu',
      'language2': 'اردو',
    },
    {
      'languages1': 'Vietnamese',
      'language2': 'Tiếng Việt',
    },
  ];
  static List<Map<String, dynamic>> note = [];

  static String selDate = '';
  static String selMonth = '';
  static String selTime = '';
  static int selHour = 0;
  static DateTime currentDate = DateTime.now();
  static TimeOfDay currentTime = TimeOfDay.now();
}
