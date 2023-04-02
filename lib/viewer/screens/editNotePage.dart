import 'package:firebase_notes/helper/FireStoreHelper.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  @override
  Widget build(BuildContext context) {
    Map editValue = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        leading: OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          OutlinedButton(
              onPressed: () {},
              child: const Icon(
                Icons.send_outlined,
                color: Colors.black,
              )),
          const SizedBox(
            width: 6,
          ),
          OutlinedButton(
              onPressed: () {
                StoreHelper.storeHelper.removeNotes(id: 'id');
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.delete,
                color: Colors.black,
              )),
          const SizedBox(
            width: 6,
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: myColor2,
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.yellow.shade100;
                                        myColor2 = Colors.yellow.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.yellow.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.purple.shade100;
                                        myColor2 = Colors.purple.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.purple.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.blueGrey.shade100;
                                        myColor2 = Colors.blueGrey.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.blueGrey.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.pink.shade100;
                                        myColor2 = Colors.pink.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.pink.shade100,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.green.shade100;
                                        myColor2 = Colors.green.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.green.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.blue.shade100;
                                        myColor2 = Colors.blue.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.blue.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.red.shade100;
                                        myColor2 = Colors.red.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.red.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.cyan.shade100;
                                        myColor2 = Colors.cyan.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.cyan.shade100,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.teal.shade100;
                                        myColor2 = Colors.teal.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.teal.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.orange.shade100;
                                        myColor2 = Colors.orange.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.orange.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.amber.shade100;
                                        myColor2 = Colors.amber.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.amber.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.brown.shade100;
                                        myColor2 = Colors.brown.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.brown.shade100,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.purpleAccent.shade200;
                                        myColor2 = Colors.purpleAccent.shade100;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.purpleAccent.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.blueAccent.shade200;
                                        myColor2 = Colors.blueAccent.shade100;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.blueAccent.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.deepPurple.shade100;
                                        myColor2 = Colors.deepPurple.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.deepPurple.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.pinkAccent.shade200;
                                        myColor2 = Colors.pinkAccent.shade100;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.pinkAccent.shade100,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.indigo.shade100;
                                        myColor2 = Colors.indigo.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.indigo.shade100,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 33,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.lime.shade100;
                                        myColor2 = Colors.lime.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.lime.shade100,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
          key: editFormKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (val) {
                  editValue['title'] = val as Object;
                },
                initialValue: editValue['title'],
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              TextFormField(
                onSaved: (val) {
                  editValue['subtitle'] = val as Object;
                },
                maxLines: null,
                initialValue: editValue['subtitle'],
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onFieldSubmitted: (val) {
                  if (editFormKey.currentState!.validate()) {
                    editFormKey.currentState!.save();

                    StoreHelper.storeHelper.editNote(
                        id: ['id'].toString(),
                        data: editValue as Map<Object, Object>);

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: myColor,
    );
  }
}

/*         Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 200,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Tap to add new note",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade900),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('addNote');
                            },
                            child: Container(
                              height: 125,
                              width: 100,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/image/notesicon.png',
                                    height: 60,
                                    width: 60,
                                    color: Colors.purple.shade900,
                                  ),
                                  Text(
                                    "Add Note's",
                                    style: TextStyle(
                                        color: Colors.purple.shade900,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('addNote');
                            },
                            child: Container(
                              height: 125,
                              width: 100,
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/image/cheklisticon.png',
                                    height: 60,
                                    width: 60,
                                    color: Colors.purple.shade900,
                                  ),
                                  Text(
                                    "All Note's",
                                    style: TextStyle(
                                        color: Colors.purple.shade900,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

 */
