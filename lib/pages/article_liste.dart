

import 'package:fallou_sarr_exam/repositories/data-repository.dart';
import 'package:fallou_sarr_exam/widgets/article-card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArticleList extends StatelessWidget {
  const ArticleList({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.deepPurple,
        title: Text('Liste des articles', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: dataProvider.allArticles.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index){
          return ArticleCard(article: dataProvider.allArticles[index],);
        }
      )
    );
  }
}