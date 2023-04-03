import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helper/FireStoreHelper.dart';
import '../../helper/Global.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String? title;
  String? subtitle;

  final GlobalKey<FormState> notesKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  // Random random = Random();
  //
  // int i = 0;
  //
  // void changeIndex() {
  //   setState(() => i = random.nextInt(3));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
              onPressed: () {},
              child: const Icon(
                Icons.more_horiz,
                color: Colors.black,
              )),
          const SizedBox(
            width: 6,
          ),
          OutlinedButton(
            onPressed: () async {
              if (notesKey.currentState!.validate()) {
                notesKey.currentState!.save();

                await StoreHelper.storeHelper.addNote(
                  title: title!,
                  subtitle: subtitle!,
                );
                Navigator.of(context).pop();

                titleController.clear();
                subTitleController.clear();

                setState(() {
                  title = null;
                  subtitle = null;
                });
              }
            },
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: myColor,
        title: const Text(""),
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
                                        myColor1 = Colors.yellow.shade50;
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
                                        myColor1 = Colors.purple.shade50;
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
                                        myColor1 = Colors.blueGrey.shade50;
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
                                        myColor1 = Colors.pink.shade50;
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
                                        myColor1 = Colors.green.shade50;
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
                                        myColor1 = Colors.blue.shade50;
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
                                        myColor1 = Colors.red.shade50;
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
                                        myColor1 = Colors.cyan.shade50;
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
                                        myColor1 = Colors.teal.shade50;
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
                                        myColor1 = Colors.orange.shade50;
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
                                        myColor1 = Colors.amber.shade50;
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
                                        myColor1 = Colors.brown.shade50;
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
                                        myColor = Colors.indigo.shade100;
                                        myColor1 = Colors.indigo.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.indigo.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.lime.shade100;
                                        myColor1 = Colors.lime.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.lime.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.deepOrange.shade100;
                                        myColor1 = Colors.deepOrange.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.deepOrange.shade100,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.lightGreen.shade100;
                                        myColor1 = Colors.lightGreen.shade50;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.lightGreen.shade100,
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
                                        myColor1 = Colors.purpleAccent.shade100;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.purpleAccent.shade200,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.blueAccent.shade200;
                                        myColor1 = Colors.blueAccent.shade100;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor:
                                          Colors.blueAccent.shade200,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myColor = Colors.deepPurple.shade100;
                                        myColor1 = Colors.deepPurple.shade50;
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
                                        myColor1 = Colors.pinkAccent.shade100;
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
                            ],
                          ),
                          // content: Column(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   mainAxisSize: MainAxisSize.min,
                          //   children: [
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceAround,
                          //   children: Global.myColor
                          //       .map(
                          //         (e) => GestureDetector(
                          //           onTap: () {},
                          //           child: CircleAvatar(
                          //             radius: 14,
                          //             backgroundColor: e['color'],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceAround,
                          //   children: Global.myColor1
                          //       .map(
                          //         (e) => GestureDetector(
                          //           onTap: () {},
                          //           child: CircleAvatar(
                          //             radius: 14,
                          //             backgroundColor: e['color'],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceAround,
                          //   children: Global.myColor2
                          //       .map(
                          //         (e) => GestureDetector(
                          //           onTap: () {},
                          //           child: CircleAvatar(
                          //             radius: 14,
                          //             backgroundColor: e['color'],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceAround,
                          //   children: Global.myColor3
                          //       .map(
                          //         (e) => GestureDetector(
                          //           onTap: () {
                          //             setState(() {
                          //               myColor2 = e['color'];
                          //             });
                          //             Navigator.of(context).pop();
                          //           },
                          //           child: CircleAvatar(
                          //             radius: 14,
                          //             backgroundColor: e['color'],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Row(
                          //   mainAxisAlignment:
                          //       MainAxisAlignment.spaceAround,
                          //   children: Global.myColor4
                          //       .map(
                          //         (e) => GestureDetector(
                          //           onTap: () {},
                          //           child: CircleAvatar(
                          //             radius: 14,
                          //             backgroundColor: e['color'],
                          //           ),
                          //         ),
                          //       )
                          //       .toList(),
                          // ),
                          //
                          //   ],
                          // ),
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
        padding: const EdgeInsets.all(20),
        child: Form(
          key: notesKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Global.currentDay} ${Global.months[Global.currentMonth - 1]},${Global.currentYear}",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Global.currentHour}:${Global.currentMint}",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              TextFormField(
                controller: titleController,
                onSaved: (val) {
                  title = val;
                },
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                textInputAction: TextInputAction.next,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note Title",
                  hintStyle:
                      TextStyle(fontSize: 20, color: Colors.grey.shade600),
                ),
              ),
              TextFormField(
                controller: subTitleController,
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter notes";
                  }
                  return null;
                },
                onSaved: (val) {
                  subtitle = val;
                },
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                cursorColor: Colors.white,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: "Type something....",
                  hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: myColor,
    );
  }
}

dynamic myColor = Colors.purple.shade100;
dynamic myColor1 = Colors.purple.shade50;
