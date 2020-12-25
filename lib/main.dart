import 'package:Destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Destini(),
        ),
      ),
    );
  }
}

class Destini extends StatefulWidget {
  @override
  _DestiniState createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  StoryBrain storyBrain = StoryBrain();

  void pressNext(int choiceNo) {
    setState(() {
      storyBrain.nextStory(choiceNo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            "images/background.png",
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    storyBrain.getStoryTitle(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: RaisedButton(
                  onPressed: () {
                    pressNext(1);
                  },
                  color: Colors.red,
                  child: Center(child: Text(storyBrain.getStoryChoice1())),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Visibility(
                visible: storyBrain.buttonShouldBeVisible(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: RaisedButton(
                    onPressed: () {
                      pressNext(2);
                    },
                    color: Colors.blue,
                    child: Center(child: Text(storyBrain.getStoryChoice2())),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
