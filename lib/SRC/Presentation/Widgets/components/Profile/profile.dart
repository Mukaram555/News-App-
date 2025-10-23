import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/channals_models.dart';
import 'package:news_app/SRC/Data/Models/topics_model.dart';
import 'package:news_app/SRC/Presentation/Common/Button/small_custom.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Profile/profile_screen.dart';

import '../Publish Screen Ui/publish_screen.dart';
import '../SettingsUI/settings.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> tab = ValueNotifier(0);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleTextStyle: Theme.of(context).textTheme.bodyMedium,
            title: Center(child: Text('Profile')),

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/profile_pic.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    height: 80.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2000',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 10.0.h),
                        Text(
                          'Followers',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    height: 80.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2000',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 10.0.h),
                        Text(
                          'Following',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: 80.w,
                    height: 80.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '2000',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 10.0.h),
                        Text(
                          'Posts',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.0.h,
                    child: Text(
                      'Name of the person',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    width: 400.w,
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfileScreen(title: 'Edit Profile'),
                            ),
                          );
                        },
                        child: SmallCustomButton(buttonTitle: 'Edit Profile'),
                      ),
                      SmallCustomButton(buttonTitle: 'Website'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: ValueListenableBuilder(
              valueListenable: tab,
              builder: (context, value, child) {
                return SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          tab.value = 0;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: tab.value == 0
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                          child: Text(
                            'News',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.0.w),
                      GestureDetector(
                        onTap: () {
                          tab.value = 1;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 2,
                                color: tab.value == 1
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                          child: Text(
                            'Recent',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: tab,
            builder: (context, value, child) {
              return SliverList.builder(
                itemCount: tab.value == 0
                    ? ChannelsModelData.length
                    : TopicsModelData.length,
                itemBuilder: (context, index) {
                  // final data = tab.value == 0? ChannelsModelData : TopicsModelData ;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 100.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 80.0.h,
                            width: 80.0.w,
                            child: Image.asset(
                              'assets/images/profile_pic.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 15.0.h,
                                width: 230.0.w,

                                child: Text(
                                  'Section',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(height: 5.0.h),
                              SizedBox(
                                height: 40.0.h,
                                width: 230.0.w,

                                child: Text(
                                  'Section',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              SizedBox(height: 5.0.h),

                              SizedBox(
                                height: 15.0.h,
                                width: 230.0.w,

                                child: Text(
                                  'Section',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PublishScreen()),
          );
        },
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
