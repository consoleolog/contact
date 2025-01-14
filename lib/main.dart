import 'package:contact/dialogUi.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      List<Contact> contacts = await FlutterContacts.getContacts(withProperties: true);
      print(contacts);
      setState(() {
        contacts = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      openAppSettings();
    }
  }
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  var total = 3;
  var contacts = [];
  List<String> names = ['김영숙', '홍길동', '피자집'];
  List<int> likes = [0, 0, 0];
  addName(name){
    setState(() {
      names.add(name);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( title: Text("연락처 앱"),
                        actions: [
                          IconButton(onPressed: (){
                            getPermission();
                          }, icon:Icon(Icons.contacts)),
                        ],),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (c, i){
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(contacts[i].displayName ?? "이름없는사람"),
            );
          },
        ),
        bottomNavigationBar: const BottomAppBar(),
        floatingActionButton: Builder(
          builder: (jokbo1) {
            return FloatingActionButton(
              child: Text("+"),
              onPressed: (){
                showDialog(
                    context: jokbo1,
                    builder: (context) {
                      return DialogUI(
                        names: names,
                        addName: addName,
                      );
                    }
                );
              },
            );
          }
        ),
      );
  }
}
