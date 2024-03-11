// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fallou_sarr_exam/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatefulWidget {
  ArticleModel? article;
  ArticleCard({
    Key? key,
    this.article,
  }) : super(key: key);

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}


class _ArticleCardState extends State<ArticleCard> {

  launchURL() async {
   final Uri url = Uri.parse('${widget.article!.url}');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return
       GestureDetector(
        onTap: () {
          launchURL();
        },
         child: Padding(
           padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
           child: Container(
             width: double.infinity,
             height: 280,
             decoration: const BoxDecoration(
                 color: Color.fromARGB(255, 225, 206, 255),
                 borderRadius: BorderRadius.all(Radius.circular(15))),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: Center(
                 child: Container(
                   width: double.infinity,
                   height: 250,
                   decoration: const BoxDecoration(
                       color: Color.fromARGB(255, 180, 164, 204),
                       borderRadius: BorderRadius.all(Radius.circular(15))),
                   child: Padding(
                     padding: const EdgeInsets.only(top: 35, left: 15),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "Titre : ${widget.article!.title}", 
                            style: GoogleFonts.poppins(
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                            )),
                            const SizedBox(height: 8,),
                         Text("Auteur : ${widget.article!.by}",
                             style: GoogleFonts.poppins(
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                            )),
                            const SizedBox(height: 8,),
                         Text("Disponibilité : OUI",style: GoogleFonts.poppins(
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                            )),
                            const SizedBox(height: 8,),
                         Text("Commentaires : ${widget.article!.score}",style: GoogleFonts.poppins(
                             fontSize: 16,
                             fontWeight: FontWeight.bold
                            )),
                         const SizedBox(height: 20,),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children:  [
                             const SizedBox(width: 20,),
                             GestureDetector(
                               onTap: () {
                                 setState(() {
                                   fav = !fav;
                                 });
                               },
                               child:  Icon(Icons.favorite, size: 35, color: fav ? Colors.red : Colors.black  )),
                            const SizedBox(width: 20,),
                           ],
                         )
                   
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
         ),
       );
   
  }
}
