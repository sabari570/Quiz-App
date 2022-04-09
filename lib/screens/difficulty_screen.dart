import 'package:flutter/material.dart';
import 'package:flutter_quizz/screens/questions.dart';

class DifficultyTile extends StatefulWidget {
  final String userName;
  final categoryName;
  DifficultyTile({this.userName, this.categoryName});
  @override
  _DifficultyTileState createState() => _DifficultyTileState();
}

class _DifficultyTileState extends State<DifficultyTile> {
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
              'Difficulty',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
            Text(
              'Level',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green[200], Colors.blue[900]]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return QuetionsTile(
                              userName: widget.userName,
                              categoryName: widget.categoryName,
                              difficulty: 'easy',
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Easy',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green[200], Colors.blue[900]]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return QuetionsTile(
                              userName: widget.userName,
                              categoryName: widget.categoryName,
                              difficulty: 'medium',
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Medium',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.green[200], Colors.blue[900]]),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return QuetionsTile(
                              userName: widget.userName,
                              difficulty: 'hard',
                              categoryName: widget.categoryName,
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Hard',
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
