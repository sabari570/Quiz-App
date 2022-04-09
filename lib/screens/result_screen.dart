import 'package:flutter/material.dart';
import 'package:flutter_quizz/screens/questions.dart';
import 'package:flutter_quizz/screens/welcome_screen.dart';

class ResultScreen extends StatefulWidget {
  String userName;
  ResultScreen({this.userName});
  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    print('UserName in result Screen: ${widget.userName}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Image.asset(
          'assets/welcome screen bgimage.jpeg',
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
            Text(
              'Page',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
        
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome screen bgimage.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          'Hey',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' ${widget.userName} :) ',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green[200], Colors.blue[900]]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Score Card',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text(
                        '$correct /$total',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green[200], Colors.blue[900]]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FlatButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return WelcomeScreen();
                      }));
                    },
                    label: Text(
                      'Go To Home',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20,
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
