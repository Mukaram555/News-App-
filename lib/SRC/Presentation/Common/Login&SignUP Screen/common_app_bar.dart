import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarCommon extends StatelessWidget {
  final void Function()? ontapLeading;
  final String screenTitle;
  final IconData? iconData;
  const AppBarCommon({super.key , this.ontapLeading,required this.screenTitle ,this.iconData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        Text(screenTitle,style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface),),
        iconData != null ? IconButton(onPressed: ontapLeading, icon: Icon(iconData)) : SizedBox(height: 25,width: 25,),
      ],
    );
  }
}
