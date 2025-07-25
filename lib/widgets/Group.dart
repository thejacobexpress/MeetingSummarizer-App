import 'package:flutter/material.dart';
import 'package:meeting_summarizer_app/classes/GroupClass.dart';
import 'package:meeting_summarizer_app/send_pages/SingleGroupPage.dart';
import 'package:meeting_summarizer_app/main_sequence/AddRecipientsPage.dart';

var isSelected = false;

class Group extends StatefulWidget {
  final GroupClass groupClass;
  final Color groupColor;
  final bool checkable;

  const Group({super.key, required this.groupClass, required this.groupColor, required this.checkable});


  @override
  State<Group> createState() => _GroupState();

}

class _GroupState extends State<Group> {

  void goToGroupPage(GroupClass group) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleGroupPage(group: group)));
    });
  }

  Widget getWidget() {
    if(widget.checkable) {
      return Container(
        decoration: BoxDecoration(color: isSelected? const Color.fromARGB(255, 186, 224, 255) :  Colors.white),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: BoxDecoration(color: widget.groupColor),
                ),
              ),
              Text(widget.groupClass.name, style: TextStyle(fontSize: 16),)
            ],
          )
        )
      );
    } else {
      return Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(color: widget.groupColor),
                  child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(widget.groupClass.name, style: TextStyle(fontSize: 16))
                  ]))
                ),
              ),
            ],
          )
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        if(widget.checkable) {
          isSelected = !isSelected;
          if(isSelected) {
              recipients.add(widget.groupClass);
            } else {
              recipients.remove(widget.groupClass);
            }
        } else {
          goToGroupPage(widget.groupClass);
        }
      }),
      child: getWidget()
    );
  }
}