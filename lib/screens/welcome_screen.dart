import 'package:flutter/material.dart';
import 'package:flutter_quizz/screens/category_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController _nameController = new TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/FlutterIcon.png',
              ),
            ),
            Text(
              ' Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Quiz',
              style: TextStyle(color: Colors.blue),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/sk_logo.png'),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/welcome screen bgi66mage.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  'Lets Play Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Enter Your Name below',
                  style: TextStyle(
                    color: Colors.grey[100],
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    errorText: _validate ? 'Name Field Cannot Be Empty' : null,
                    errorStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    filled: true,
                    fillColor: Colors.indigo[900],
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
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        _validate = _nameController.text.isEmpty ? true : false;
                      });
                      if (_validate == false) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return CategoryScreen(
                            userName: _nameController.text,
                          );
                        }));
                      }
                    },
                    child: Text(
                      'Lets Begin',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          )),
        ),
      ]),
    );
  }
}
