import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helper/FireBaseAuthHelper.dart';
import '../../helper/FireStoreHelper.dart';
import '../../helper/Global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  String? title;
  String? subTitle;
  final GlobalKey<FormState> notesKey = GlobalKey<FormState>();
  final GlobalKey<FormState> editNoteKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  Random random = Random();
  Map<Object, Object> editValue = {};

  int i = 0;

  void changeIndex() {
    setState(() => i = random.nextInt(3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text(
            "My Notes",
            style: TextStyle(
                color: Colors.purple.shade900, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  await AuthHelper.authHelper.logOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('signIn', (route) => false);
                },
                icon: Icon(
                  Icons.power_settings_new,
                  color: Colors.purple.shade900,
                )),
            IconButton(
              onPressed: () async {
                await openAppSettings();
              },
              icon: Icon(
                Icons.settings,
                color: Colors.purple.shade900,
              ),
            ),
          ],
        ),
        body: Center(
          child: StreamBuilder(
            stream: StoreHelper.storeHelper.getNotes(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error :- ${snapshot.error} ",
                    style: TextStyle(color: Colors.purple.shade900),
                  ),
                );
              } else if (snapshot.hasData) {
                data = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          // onTap: () {
                          //   Map<Object, Object> editValue = {
                          //     'title': data[i]['title'],
                          //     'subtitle': data[i]['subtitle']
                          //   };
                          //   showModalBottomSheet(
                          //       shape: const RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.vertical(
                          //               top: Radius.circular(50))),
                          //       context: context,
                          //       builder: (context) {
                          //         return BottomSheet(
                          //             shape: const RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.vertical(
                          //                     top: Radius.circular(50))),
                          //             onClosing: () {},
                          //             builder: (context) {
                          //               return Container(
                          //                 decoration: BoxDecoration(
                          //                     color: myColor,
                          //                     borderRadius:
                          //                         const BorderRadius.vertical(
                          //                             top:
                          //                                 Radius.circular(50))),
                          //                 height: double.infinity,
                          //                 child: Form(
                          //                   key: editNoteKey,
                          //                   child: Column(
                          //                     children: [
                          //                       Container(
                          //                         height: 60,
                          //                         width: double.infinity,
                          //                         decoration: BoxDecoration(
                          //                             color: myColor,
                          //                             borderRadius:
                          //                                 const BorderRadius
                          //                                         .vertical(
                          //                                     top: Radius
                          //                                         .circular(
                          //                                             50))),
                          //                         child: Row(
                          //                           mainAxisAlignment:
                          //                               MainAxisAlignment
                          //                                   .spaceAround,
                          //                           children: [
                          //                             OutlinedButton(
                          //                               onPressed: () {
                          //                                 Navigator.of(context)
                          //                                     .pop();
                          //                               },
                          //                               child: const Icon(
                          //                                 Icons.arrow_back_ios,
                          //                                 color: Colors.black,
                          //                               ),
                          //                             ),
                          //                             const Text(
                          //                               "Edit Notes",
                          //                               style: TextStyle(
                          //                                   color: Colors.black,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .bold),
                          //                             ),
                          //                             OutlinedButton(
                          //                               onPressed: () {
                          //                                 Navigator.of(context)
                          //                                     .pop();
                          //                               },
                          //                               child: const Text(
                          //                                 "Done",
                          //                                 style: TextStyle(
                          //                                     color:
                          //                                         Colors.black),
                          //                               ),
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding:
                          //                             const EdgeInsets.only(
                          //                                 left: 10),
                          //                         child: TextFormField(
                          //                           style: const TextStyle(
                          //                             color: Colors.black,
                          //                           ),
                          //                           validator: (val) {
                          //                             if (val!.isEmpty) {
                          //                               return "Enter Your title....";
                          //                             }
                          //                             return null;
                          //                           },
                          //                           onSaved: (val) {
                          //                             editValue['title'] =
                          //                                 val as Object;
                          //                           },
                          //                           keyboardType: TextInputType
                          //                               .emailAddress,
                          //                           textInputAction:
                          //                               TextInputAction.next,
                          //                           initialValue: data[i]
                          //                               ['title'],
                          //                           decoration:
                          //                               const InputDecoration(
                          //                                   border: InputBorder
                          //                                       .none),
                          //                         ),
                          //                       ),
                          //                       Padding(
                          //                         padding:
                          //                             const EdgeInsets.only(
                          //                                 left: 10),
                          //                         child: TextFormField(
                          //                           style: const TextStyle(
                          //                               color: Colors.black),
                          //                           validator: (val) {
                          //                             if (val!.isEmpty) {
                          //                               return "Enter Your subtitle....";
                          //                             }
                          //                             return null;
                          //                           },
                          //                           maxLines: null,
                          //                           onSaved: (val) {
                          //                             editValue['subtitle'] =
                          //                                 val as Object;
                          //                           },
                          //                           textInputAction:
                          //                               TextInputAction.done,
                          //                           initialValue: data[i]
                          //                                   ['subtitle']
                          //                               .toString(),
                          //                           decoration:
                          //                               const InputDecoration(
                          //                             border: InputBorder.none,
                          //                           ),
                          //                           onFieldSubmitted: (val) {
                          //                             if (editNoteKey
                          //                                 .currentState!
                          //                                 .validate()) {
                          //                               editNoteKey
                          //                                   .currentState!
                          //                                   .save();
                          //
                          //                               StoreHelper.storeHelper
                          //                                   .editNote(
                          //                                       id: data[i]
                          //                                               ['id']
                          //                                           .toString(),
                          //                                       data:
                          //                                           editValue);
                          //
                          //                               Navigator.of(context)
                          //                                   .pop();
                          //                             }
                          //                           },
                          //                         ),
                          //                       ),
                          //                       const Spacer(),
                          //                       GestureDetector(
                          //                         onTap: () {
                          //                           setState(() {});
                          //                         },
                          //                         child: Container(
                          //                           height: 60,
                          //                           width: double.infinity,
                          //                           color: myColor1,
                          //                           child: Row(
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .spaceAround,
                          //                             children: [
                          //                               IconButton(
                          //                                   onPressed:
                          //                                       () async {
                          //                                     await Permission
                          //                                         .camera
                          //                                         .request();
                          //                                   },
                          //                                   icon: const Icon(
                          //                                     Icons
                          //                                         .camera_alt_outlined,
                          //                                     color:
                          //                                         Colors.black,
                          //                                   )),
                          //                               IconButton(
                          //                                   onPressed:
                          //                                       () async {
                          //                                     await Permission
                          //                                         .storage
                          //                                         .request();
                          //                                   },
                          //                                   icon: const Icon(
                          //                                     Icons
                          //                                         .photo_album_outlined,
                          //                                     color:
                          //                                         Colors.black,
                          //                                   )),
                          //                               IconButton(
                          //                                   onPressed: () {
                          //                                     showDialog(
                          //                                         context:
                          //                                             context,
                          //                                         builder:
                          //                                             (context) {
                          //                                           return AlertDialog(
                          //                                             content:
                          //                                                 Column(
                          //                                               mainAxisAlignment:
                          //                                                   MainAxisAlignment.spaceAround,
                          //                                               mainAxisSize:
                          //                                                   MainAxisSize.min,
                          //                                               children: [
                          //                                                 Row(
                          //                                                   mainAxisAlignment:
                          //                                                       MainAxisAlignment.spaceAround,
                          //                                                   children: [
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.yellow.shade100;
                          //                                                           myColor1 = Colors.yellow.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.yellow.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.purple.shade100;
                          //                                                           myColor1 = Colors.purple.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.purple.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.blueGrey.shade100;
                          //                                                           myColor1 = Colors.blueGrey.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.blueGrey.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.pink.shade100;
                          //                                                           myColor1 = Colors.pink.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.pink.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                   ],
                          //                                                 ),
                          //                                                 const SizedBox(
                          //                                                   height:
                          //                                                       5,
                          //                                                 ),
                          //                                                 Row(
                          //                                                   mainAxisAlignment:
                          //                                                       MainAxisAlignment.spaceAround,
                          //                                                   children: [
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.green.shade100;
                          //                                                           myColor1 = Colors.green.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.green.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.blue.shade100;
                          //                                                           myColor1 = Colors.blue.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.blue.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.red.shade100;
                          //                                                           myColor1 = Colors.red.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.red.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.cyan.shade100;
                          //                                                           myColor1 = Colors.cyan.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.cyan.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                   ],
                          //                                                 ),
                          //                                                 const SizedBox(
                          //                                                   height:
                          //                                                       5,
                          //                                                 ),
                          //                                                 Row(
                          //                                                   mainAxisAlignment:
                          //                                                       MainAxisAlignment.spaceAround,
                          //                                                   children: [
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.teal.shade100;
                          //                                                           myColor1 = Colors.teal.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.teal.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.orange.shade100;
                          //                                                           myColor1 = Colors.orange.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.orange.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.amber.shade100;
                          //                                                           myColor1 = Colors.amber.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.amber.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.brown.shade100;
                          //                                                           myColor1 = Colors.brown.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.brown.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                   ],
                          //                                                 ),
                          //                                                 const SizedBox(
                          //                                                   height:
                          //                                                       5,
                          //                                                 ),
                          //                                                 Row(
                          //                                                   mainAxisAlignment:
                          //                                                       MainAxisAlignment.spaceAround,
                          //                                                   children: [
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.indigo.shade100;
                          //                                                           myColor1 = Colors.indigo.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.indigo.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.lime.shade100;
                          //                                                           myColor1 = Colors.lime.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.lime.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.deepOrange.shade100;
                          //                                                           myColor1 = Colors.deepOrange.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.deepOrange.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.lightGreen.shade100;
                          //                                                           myColor1 = Colors.lightGreen.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.lightGreen.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                   ],
                          //                                                 ),
                          //                                                 const SizedBox(
                          //                                                   height:
                          //                                                       5,
                          //                                                 ),
                          //                                                 Row(
                          //                                                   mainAxisAlignment:
                          //                                                       MainAxisAlignment.spaceAround,
                          //                                                   children: [
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.purpleAccent.shade200;
                          //                                                           myColor1 = Colors.purpleAccent.shade100;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.purpleAccent.shade200,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.blueAccent.shade200;
                          //                                                           myColor1 = Colors.blueAccent.shade100;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.blueAccent.shade200,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.deepPurple.shade100;
                          //                                                           myColor1 = Colors.deepPurple.shade50;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.deepPurple.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                     GestureDetector(
                          //                                                       onTap: () {
                          //                                                         setState(() {
                          //                                                           myColor = Colors.pinkAccent.shade200;
                          //                                                           myColor1 = Colors.pinkAccent.shade100;
                          //                                                         });
                          //                                                         Navigator.of(context).pop();
                          //                                                       },
                          //                                                       child: CircleAvatar(
                          //                                                         radius: 14,
                          //                                                         backgroundColor: Colors.pinkAccent.shade100,
                          //                                                       ),
                          //                                                     ),
                          //                                                   ],
                          //                                                 ),
                          //                                               ],
                          //                                             ),
                          //                                           );
                          //                                         });
                          //                                   },
                          //                                   icon: const Icon(
                          //                                     Icons
                          //                                         .color_lens_outlined,
                          //                                     color:
                          //                                         Colors.black,
                          //                                   )),
                          //                               IconButton(
                          //                                   onPressed:
                          //                                       () async {
                          //                                     DateTime? data =
                          //                                         await showDatePicker(
                          //                                             selectableDayPredicate:
                          //                                                 (DateTime
                          //                                                     val) {
                          //                                               if (val.isAfter(DateTime.now().subtract(const Duration(days: 1))) &&
                          //                                                   val.isBefore(DateTime.now().add(const Duration(days: 15)))) {
                          //                                                 return true;
                          //                                               }
                          //                                               return false;
                          //                                             },
                          //                                             context:
                          //                                                 context,
                          //                                             initialDate:
                          //                                                 Global
                          //                                                     .currentDate,
                          //                                             firstDate:
                          //                                                 DateTime(
                          //                                                     2022),
                          //                                             lastDate:
                          //                                                 DateTime(
                          //                                                     2030));
                          //                                     if (data!.month ==
                          //                                         1) {
                          //                                       Global.selMonth =
                          //                                           'Jan';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         2) {
                          //                                       Global.selMonth =
                          //                                           'Feb';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         3) {
                          //                                       Global.selMonth =
                          //                                           'March';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         4) {
                          //                                       Global.selMonth =
                          //                                           'April';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         5) {
                          //                                       Global.selMonth =
                          //                                           'May';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         6) {
                          //                                       Global.selMonth =
                          //                                           'Jun';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         7) {
                          //                                       Global.selMonth =
                          //                                           'July';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         8) {
                          //                                       Global.selMonth =
                          //                                           'Aug';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         9) {
                          //                                       Global.selMonth =
                          //                                           'Sep';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         10) {
                          //                                       Global.selMonth =
                          //                                           'Oct';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         11) {
                          //                                       Global.selMonth =
                          //                                           'Nov';
                          //                                     } else if (data
                          //                                             .month ==
                          //                                         12) {
                          //                                       Global.selMonth =
                          //                                           'Dec';
                          //                                     }
                          //                                     setState(() {
                          //                                       Global.selDate =
                          //                                           '${data.day},${Global.selMonth} ${data.year}';
                          //                                     });
                          //                                   },
                          //                                   icon: const Icon(
                          //                                     Icons
                          //                                         .notifications_off_outlined,
                          //                                     color:
                          //                                         Colors.black,
                          //                                   )),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               );
                          //             });
                          //       });
                          //
                          //   Navigator.of(context).pushNamed('editNotePage',
                          //       arguments: editValue);
                          // }
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('editNotePage', arguments: data[i]);
                          },
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Are You Sure?",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.purple.shade900,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "You Are About Delete This Note.",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.purple.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "No",
                                          style: TextStyle(
                                              color: Colors.purple.shade900,
                                              fontSize: 15),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          StoreHelper.storeHelper
                                              .removeNotes(id: data[i]['id']);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.purple.shade900,
                                        ),
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                        ),
                                      )
                                    ],
                                    backgroundColor: Colors.white,
                                  );
                                });
                          },
                          child: Ink(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                // color: myColor,
                                color: Global.cardsColor[i],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.purple.shade900,
                                  width: 2,
                                ),
                              ),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[i]['date'],
                                    // "${Global.currentDay} ${Global.months[Global.currentMonth - 1]},${Global.currentYear}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),

                                  Text(
                                    data[i]['title'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                  // Text(data[i]['dateTime']),
                                  Text(
                                    data[i]['subtitle'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        data[i]['time'],
                                        // "${Global.currentHour}:${Global.currentMint}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple.shade900,
          onPressed: () {
            Navigator.of(context).pushNamed('addNotePage');
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }
}
