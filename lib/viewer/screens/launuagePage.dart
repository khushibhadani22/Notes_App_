import 'package:flutter/material.dart';

import '../../helper/Global.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Select Language",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text(
                "Done",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              icon: const Icon(
                Icons.done,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: Global.language.length,
            itemBuilder: (context, i) {
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                title: Text("${Global.language[i]['languages1']}"),
                trailing: Text("${Global.language[i]['language2']}"),
              );
            },
          ),
        ));
  }
}
