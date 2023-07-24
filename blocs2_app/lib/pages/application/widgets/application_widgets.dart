import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

Widget buildPage(int index){

  List<Widget> _widget =[
    Center(child: Text("Hi"),),
    Center(child: Text("Search"),),
    Center(child: Text("Cart"),),
    Center(child: Text("Hi"),),
    Center(child: Text("Hi"),)
  ];

  return _widget[index];

}

var bottomTabs = [
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png"),
      ),
      label: "Home",
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/home.png",color: AppColors.primaryElement),
      )
  ),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/search2.png"),
      ),
      label: "Search",
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/search2.png",color: AppColors.primaryElement),
      )
  ),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      label: "Course",
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png",color: AppColors.primaryElement),
      )
  ),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/message-circle.png"),
      ),
      label: "Message",
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/message-circle.png",color: AppColors.primaryElement),
      )
  ),
  BottomNavigationBarItem(
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      label: "Profile",
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png",color: AppColors.primaryElement),
      )
  )
];