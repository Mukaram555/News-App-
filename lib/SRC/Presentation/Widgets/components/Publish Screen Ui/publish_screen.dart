import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:news_app/SRC/Data/Models/news_model.dart';
import 'package:news_app/SRC/Data/Models/topics_model.dart';
import 'package:news_app/SRC/Presentation/Common/Login&SignUP%20Screen/common_app_bar.dart';

import '../../../Common/Button/small_custom.dart';
import 'custom_paint_publish_container.dart';

class PublishScreen extends StatefulWidget {
  const PublishScreen({super.key});

  @override
  State<PublishScreen> createState() => _PublishScreenState();
}

class _PublishScreenState extends State<PublishScreen> {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Publish News');
  ValueNotifier<XFile?> pickerImage = ValueNotifier(null);
  ValueNotifier<int> selectedValue = ValueNotifier(-1);
  TextEditingController newsTile = TextEditingController();
  TextEditingController newsDetails = TextEditingController();
  TextEditingController newsByLine = TextEditingController();
  TextEditingController newsCopyrights = TextEditingController();
  TextEditingController newsAbtriction = TextEditingController();
  TextEditingController newsdetailsLink = TextEditingController();
  TextEditingController newsGeoFacts = TextEditingController();
  TextEditingController? newsDesFacts = TextEditingController();
  final GlobalKey<FormState> MyFormKey = GlobalKey<FormState>();

