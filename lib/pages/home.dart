

// ignore_for_file: use_build_context_synchronously

import 'package:fallou_sarr_exam/pages/article_liste.dart';
import 'package:fallou_sarr_exam/repositories/data-repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement( 
      context,
      MaterialPageRoute(builder: (context){
        return const ArticleList();
      })
     );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
            color: Color.fromARGB(255, 49, 60, 120),
          )
      ),
    );
  }
}