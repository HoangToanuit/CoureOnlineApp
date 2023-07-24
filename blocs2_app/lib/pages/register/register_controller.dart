import 'package:blocs2_app/common/widgets/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_blocs.dart';

class RegisterController{
  final BuildContext context;
  RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;
    if(userName.isEmpty){
        toastInfor(msg: "User name can not be empty");
        return;
    }
    if(email.isEmpty){
        toastInfor(msg: "Email can not be empty");
        return;
    }
    if(password.isEmpty){
        toastInfor(msg: "Password is can not be empty");
        return;
    }
    if(password.isEmpty){
      toastInfor(msg: "Your password confirmation is wrong");
      return;
    }

    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      if(credential.user!=null){
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfor(msg: "An email has been sent to your register email. To activate it plese check your email");
        Navigator.of(context).pop();
      }
    }on FirebaseAuthException catch(e){
      if(e.code == 'invalid-email'){
        toastInfor(msg: "The email provided is invalid");
      }else if(e.code=='email-already-in-use'){
        toastInfor(msg: "The password provide is to weak");
      }else if(e.code=='email-already-in-use'){
        toastInfor(msg: "The password provide is to weak");
      }
    }
  }
}