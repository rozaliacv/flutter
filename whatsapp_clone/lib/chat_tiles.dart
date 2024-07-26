import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:whatsapp_clone/chatRoom.dart';

class ChatTiles extends StatefulWidget {
  final String img;
  final String name;

  ChatTiles({required this.img, required this.name});

  @override
  _ChatTilesState createState() => _ChatTilesState();
}

class _ChatTilesState extends State<ChatTiles> {
  final _controller = TextEditingController();
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];
  GlobalKey keyCircleAvatar = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showTutorial());
  }

  void showTutorial() {
    initTargets();
    tutorialCoachMark = TutorialCoachMark(
      
      targets: targets,
      colorShadow: Colors.black,
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("Tutorial finished");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
    )..show(context: context);
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        identify: "Circle Avatar",
        keyTarget: keyCircleAvatar,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Column(
              children: const [
                Text(
                  "This is your profile picture. Tap here to start a chat.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatRoom(
            name: widget.name,
            img: widget.img,
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
                  widget.img.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            key: keyCircleAvatar,
                            radius: 25,
                            backgroundImage: AssetImage(widget.img),
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
                          widget.name,
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
