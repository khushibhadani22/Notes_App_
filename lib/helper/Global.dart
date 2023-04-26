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
  static int selMint = 0;
  static DateTime currentDate = DateTime.now();
  static TimeOfDay currentTime = TimeOfDay.now();

  static List<String> months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Agu',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static int currentDay = DateTime.now().day;
  static int currentMonth = DateTime.now().month;
  static int currentYear = DateTime.now().year;
  static int currentHour = DateTime.now().hour;
  static int currentMint = DateTime.now().minute;

  static List<Color> cardsColor = [
    Colors.purple.shade100,
    Colors.pink.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.teal.shade100,
    Colors.lime.shade100,
    Colors.orange.shade100,
    Colors.blueGrey.shade100,
    Colors.red.shade100,
    Colors.deepPurple.shade100,
    Colors.indigo.shade100,
    Colors.amber.shade100,
    Colors.brown.shade100,
    Colors.cyan.shade100,
    Colors.deepOrange.shade100,
  ];

  static List<Map<String, Color>> myColor = [
    {
      'color': Colors.yellow.shade100,
    },
    {
      'color': Colors.purple.shade100,
    },
    {
      'color': Colors.blueGrey.shade100,
    },
    {
      'color': Colors.pink.shade100,
    },
  ];
  static List<Map<String, Color>> myColor1 = [
    {
      'color': Colors.green.shade100,
    },
    {
      'color': Colors.red.shade100,
    },
    {
      'color': Colors.blue.shade100,
    },
    {
      'color': Colors.cyan.shade100,
    },
  ];
  static List<Map<String, Color>> myColor2 = [
    {
      'color': Colors.teal.shade100,
    },
    {
      'color': Colors.orange.shade100,
    },
    {
      'color': Colors.brown.shade100,
    },
    {
      'color': Colors.amber.shade100,
    },
  ];
  static List<Map<String, Color>> myColor3 = [
    {
      'color': Colors.indigo.shade100,
    },
    {
      'color': Colors.lime.shade100,
    },
    {
      'color': Colors.deepOrange.shade100,
    },
    {
      'color': Colors.lightGreen.shade100,
    },
  ];
  static List<Map<String, Color>> myColor4 = [
    {
      'color': Colors.purpleAccent.shade200,
    },
    {
      'color': Colors.blueAccent.shade200,
    },
    {
      'color': Colors.deepPurple.shade100,
    },
    {
      'color': Colors.pinkAccent.shade200,
    },
  ];

  static List<Color> bsColor = [
    Colors.yellow.shade50,
    Colors.purple.shade50,
    Colors.blueGrey.shade50,
    Colors.pink.shade50,
    Colors.green.shade50,
    Colors.blue.shade50,
    Colors.red.shade50,
    Colors.cyan.shade50,
    Colors.teal.shade50,
    Colors.orange.shade50,
    Colors.amber.shade50,
    Colors.brown.shade50,
    Colors.purpleAccent.shade100,
    Colors.blueAccent.shade100,
    Colors.deepPurple.shade50,
    Colors.pinkAccent.shade100,
    Colors.indigo.shade50,
    Colors.lime.shade50,
  ];
}

String sfLogin = 'login';
