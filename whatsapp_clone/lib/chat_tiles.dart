import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chatRoom.dart';

import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class ChatTiles extends StatelessWidget {

  
  final String img;
  final String name;
  final _controller = TextEditingController();
  final profilekey=GlobalKey();

  late TutorialCoachMark tutorialCoachMark;

void initAddSiteInAppTour(){
 List<TargetFocus> addSiteTargetsPage({
  required GlobalKey profilekey,
  
})
{
  List<TargetFocus> targets = [];
  

  targets.add(
    TargetFocus(
      keyTarget: profilekey,
      alignSkip: Alignment.topLeft,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller)  {
              return Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      
                      "click this to select  the scontact",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              );
            }
          ),
        ],
    ),
  );
   return targets;
}

  



 
  

}

  ChatTiles({required this.img,  required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatRoom(
            name: name,
            img: img,
            controller: _controller,
          );
        }));
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  img.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            key: profilekey,
                            radius: 25,
                            backgroundImage: AssetImage(img),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.account_circle,
                            size: 55,
                            color: Colors.grey.shade500,
                          ),
                        ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                       
                      ],
                    ),
                  ),
                ],
              ),
             
            ],
          ),
          Divider(
            thickness: 0.75,
            endIndent: 10,
            indent: 60,
          ),
        ],
      ),
    );
  }



}
