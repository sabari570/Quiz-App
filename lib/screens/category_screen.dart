import 'package:flutter/material.dart';
import 'package:flutter_quizz/build_list/build_category.dart';
import 'package:flutter_quizz/info/category_list_info.dart';
import 'package:flutter_quizz/models/category_list.dart';

class CategoryScreen extends StatefulWidget {
  final String userName;
  CategoryScreen({this.userName});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<CategoryList> categoryItems = new List<CategoryList>();
  @override
  void initState() {
    super.initState();
    categoryItems = getCategoryInfo();
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
        title: Text(
          'Categories',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: true,
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
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                physics: ClampingScrollPhysics(),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: categoryItems.length,
                                itemBuilder: (context, index) {
                                  return CategoryTile(
                                    userName: widget.userName,
                                    categoryName:
                                        categoryItems[index].categoryName,
                                    imageUrl: categoryItems[index].imageUrl,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
