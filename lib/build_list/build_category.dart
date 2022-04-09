import 'package:flutter/material.dart';
import 'package:flutter_quizz/screens/difficulty_screen.dart';

class CategoryTile extends StatelessWidget {
  final String userName;
  final String categoryName;
  final String imageUrl;
  CategoryTile({this.categoryName, this.imageUrl, this.userName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          print('$categoryName Tapped');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DifficultyTile(
                userName: userName,
                categoryName: categoryName,
              ),
            ),
          );
        },
        child: Container(
          child: Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                    child: Text(
                  categoryName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
