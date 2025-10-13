import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Data/Models/channals_models.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/search_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/components/profile_screen.dart';

class ChannelSelection extends StatefulWidget {
  const ChannelSelection({super.key});

  @override
  State<ChannelSelection> createState() => _ChannalSelectionState();
}

class _ChannalSelectionState extends State<ChannelSelection> {
  final TextEditingController searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredChannel = ChannelsModelData.where(
      (channal) => channal.channelName.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      ),
    ).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    'Choose Favorite Topics',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              SizedBox(height: 20.h),

              SearchField(
                onChange: (String p1) {
                  setState(() {
                    _searchQuery = p1;
                  });
                },
                sreachController: searchController,
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 3,
                  ),
                  itemCount: filteredChannel.length,
                  itemBuilder: (context, index) {
                    final channel = filteredChannel[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Container(
                          width: 400.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0.r),
                            color: Theme.of(context).colorScheme.surface,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0.5, 0.9),
                                blurRadius: 1,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondary,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 70.w,
                                height: 70.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSecondary,
                                ),
                                child: Center(
                                  child: Container(
                                    width: 50.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(channel.channelLogo),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                channel.channelName,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    channel.isfollow = !channel.isfollow;
                                  });
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: channel.isfollow
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      channel.isfollow ? 'Folowing' : 'Follow',
                                      style: channel.isfollow
                                          ? Theme.of(
                                              context,
                                            ).textTheme.headlineSmall
                                          : Theme.of(
                                              context,
                                            ).textTheme.headlineSmall?.copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            if (filteredChannel.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Choose at least one topic')),
              );
            }
          },
          child: const CustomButton(text: 'Next'),
        ),
      ),
    );
  }
}
