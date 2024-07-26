import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:whatsapp_clone/calls.dart';
import 'package:whatsapp_clone/chat_tile_screen.dart';
import 'status.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: ChatScreen.id,
      routes: {
        StatusScreen.id: (context) => StatusScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        CallScreen.id: (context) => CallScreen(),
        ChatTilesScreen.id: (context) => ChatTilesScreen(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
}

class ChatScreen extends StatefulWidget {
  static const String id = "chatscreen";
  const ChatScreen({super.key});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> chat = ['anu', 'arun'];
  final List img = ['images/woman.png', 'images/boy.png'];
  bool showChatTiles = false;
  
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];
  GlobalKey keyMessageIcon = GlobalKey();

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
    )..show(context:context);
  }

  void initTargets() {
    targets.add(
      TargetFocus(
        identify: "Message Icon",
        keyTarget: keyMessageIcon,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Column(
              children: const [
                Text(
                  "Click here to start a new chat",
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff075e54),
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
        bottom: AppBar(
          backgroundColor: const Color(0xff075e54),
          automaticallyImplyLeading: false,
          leading: Container(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.white.withOpacity(0.5),
              size: 28,
            ),
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 5,
                  ),
                ),
              ),
              width: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'CHATS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, StatusScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'STATUS',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 115,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, CallScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'CALLS',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            key: keyMessageIcon,
            backgroundColor: const Color(0xff25D366),
            child: const Icon(
              Icons.message,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ChatTilesScreen.id);
            },
          ),
        ),
      ),
      body: Center(),
    );
  }
}
