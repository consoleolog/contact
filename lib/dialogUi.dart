import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.names, this.addName}) : super(key: key);
  final names;
  final addName;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField( controller: inputData,),
            TextButton( child: Text('완료'), onPressed:(){
              addName(inputData.text);
              final newContact = Contact();
              newContact.name.first = inputData.text;
              newContact.name.last = "Test";
              newContact.insert();
              Navigator.pop(context);
            }),
            TextButton(
                child: Text('취소'),
                onPressed:(){ Navigator.pop(context); })
          ],
        ),
      ),
    );
  }
}