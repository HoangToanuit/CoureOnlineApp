import 'package:blocs2_app/common/values/colors.dart';
import 'package:blocs2_app/pages/sign_in/bloc/signin_envents.dart';
import 'package:blocs2_app/pages/sign_in/sign_in_controller.dart';
import 'package:blocs2_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/sigin_blocs.dart';
import 'bloc/signin_state.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state){
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: buildAppBar("Login"),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildThirdPartyLogin(),
                      Center(child: reusableText("Or use your email account login")),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        padding: EdgeInsets.only(left: 25.w,right: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            reusableText("Email"),
                            SizedBox(height: 5.h,),
                            buildTextField("email", "Email","user","Enter your email address", (value){
                              context.read<SignInBloc>().add(EmailEvent(value));
                            }),
                            reusableText("Password"),
                            SizedBox(height: 5.h,),
                            buildTextField("email", "password","lock","Enter your password",(value){
                              context.read<SignInBloc>().add(PassWordEvent(value));
                            }),
                            forgotPassWord(),
                            buildButton("Login", AppColors.primaryElement,Colors.white,"login",(){
                              SignInController(context: context).handleSignIn("email");
                              print("Login buttom");
                            }),
                            SizedBox(height: 10.h,),
                            buildButton("Register", Colors.grey.withOpacity(0.3),AppColors.primaryText,"register",(){
                              Navigator.of(context).pushNamed('/register');
                            })
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

