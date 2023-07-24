import 'package:blocs2_app/pages/register/bloc/register_event.dart';
import 'package:blocs2_app/pages/register/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blocs2_app/pages/register/bloc/register_event.dart';
import '../../common/values/colors.dart';
import '../sign_in/bloc/sigin_blocs.dart';
import '../sign_in/bloc/signin_state.dart';
import '../sign_in/sign_in_controller.dart';
import '../sign_in/widgets/sign_in_widget.dart';
import 'bloc/register_blocs.dart';
import 'bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state){
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Register"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h,),
                      Center(child: reusableText("Enter your details below & free sign up")),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        padding: EdgeInsets.only(left: 25.w,right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("User name"),
                            SizedBox(height: 5.h,),
                            buildTextField("username", "Email","user","Enter your user name", (value){
                              context.read<RegisterBlocs>().add(UserNameEvent(value));
                            }),
                            reusableText("Email"),
                            SizedBox(height: 5.h,),
                            buildTextField("email", "email","user","Enter your email",(value){
                              context.read<RegisterBlocs>().add(EmailEvent(value));
                            }),
                            reusableText("Password"),
                            SizedBox(height: 5.h,),
                            buildTextField("email", "password","lock","Enter your password",(value){
                              context.read<RegisterBlocs>().add(PasswordEvent(value));
                            }),
                            reusableText("Password"),
                            SizedBox(height: 5.h,),
                            buildTextField("email", "repassword","lock","Enter your Confirm password",(value){
                              context.read<RegisterBlocs>().add(RePasswordEvent(value));
                            }),
                            buildButton("Login", AppColors.primaryElement,Colors.white,"login",(){
                              RegisterController(context:context).handleEmailRegister();
                            }),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}
