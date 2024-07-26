import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:whatsapp_clone/message_bubble.dart';


class ChatRoom extends StatefulWidget {
  final String name;
  final String img;
  final TextEditingController controller;
  ChatRoom({required this.name, required this.img,required this.controller,super.key});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}



class _ChatRoomState extends State<ChatRoom> {
bool emptyString = true;
final sendkey=GlobalKey();
final textkey=GlobalKey();

late TutorialCoachMark tutorialCoachMark;

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial());
  }

  void _afterLayout(_) {
    _showTutorial();
  }

  void _showTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      
      colorShadow: Colors.black,
      textSkip: "SKIP",
      paddingFocus: 10,
    )
    ..show(context: context);
  } 

  


  List<TargetFocus> _createTargets(){

  List<TargetFocus> targets = [];
  targets.add(
    TargetFocus(
      keyTarget: sendkey,
      alignSkip: Alignment.topRight,
      radius: 10,
      shape: ShapeLightFocus.Circle,
      contents:  [
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
                      
                      "click this to send messages",
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
  targets.add(
    TargetFocus(
      keyTarget: textkey,
      alignSkip: Alignment.topRight,
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
                      
                      "click this to type message",
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

List<String> chatMsgs = [];

  void sendMessage() {
    if (widget.controller.text.isNotEmpty) {
      setState(() {
        chatMsgs.add(widget.controller.text);
        widget.controller.clear();
        emptyString = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff075e54),
        title: Row(
          children: [
            widget.img.isNotEmpty
                ? CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage(widget.img),
                  )
                : Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: 36,
                      color: Colors.grey.shade500,
                    ),
                  ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'online',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.videocam_rounded,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.phone,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                size: 26,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/chatBG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
              Expanded(
              child: ListView.builder(
                itemCount: chatMsgs.length,
                itemBuilder: (context, index) {
                  return MessageBubble(
                    msgs: chatMsgs[index],
                    isMe: true, // Or implement your own logic to determine if the message is sent by the current user
                  );
                },
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 8.0,
                    bottom: 8.0,
                    right: 6.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.84,
                    height: MediaQuery.of(context).size.width * 0.1,
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 5,
                    ),
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.emoji_emotions_outlined,
                          color: Colors.grey.shade500,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            height: MediaQuery.of(context).size.width * 0.1,
                            child: TextField(
                              onChanged: (String value) {
                                setState(() {
                                  emptyString = value.isEmpty;
                                
                                });
                              },
                              key: textkey,
                              controller:widget.controller,
                              keyboardType: TextInputType.multiline,
                              cursorColor: Colors.teal,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                
                                hintText: 'Type a message...',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          CupertinoIcons.paperclip,
                          color: Colors.grey.shade500,
                          size: 27,
                        ),
                       const SizedBox(
                          width: 5,
                        ),
                        emptyString
                            ? Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.grey.shade500,
                                size: 27,
                              )
                            : Container()
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor:const Color(0xff00897b),
                  radius: 23,
                  child: emptyString
                      ? const Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 30,
                        )
                      : IconButton(
                        icon: Icon(CupertinoIcons.paperplane,
                        key:sendkey,
                          color: Colors.white,),
                          onPressed: sendMessage,
                          

                        ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
