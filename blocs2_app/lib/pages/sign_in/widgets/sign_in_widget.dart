import 'package:blocs2_app/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(String title){
  return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0),
        child: Container(
          color: AppColors.primarySecondaryBackground,
          height: 1.0,
        ),
      ),
      title: Center(
        child: Text(title,
            style:TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold
            )
        ),
      )
  );
}
Widget buildThirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h
    ),
    padding: EdgeInsets.only(left: 20.w,right: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcons("facebook"),
        reusableIcons("apple"),
        reusableIcons("google")
      ],
    )
  );
}
Widget reusableIcons(String iconName){
  return GestureDetector(
    onTap: (){},
    child: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reusableText(String text){
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 14.sp
      ),
    ),
  );
}
Widget buildTextField(String text, String textType, String iconName, String hintText, void Function(String value)? func){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
      border: Border.all(color: AppColors.primaryFourElementText)
    ),
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15.w),
          width: 16,
          height: 16,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextField(
            onChanged: (value)=>func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent
                )
              ),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent
                  )
              ),
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText
              )

            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp
            ),
            autocorrect: false,
            obscureText: textType=="password"?true:false,
          ),
        )
      ],
    )
  );
}

Widget forgotPassWord(){
  return SizedBox(
    height: 44.h,
    width: 270,
    child: Text(
      "Forgot password",
      style: TextStyle(
        color: AppColors.primaryText,
        decoration: TextDecoration.underline,
        decorationColor:AppColors.primaryText,
        fontSize: 12.sp
      ),
    ),
  );
}
Widget buildButton(String buttonName, Color colorButton, Color colorText,String buttonType, void Function()? fun){
  return GestureDetector(
    onTap: fun,
    child: Container(
      alignment: Alignment.center,
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(top: buttonType=="login"?30.h:30.h),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: buttonType=="login"?AppColors.primaryElement:AppColors.primaryBackground,
        boxShadow: [
          BoxShadow(
              blurRadius: 0.5,
              spreadRadius: 0.5,
              color: Colors.grey.withOpacity(0.5)
          )
        ],
        border: Border.all(
          color: buttonType=="login"?Colors.transparent:AppColors.primaryThreeElementText
        )
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: buttonType=="login"?Colors.white:Colors.black
        ),
      ),
    ),
  );
}
