import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/news_model_world.dart';
import 'package:news_app/SRC/Data/repositories/api/api_service.dart';

class TranddingHomePage extends StatefulWidget {
  const TranddingHomePage({super.key});

  @override
  State<TranddingHomePage> createState() => _TranddingHomePageState();
}

class _TranddingHomePageState extends State<TranddingHomePage> {
  NewsModel? _newsData;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    // _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      final data = await ApiService().worldApiResponse();
      setState(() {
        _newsData = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text('Error: $_errorMessage'));
    }

    if (_newsData == null ||
        _newsData!.results == null ||
        _newsData!.results!.isEmpty) {
      return const Center(child: Text('No news available'));
    }

    final results = _newsData!.results!;

    return Container();

    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: results.length,
    //   itemBuilder: (context, index) {
    //     final result = results[index];
    //     return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Column(
    //         children: [
    //           Container(
    //             height: 200.h,
    //             width: 325.w,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.r),
    //               color: Colors.blueAccent,
    //               image:
    //                   (result.multimedia != null &&
    //                       result.multimedia!.isNotEmpty)
    //                   ? DecorationImage(
    //                       image: NetworkImage(""),
    //                       fit: BoxFit.cover,
    //                     )
    //                   : null,
    //             ),
    //           ),
    //           SizedBox(height: 20.h),
    //           Container(
    //             height: 90.h,
    //             width: 325.w,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(20.r),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(5.0),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     result.title ?? '',
    //                     maxLines: 2,
    //                     overflow: TextOverflow.ellipsis,
    //                     style: Theme.of(context).textTheme.bodyMedium,
    //                   ),
    //                   SizedBox(height: 5.h),
    //                   Row(
    //                     children: [
    //                       Text(
    //                         result.publishedDate?.toString() ?? '',
    //                         style: Theme.of(context).textTheme.bodySmall,
    //                       ),
    //                       SizedBox(width: 10.w),
    //                       Text(
    //                         result.section ?? '',
    //                         style: Theme.of(context).textTheme.bodySmall,
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
