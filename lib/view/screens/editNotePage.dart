import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_notes/helper/FireStoreHelper.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import '../../helper/Global.dart';
import 'AddNotesPage.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({Key? key}) : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  String? note;
  String? type;
  Map<Object, Object> newData = {};
  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot editValue =
        ModalRoute.of(context)!.settings.arguments as QueryDocumentSnapshot;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: myColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          OutlinedButton(
              onPressed: () {
                setState(() {
                  Share.share(
                      "Today's Note :- ${newData['title']}\n${newData['subtitle']}");
                });
              },
              child: const Icon(
                Icons.send_outlined,
                color: Colors.black,
              )),
          const SizedBox(
            width: 6,
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
                StoreHelper.storeHelper.removeNotes(id: editValue['id']);
              },
              child: const Icon(
                Icons.delete,
                color: Colors.black,
              )),
          const SizedBox(
            width: 6,
          ),
          OutlinedButton(
            onPressed: () {
              StoreHelper.storeHelper
                  .editNote(id: editValue['id'], data: newData);

              Navigator.of(context).pop();
            },
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: myColor1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () async {
                  await Permission.camera.request();
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  await Permission.storage.request();
                },
                icon: const Icon(
                  Icons.photo_album_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: Global.myColor
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                myColor = e['colors'];
                                                myColor1 = e['color'];
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: e['colors'],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: Global.myColor2
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                myColor = e['colors'];
                                                myColor1 = e['color'];
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: e['colors'],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: Global.myColor3
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                myColor = e['colors'];
                                                myColor1 = e['color'];
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: e['colors'],
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: Global.myColor4
                                      .map((e) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                myColor = e['colors'];
                                                myColor1 = e['color'];
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              radius: 14,
                                              backgroundColor: e['colors'],
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ]),
                        );
                      });
                },
                icon: const Icon(
                  Icons.color_lens_outlined,
                  color: Colors.black,
                )),
            IconButton(
                onPressed: () async {
                  DateTime? data = await showDatePicker(
                      selectableDayPredicate: (DateTime val) {
                        if (val.isAfter(DateTime.now()
                                .subtract(const Duration(days: 1))) &&
                            val.isBefore(
                                DateTime.now().add(const Duration(days: 15)))) {
                          return true;
                        }
                        return false;
                      },
                      context: context,
                      initialDate: Global.currentDate,
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2030));
                  if (data!.month == 1) {
                    Global.selMonth = 'Jan';
                  } else if (data.month == 2) {
                    Global.selMonth = 'Feb';
                  } else if (data.month == 3) {
                    Global.selMonth = 'March';
                  } else if (data.month == 4) {
                    Global.selMonth = 'April';
                  } else if (data.month == 5) {
                    Global.selMonth = 'May';
                  } else if (data.month == 6) {
                    Global.selMonth = 'Jun';
                  } else if (data.month == 7) {
                    Global.selMonth = 'July';
                  } else if (data.month == 8) {
                    Global.selMonth = 'Aug';
                  } else if (data.month == 9) {
                    Global.selMonth = 'Sep';
                  } else if (data.month == 10) {
                    Global.selMonth = 'Oct';
                  } else if (data.month == 11) {
                    Global.selMonth = 'Nov';
                  } else if (data.month == 12) {
                    Global.selMonth = 'Dec';
                  }
                  setState(() {
                    Global.selDate =
                        '${data.day},${Global.selMonth} ${data.year}';
                  });
                },
                icon: const Icon(
                  Icons.notifications_off_outlined,
                  color: Colors.black,
                )),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (val) {
                    newData['title'] = val;
                  },
                  initialValue: editValue['title'],
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    newData['subtitle'] = val;
                  },
                  maxLines: null,
                  initialValue: editValue['subtitle'],
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: myColor,
    );
  }
}
