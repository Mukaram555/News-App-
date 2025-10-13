import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/topics_model.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/home%20PageUi/trending_home_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled){
          return [

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 100.0.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Explore', style: Theme.of(context).textTheme.displayLarge,),
                    SizedBox(height: 20.0.h,),
                    Text('Topics', style: Theme.of(context).textTheme.displaySmall,),
                  ],
                )),
              ),
            ),
            SliverList.builder(
              itemCount: TopicsModelData.length,
                itemBuilder: (context , index){
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(10.0.r),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        color: Colors.black12
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly,
                  children: [
                    Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(TopicsModelData[index].topicsImages),
                              fit: BoxFit.cover)
                      ),


                    ),
                    SizedBox(width: 10,),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 160.0.w,
                                child: Text(TopicsModelData[index].topicsName, style: Theme.of(context).textTheme.bodySmall,)),
                          ),
                          Padding(

                            padding: EdgeInsets.all(2.0),
                            child:Container(
                                width: 160.0.w,
                                height: 45.0.h,
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  TopicsModelData[index].topicTitle, style: Theme.of(context).textTheme.bodySmall,)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            TopicsModelData[index].isSaved = !TopicsModelData[index].isSaved;
                          });
                        },
                        child: Container(
                          height: 35.0.h,
                          width: 60.0.w,
                          decoration: BoxDecoration(
                              color:TopicsModelData[index].isSaved?  Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10.0.r),
                            border: BoxBorder.all(color: Theme.of(context).colorScheme.primary),
                          ),
                          child: Center(child: Text('Save', style: TopicsModelData[index].isSaved ?Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onPrimary) :Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary) ,)),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            );

            }     )  ,
            SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50.0.h,
                    child:

                    Text('Papular News', style: Theme.of(context).textTheme.displaySmall,),

                  ),
                )
            ),];
        }, body: TrendingHomePage(isAxis: false)));
  }
}