  String? Function(String?)? NewsTileValidator = (String? value) {
    return value!.isEmpty ? 'Please Enter News Title' : null;
  };
  String? Function(String?)? NewsDetailsValidator = (String? value) {
    return value!.isEmpty || value.length >= 255
        ? 'Please Enter News Details or mix 255 lenght'
        : null;
  };
  String? Function(String?)? NewsCopyrightsValidator = (String? value) {
    return value!.isEmpty ? 'Please Enter News Copyrights' : null;
  };
  String? Function(String?)? NewsAbtrictionValidator = (String? value) {
    return value!.isEmpty || value.length >= 255
        ? 'Please Enter News Abtriction or mix 255 lenght'
        : null;
  };
  String? Function(String?)? NewsdetailsLinkValidator = (String? value) {
    return value!.isEmpty ? 'Please Enter News Details Link or Url' : null;
  };
  String? Function(String?)? NewsGeoFactsValidator = (String? value) {
    return value!.isEmpty ? 'Please Enter News Geo Facts' : null;
  };
  String? Function(String?)? NewsPublisherValidator = (String? value) {
    return value!.isEmpty ? 'Please Enter Your Name' : null;
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
                vertical: 20.0.h,
              ),
              child: AppBarCommon(
                screenTitle: 'Create News',
                iconData: Icons.menu,
                ontapLeading: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        icon: Icon(Icons.workspaces),
                        iconColor: Colors.green,
                        title: Text('Publish News Settings in Progrss'),
                        titleTextStyle: Theme.of(context).textTheme.bodySmall,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DashedBorderContainer(
                    color: Colors.black,
                    dashWidth: 20,
                    gap: 6,
                    borderRadius: BorderRadius.circular(12),
                    background: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 80,
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: pickerImage,
                      builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                if (kDebugMode) {
                                  print('======rebuild ${value?.path}');
                                }
                                return AlertDialog(
                                  title: Center(
                                    child: Text('Seclect Image Source'),
                                  ),
                                  content: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          final ImagePicker picker =
                                              ImagePicker();
                                          final XFile? photo = await picker
                                              .pickImage(
                                                source: ImageSource.camera,
                                              );

                                          pickerImage.value = photo;
                                          Navigator.pop(context);

                                          if (kDebugMode) {
                                            print('========== photos $photo');
                                          }

                                          if (photo != null) {
                                            if (kDebugMode) {
                                              print(photo.path);
                                            }
                                          } else {
                                            return await showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  icon: Icon(Icons.workspaces),
                                                  iconColor: Colors.green,
                                                  title: Text(
                                                    'No Image Selected',
                                                  ),
                                                );
                                              },
                                            ).then(
                                              (value) => Navigator.pop(context),
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add_a_photo_outlined,
                                          size: 60,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () async {
                                          final BuildContext ctx =
                                              context; // Save context first
                                          final ImagePicker picker =
                                              ImagePicker();
                                          // value = await picker.pickImage(source: ImageSource.gallery);

                                          final XFile? image = await picker
                                              .pickImage(
                                                source: ImageSource.gallery,
                                              );
                                          pickerImage.value = image;
                                          Navigator.pop(ctx);

                                          if (kDebugMode) {
                                            print('========== $value');
                                          }

                                          if (image != null) {
                                            if (kDebugMode) {
                                              print(image.path);
                                            }
                                          } else {
                                            return await showDialog(
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  icon: Icon(Icons.workspaces),
                                                  iconColor: Colors.green,
                                                  title: Text(
                                                    'No Image Selected',
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                        icon: Icon(
                                          Icons.add_photo_alternate,
                                          size: 60,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                                // Navigator.pop(context);
                              },
                            );
                          },
                          child: Container(
                            height: 250.h,
                            width: 300.w,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              image: value != null
                                  ? DecorationImage(
                                      image: FileImage(
                                        File(pickerImage.value!.path),
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: pickerImage.value != null
                                ? SizedBox.shrink()
                                : Center(
                                    child: Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 70,
                                    ),
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Form(
                key: MyFormKey,
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: selectedValue,
                      builder: (context, selectedValues, child) {
                        return SizedBox(
                          height: 50.h,
                          child: DropdownButtonFormField(
                            hint: Text(
                              'Select Topic',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurface,
                                  ),
                            ),
                            focusColor: Theme.of(context).colorScheme.surface,
                            items: List.generate(
                              TopicsModelData.length,
                              (index) => DropdownMenuItem(
                                value: index,
                                child: Text(
                                  TopicsModelData[index].topicsName,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                      ),
                                ),
                              ),
                            ),
                            onChanged: (int? value) {
                              if (kDebugMode) {
                                print('ansnnsnn ==== $value');
                              }
                              selectedValue.value = value!;
                              if (kDebugMode) {
                                print('ansnnsnn ==== $selectedValue');
                              }
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: newsTile,
                      validator: NewsTileValidator,
                      decoration: InputDecoration(hint: Text('News Title')),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 180.h,
                      child: TextFormField(
                        validator: NewsDetailsValidator,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 10,
                        maxLength: 255,
                        controller: newsDetails,
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          hint: Text('News Description'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 180.h,
                      child: TextFormField(
                        validator: NewsAbtrictionValidator,
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 10,
                        maxLength: 255,
                        controller: newsAbtriction,
                        decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.bodySmall,
                          hint: Text('Abtriction'),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: NewsCopyrightsValidator,
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: newsCopyrights,
                      decoration: InputDecoration(hint: Text('Copyright')),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: NewsdetailsLinkValidator,
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: newsdetailsLink,
                      decoration: InputDecoration(
                        hint: Text('detail Link of News'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: NewsGeoFactsValidator,
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: newsGeoFacts,
                      decoration: InputDecoration(
                        hint: Text('(Geo Facts) Location'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: newsDesFacts,
                      decoration: InputDecoration(
                        hint: Text('des_Facts (Optional)'),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: NewsPublisherValidator,
                      style: Theme.of(context).textTheme.bodySmall,
                      controller: newsByLine,
                      decoration: InputDecoration(
                        hint: Text('Pubilsh By (Name)'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 15.0.h, right: 15.0.w),
        child: SizedBox(
          height: 50.0.h,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox.shrink(),
              GestureDetector(
                onTap: () async {
                  if (!MyFormKey.currentState!.validate()) {
                    if (kDebugMode) print("Form not valid");
                    return;
                  }

                  if (pickerImage.value == null || selectedValue.value == -1) {
                    if (kDebugMode) print("Missing fields");
                    return;
                  }

                  final BuildContext ctx = context; // Save context first

                  if (kDebugMode) {
                    print(
                      "========== validate ==================== ${selectedValue.value} == ${TopicsModelData[selectedValue.value].topicsName}",
                    );
                  }

                  ref
                      .push()
                      .set(
                        Result(
                          section:
                              TopicsModelData[selectedValue.value].topicsName,
                          subsection: '',
                          title: newsTile.text,
                          multimedia: List.generate(
                            3,
                            (index) => Multimedia(
                              url: pickerImage.value!.path,
                              format: 'image',
                              height: 100,
                              width: 100,
                              type: 'image',
                              caption: newsDetails.text,
                              copyright: newsCopyrights.text,
                            ),
                          ).toList(),
                          resultAbstract: newsAbtriction.text,
                          byline: newsByLine.text,
                          geoFacet: [newsGeoFacts.text, newsGeoFacts.text],
                          desFacet: [newsDesFacts!.text, newsDesFacts!.text],
                          updatedDate: DateTime.now(),
                          uri: '',
                          url: newsdetailsLink.text,
                          itemType: 'article',
                          publishedDate: DateTime.now(),
                          createdDate: DateTime.now(),
                          materialTypeFacet: '',
                          kicker: '',
                          orgFacet: [],
                          perFacet: [],
                          shortUrl: '',
                        ).toJson(),
                      )
                      .then((_) {
                        return showDialog(
                          barrierDismissible: false,
                          context: ctx,
                          builder: (dialogCtx) => AlertDialog(
                            icon: Icon(
                              Icons.check_box,
                              size: 70,
                              color: Colors.green,
                            ),
                            title: Text("News Published Successfully"),
                            titleTextStyle: Theme.of(
                              context,
                            ).textTheme.bodySmall,
                            actions: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(dialogCtx); // close dialog
                                  Navigator.pop(ctx); // now close screen
                                },
                                child: Container(
                                  height: 30.h,
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Done",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: SmallCustomButton(buttonTitle: 'Publish'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
