import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Common/Textfield/search_field.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/signup/prefrence/channel_selection.dart';

class FavriteTopic extends StatefulWidget {
  const FavriteTopic({super.key});

  @override
  State<FavriteTopic> createState() => _FavriteTopicState();
}

class _FavriteTopicState extends State<FavriteTopic> {
  final List<String> topicName = [
    "National",
    'International',
    'Sport',
    'Lifestyle',
    'Business',
    'Health',
    'Fashion',
    'Technology',
    'Science',
    'Art',
    'Politics',
  ];

  final ValueNotifier<List<String>> _selected = ValueNotifier(['Technology']);
  final TextEditingController _sreachController = TextEditingController();

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredTopics = topicName
        .where(
          (topic) => topic.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .toList();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 40.0.h),
        child: SingleChildScrollView(
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
                sreachController: _sreachController,
              ),
              SizedBox(height: 20.h),
              ValueListenableBuilder<List<String>>(
                valueListenable: _selected,
                builder: (context, selectedTopics, child) {
                  return Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: List.generate(filteredTopics.length, (index) {
                      final topic = filteredTopics[index];
                      final isSelected = selectedTopics.contains(topic);

                      return ChoiceChip(
                        label: Text(topic),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          if (selected) {
                            selectedTopics.add(topic);
                          } else {
                            selectedTopics.remove(topic);
                          }
                          _selected.value = List.from(selectedTopics);
                        },
                        checkmarkColor: Theme.of(context).colorScheme.onPrimary,
                        labelStyle: isSelected
                            ? Theme.of(context).textTheme.headlineSmall
                            : Theme.of(
                                context,
                              ).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        selectedColor: Theme.of(context).colorScheme.primary,
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<List<String>>(
          valueListenable: _selected,
          builder: (context, selectedTopics, _) {
            return InkWell(
              onTap: () {
                if (selectedTopics.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Selected Topics: ${selectedTopics.join(', ')}',
                      ),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChannelSelection()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Choose at least one topic')),
                  );
                }
              },
              child: const CustomButton(text: 'Next'),
            );
          },
        ),
      ),
    );
  }
}
