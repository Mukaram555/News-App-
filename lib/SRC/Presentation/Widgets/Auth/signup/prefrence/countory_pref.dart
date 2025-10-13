import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/SRC/Presentation/Common/Button/custom_button.dart';
import 'package:news_app/SRC/Presentation/Widgets/Auth/signup/prefrence/favrite_topic.dart';

class CountoryPref extends StatefulWidget {
  const CountoryPref({super.key});

  @override
  State<CountoryPref> createState() => _CountoryPrefState();
}

class _CountoryPrefState extends State<CountoryPref> {
  bool isSelected = false;
  String _country = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 40.0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Text(
                  'Countary Selection',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(),
              ],
            ),
            SizedBox(height: 20.h),

            InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,

                  countryListTheme: CountryListThemeData(
                    flagSize: 25,
                    searchTextStyle: Theme.of(context).textTheme.bodyMedium,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
                    bottomSheetHeight:
                        700, // Optional. Country list modal height
                    //Optional. Sets the border radius for the bottomsheet.
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),

                    //Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(
                            0xFF8C98A8,
                          ).withAlpha((255 * 0.2).toInt()),
                        ),
                      ),
                    ),
                  ),
                  onSelect: (Country country) => setState(() {
                    isSelected = true;
                    _country = country.displayName;
                  }),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isSelected == true ? _country : 'Select Countory',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(fontSize: 14),
                  ),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            if (_country.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavriteTopic()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Plase Select a Countory')),
              );
            }
          },
          child: CustomButton(text: 'Next'),
        ),
      ),
    );
  }
}
