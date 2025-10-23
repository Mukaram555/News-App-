import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/news_model.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/Profile/edit_profile_screen.dart';

import '../../../Common/Button/small_custom.dart';
import '../Publish Screen Ui/publish_screen.dart';
import '../SettingsUI/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final databaseRef = FirebaseDatabase.instance.ref('Publish News/');
  ValueNotifier<bool> isData = ValueNotifier(false);
  ValueNotifier<int> dataCount = ValueNotifier(0);
  ValueNotifier<int> tab = ValueNotifier(0);
  List<Result> firebaseNews = [];
  List<Result> firebaseRecent = [];

  @override
  void initState() {
    super.initState();
    _setupRealtimeListener();
  }

  void _setupRealtimeListener() {
    databaseRef.onValue.listen((DatabaseEvent event) {
      if (mounted) {
        final exists = event.snapshot.exists && event.snapshot.value != null;
        isData.value = exists;

        if (exists) {
          dataCount.value = event.snapshot.children.length;
          _processFirebaseData(event.snapshot);
        } else {
          dataCount.value = 0;
          firebaseNews.clear();
          firebaseRecent.clear();
        }

        print('Data count updated: ${dataCount.value}');
      }
    });
  }

  void _processFirebaseData(DataSnapshot snapshot) {
    firebaseNews.clear();
    firebaseRecent.clear();

    snapshot.children.forEach((child) {
      try {
        final data = Map<String, dynamic>.from(child.value as Map);
        data['key'] = child.key; // Store the Firebase key for reference

        // Convert Firebase data to Result model
        final result = _convertToResultModel(data);
        if (result != null) {
          firebaseNews.add(result);
          firebaseRecent.add(result);
        }
      } catch (e) {
        print('Error processing Firebase data: $e');
      }
    });

    // Sort recent by date (newest first)
    firebaseRecent.sort((a, b) {
      final dateA = a.publishedDate ?? DateTime.now();
      final dateB = b.publishedDate ?? DateTime.now();
      return dateB.compareTo(dateA);
    });

    setState(() {});
  }

  Result? _convertToResultModel(Map<String, dynamic> data) {
    try {
      // Handle multimedia conversion
      List<Multimedia> multimedia = [];
      if (data['multimedia'] != null && data['multimedia'] is List) {
        multimedia = (data['multimedia'] as List).map((item) {
          if (item is Map<String, dynamic>) {
            return Multimedia(
              url: item['url']?.toString(),
              format: item['format']?.toString(),
              height: item['height'] is int
                  ? item['height']
                  : (item['height'] is String
                        ? int.tryParse(item['height'])
                        : null),
              width: item['width'] is int
                  ? item['width']
                  : (item['width'] is String
                        ? int.tryParse(item['width'])
                        : null),
              type: item['type']?.toString(),
              subtype: item['subtype']?.toString(),
              caption: item['caption']?.toString(),
              copyright: item['copyright']?.toString(),
            );
          }
          return Multimedia();
        }).toList();
      }

      // Handle date conversion
      DateTime? publishedDate;
      if (data['publishedDate'] is String) {
        publishedDate = DateTime.tryParse(data['publishedDate']);
      }

      // Create Result model
      return Result(
        section: data['section']?.toString(),
        subsection: data['subsection']?.toString(),
        title: data['title']?.toString(),
        resultAbstract:
            data['abstract']?.toString() ?? data['resultAbstract']?.toString(),
        url: data['url']?.toString(),
        uri: data['uri']?.toString(),
        byline: data['byline']?.toString(),
        itemType: data['itemType']?.toString() ?? data['item_type']?.toString(),
        publishedDate: publishedDate,
        materialTypeFacet:
            data['materialTypeFacet']?.toString() ??
            data['material_type_facet']?.toString(),
        kicker: data['kicker']?.toString(),
        multimedia: multimedia.isNotEmpty ? multimedia : null,
        shortUrl: data['shortUrl']?.toString() ?? data['short_url']?.toString(),
        // Handle facet lists
        desFacet: data['desFacet'] is List
            ? List<String>.from(data['desFacet'].map((x) => x.toString()))
            : null,
        orgFacet: data['orgFacet'] is List
            ? List<String>.from(data['orgFacet'].map((x) => x.toString()))
            : null,
        perFacet: data['perFacet'] is List
            ? List<String>.from(data['perFacet'].map((x) => x.toString()))
            : null,
        geoFacet: data['geoFacet'] is List
            ? List<String>.from(data['geoFacet'].map((x) => x.toString()))
            : null,
      );
    } catch (e) {
      print('Error converting to Result model: $e');
      return null;
    }
  }

  Widget _buildFirebaseNewsItem(Result result, int index, String? itemKey) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withAlpha((255 * 0.1).toInt()),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Image from Result model
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.r),
                image: _buildImageDecoration(result),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Text(
                      result.title ?? 'No Title',
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Section/Category
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha((255 * 0.1).toInt()),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        result.section ?? 'General',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),

                    // Byline and Date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'By ${result.byline ?? 'Unknown'}',
                            style: Theme.of(context).textTheme.labelSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          _formatDate(result.publishedDate),
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                                    .withAlpha((255 * 0.6).toInt()),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirebaseRecentItem(Result result, int index, String? itemKey) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
          ),
        ),
        child: Column(
          children: [
            // Image section
            Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
                image: _buildImageDecoration(result),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title
                    Text(
                      result.title ?? 'No Title',
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Metadata row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDate(result.publishedDate),
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface
                                    .withAlpha((255 * 0.6).toInt()),
                              ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary
                                .withAlpha((255 * 0.1).toInt()),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            result.section ?? 'News',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                        ),
                      ],
                    ),

                    // Abstract/Description
                    SizedBox(
                      width: 350.w,
                      height: 20.h,
                      child: Text(
                        result.resultAbstract ?? 'No description available',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DecorationImage _buildImageDecoration(Result result) {
    String placeholderUrl =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQMsHO6y4eGcYVu1inbdzx9CQ1GebW-yE0Ag&s';

    // Get the first available image from multimedia
    String imageUrl = placeholderUrl;
    if (result.multimedia != null && result.multimedia!.isNotEmpty) {
      for (var media in result.multimedia!) {
        if (media.url != null && media.url!.isNotEmpty) {
          imageUrl = media.url!;
          break;
        }
      }
    }

    return DecorationImage(
      image: NetworkImage(imageUrl),
      fit: BoxFit.cover,
      onError: (exception, stackTrace) {
        // Fallback to placeholder image if network image fails
        NetworkImage(placeholderUrl);
      },
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Recent';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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

            // Profile Header Section
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
                          ValueListenableBuilder(
                            valueListenable: dataCount,
                            builder: (context, count, child) {
                              return Text(
                                '$count',
                                style: Theme.of(context).textTheme.titleSmall,
                              );
                            },
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

            // Bio Section
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
                        GestureDetector(
                          onTap: () {
                            print('Total posts: ${dataCount.value}');
                          },
                          child: SmallCustomButton(buttonTitle: 'Website'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Tabs Section
            SliverToBoxAdapter(
              child: ValueListenableBuilder(
                valueListenable: tab,
                builder: (context, value, child) {
                  return SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => tab.value = 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: tab.value == 0
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                            child: Text(
                              'All Posts',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0.w),
                        GestureDetector(
                          onTap: () => tab.value = 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2,
                                  color: tab.value == 1
                                      ? Theme.of(context).colorScheme.primary
                                      : Colors.transparent,
                                ),
                              ),
                            ),
                            child: Text(
                              'Recent',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Content based on selected tab
            ValueListenableBuilder(
              valueListenable: tab,
              builder: (context, value, child) {
                if (value == 0) {
                  // All Posts Tab
                  return isData.value && firebaseNews.isNotEmpty
                      ? SliverList.builder(
                          itemCount: firebaseNews.length,
                          itemBuilder: (context, index) {
                            // Get the Firebase key (we stored it during processing)
                            final itemKey = firebaseNews[index].title?.hashCode
                                .toString();
                            return GestureDetector(
                              // onLongPress: () => _showOptionsDialog(itemKey),
                              child: _buildFirebaseNewsItem(
                                firebaseNews[index],
                                index,
                                itemKey,
                              ),
                            );
                          },
                        )
                      : _buildEmptyState(
                          'No posts yet',
                          'Start publishing to see your posts here',
                          Icons.article,
                        );
                } else {
                  // Recent Tab
                  return isData.value && firebaseRecent.isNotEmpty
                      ? SliverList.builder(
                          itemCount: firebaseRecent.length,
                          itemBuilder: (context, index) {
                            final itemKey = firebaseRecent[index]
                                .title
                                ?.hashCode
                                .toString();
                            return GestureDetector(
                              // onLongPress: () => _showOptionsDialog(itemKey),
                              child: _buildFirebaseRecentItem(
                                firebaseRecent[index],
                                index,
                                itemKey,
                              ),
                            );
                          },
                        )
                      : _buildEmptyState(
                          'No recent posts',
                          'Your recent posts will appear here',
                          Icons.history,
                        );
                }
              },
            ),
          ],
        ),
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

  Widget _buildEmptyState(String title, String subtitle, IconData icon) {
    return SliverToBoxAdapter(
      child: Container(
        height: 300.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Theme.of(
                  context,
                ).colorScheme.primary.withAlpha((255 * 0.3).toInt()),
              ),
              SizedBox(height: 10.h),
              Text(title, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 5.h),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
