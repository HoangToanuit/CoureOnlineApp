import 'package:blocs2_app/main.dart';
import 'package:blocs2_app/pages/bloc/welcome_bloc.dart';
import 'package:blocs2_app/pages/bloc/welcome_event.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/values/colors.dart';
import 'bloc/welcome_state.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder:(context, state){
            return Container(
              margin: EdgeInsets.only(top:30.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index){
                      state.page=index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "next",
                          "Fist Seeing Learning",
                          "Forget about a for of paper all knowledge in on learning",
                          "assets/images/reading.png"
                      ),
                      _page(
                          2,
                          context,
                          "next",
                          "Connect with everyone",
                          "Connect with everyone",
                          "assets/images/boy.png"
                      ),
                      _page(
                          3,
                          context,
                          "next",
                          "Fist Seeing Learning",
                          "Forget about a for of paper all knowlet in on learning",
                          "assets/images/man.png"

                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                            color: AppColors.primaryThreeElementText,
                            size: const Size.square(8.0),
                            activeSize: const Size(20, 8.0),
                            activeColor: AppColors.primaryElement,
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                      )
                  )
                ],
              ),
            );
          }
        )
      ),
    );
  }
  Widget _page(int index, BuildContext context, String buttonName, String title, String subTitle, String imagePath){
    return Column(
      children: [
        SizedBox(
            height:345.w,
            width:345.w,
            child: Image.asset(imagePath, fit: BoxFit.cover,)
        ),
        Container(
            child: Text(title,
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp
                )
            )
        ),
        Container(
          child: Text(subTitle,
              style: TextStyle(
                  color: AppColors.primarySecondaryElementText,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp
              )
          ),
        ),
        GestureDetector(
          onTap: (){
            if(index<3){
              pageController.animateToPage(
                  index,
                  duration: const Duration(microseconds: 5000),
                  curve: Curves.easeIn
              );
            }else{
              Navigator.of(context).pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 50.h, left: 50.w,right: 50.w),
            height: 50.h,
            width: 325.w,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(Radius.circular(15.w)),
                boxShadow:[
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0,1)
                  )
                ]
            ),
            child: Center(
              child: Text(buttonName,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp
                  )
              ),
            ),
          ),
        )
      ],
    );
  }
}
