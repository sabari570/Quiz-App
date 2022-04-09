import 'package:flutter/material.dart';
import 'package:flutter_quizz/build_list/build_questions.dart';
import 'package:flutter_quizz/build_list/build_resultsTab.dart';
import 'package:flutter_quizz/info/getCategory_id.dart';
import 'package:flutter_quizz/info/question_info.dart';
import 'package:flutter_quizz/models/questions_model.dart';
import 'package:flutter_quizz/screens/result_screen.dart';

class QuetionsTile extends StatefulWidget {
  final String userName;
  final String categoryName;
  final String difficulty;
  QuetionsTile({this.userName, this.categoryName, this.difficulty});
  bool isLoading = true;
  @override
  State<QuetionsTile> createState() => _QuetionsTileState();
}

int correct = 0;
int incorrect = 0;
int notAnswered = 10;
int total = 10;
Stream infoStream;

class _QuetionsTileState extends State<QuetionsTile> {
  int categoryNum;
  List<QuestionModel> questionDetails = new List<QuestionModel>();
  void initState() {
    correct = 0;
    incorrect = 0;
    notAnswered = 10;
    total = 10;
    if (infoStream == null) {
      infoStream = Stream<List<int>>.periodic(Duration(milliseconds: 100), (x) {
        print("this is x $x");
        return [correct, incorrect];
      });
    }
    super.initState();
    categoryNum = getCategoryID(widget.categoryName);
    getShuffledOptions();
  }

  void getShuffledOptions() async {
    QuestionInfo questionInfo = new QuestionInfo();
    await questionInfo.getQuestions(categoryNum, widget.difficulty);
    questionDetails = questionInfo.quizQuestions;

    setState(() {
      widget.isLoading = false;
    });
  }

  @override
  void dispose() {
    infoStream = null;
    super.dispose();
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
                'Quiz',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              Text(
                'Questions',
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
            widget.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ))
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 70,
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: questionDetails.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                      ),
                                      child: Column(
                                        children: [
                                          QuestionTile(
                                            quizQuestion:
                                                questionDetails[index].question,
                                            correctAnswer:
                                                questionDetails[index]
                                                    .correctAnswer,
                                            optionA: questionDetails[index]
                                                .shuffledOptions[0],
                                            optionB: questionDetails[index]
                                                .shuffledOptions[1],
                                            optionC: questionDetails[index]
                                                .shuffledOptions[2],
                                            optionD: questionDetails[index]
                                                .shuffledOptions[3],
                                          ),
                                          SizedBox(
                                            height: 25,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            Container(
              child: ResultHeader(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return ResultScreen(
                userName: widget.userName,
              );
            }));
          },
          child: Icon(Icons.check),
        ));
  }
}

class ResultHeader extends StatefulWidget {
  @override
  _ResultHeaderState createState() => _ResultHeaderState();
}

class _ResultHeaderState extends State<ResultHeader> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: infoStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? SingleChildScrollView(
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(
                      left: 14,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: <Widget>[
                        ResultsTab(
                          count: total,
                          countCategory: 'Total',
                        ),
                        ResultsTab(
                          count: correct,
                          countCategory: 'Correct',
                        ),
                        ResultsTab(
                          count: incorrect,
                          countCategory: 'Incorrect',
                        ),
                        ResultsTab(
                          count: notAnswered,
                          countCategory: 'NotAnswered',
                        ),
                      ],
                    ),
                  ),
                )
              : Container();
        });
  }
}
