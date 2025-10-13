

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Data/Models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Comment Screen Ui/comment_screen.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, required this.inDex });

  final Result inDex;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
   ValueNotifier<bool> isFavorite = ValueNotifier(false);

   ValueNotifier<bool> isBookmark = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {

    final Uri _url = Uri.parse(widget.inDex.url ??"");


    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    color: Theme.of(context).colorScheme.onSurface

                  )
                ],
                  color: Colors.grey,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0.r) , bottomRight: Radius.circular(20.0.r)),
                image: DecorationImage(image: NetworkImage(widget.inDex.multimedia?.first.url ?? ''),fit: BoxFit.cover)
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 500.0.w,
                    child: Text(widget.inDex.title ?? '',
                    style: Theme.of(context).textTheme.displaySmall,
                    ),

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text( 'Time : ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        child: Text("${widget.inDex.updatedDate?.hour} hours Ago " ,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(widget.inDex.resultAbstract ??"",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Text(widget.inDex.multimedia?[1].caption ??"",
                  style: Theme.of(context).textTheme.bodyMedium),

              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8),
              child: Text("Copyright",
                  style: Theme.of(context).textTheme.displaySmall),
            ),
            SizedBox(height: 10.0.h,),
            Container(
              padding: EdgeInsets.only(left: 8),

              child: Text(widget.inDex.multimedia?[1].copyright ??"",
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(

                child: Text("More Details :",
                    style: Theme.of(context).textTheme.displaySmall),
              ),
              SizedBox(height: 10.0.h,),
             SizedBox(
                  child:  InkWell(
                    onTap: (){
                      _launchUrl();
                    },
                    child: Text('${_url}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
                ),
              ),
              SizedBox(height: 20.0.h,),
              SizedBox(
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     ValueListenableBuilder(
                       valueListenable: isFavorite,
                       builder: (context, value, child) {
                         return Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             GestureDetector(
                               onTap:(){
                                 isFavorite.value = ! isFavorite.value;
                                                                },
                             child: Icon( isFavorite.value? Icons.favorite: Icons.favorite_border_rounded, color: isFavorite.value? Theme.of(context).colorScheme.onError:Theme.of(context).colorScheme.onPrimary,)),
                             SizedBox(width: 2.0.w,),
                             Text('25.2k'),
                           ],
                         );
                       }
                     ),

                     GestureDetector(
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> CommentScreen(
                           articleId:  'unknown',
                           articleTitle: 'News Article',
                         )));
                       },
                         child: Icon(Icons.comment_outlined)),
                     SizedBox(width: 40.0.w,),
                     ValueListenableBuilder(
                       valueListenable: isBookmark,
                       builder: (context, value, child) {
                         return GestureDetector(onTap: (){
                           isBookmark.value = ! isBookmark.value;
                         },
                             child: Icon( isBookmark.value? Icons.bookmark: Icons.bookmark_border, color :isBookmark.value? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.onPrimary));
                       }
                     )
                   ],
                 ),
              ),
              SizedBox(height: 10.0.h,),

            ],
          ),),
          ],
        ),
      ),
    );
  }
}
