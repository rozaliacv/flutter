import 'package:flutter/material.dart';
import 'package:dice_app/style_text.dart'; 
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();

  }
}

class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/dice_images/dice-six-faces-six.png';

  void rolldice() {
    var diceroll = Random().nextInt(6)+1;
    setState(() {

      if(diceroll==1)
      {
        activeDiceImage = 'assets/dice_images/dice-six-faces-one.png';
      }
      else if(diceroll==2)
      {
        activeDiceImage = 'assets/dice_images/dice-six-faces-two.png';
      }
      else if(diceroll==3)
      {
        activeDiceImage = 'assets/dice_images/dice-six-faces-three.png';
      }
      else if(diceroll==4)
      {
        activeDiceImage = 'assets/dice_images/dice-six-faces-four.png';
      }
      else if(diceroll==5)
      {
        activeDiceImage = 'assets/dice_images/dice-six-faces-five.png';
      }
      else if(diceroll==6)
      {
        activeDiceImage = 'assets/dice_images/dice-six-faces-six.png';
      }
    });
    
  }

  @override
  Widget build(comtext) {
    return  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 200,
            ),
            const SizedBox(height:30),
            TextButton(
              onPressed: rolldice,
              style:TextButton.styleFrom(backgroundColor: Color.fromARGB(238, 108, 15, 131)),
              child:const StyleText('ROLL!'),
            )
          ],
        );
  }
}