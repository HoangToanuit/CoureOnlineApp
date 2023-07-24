import 'package:blocs2_app/common/widgets/flutter_toast.dart';
import 'package:blocs2_app/pages/sign_in/bloc/sigin_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({
    required this.context,
  });

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email"){
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if(emailAddress.isEmpty){
          toastInfor(msg: "You need to fill email");
        }
        if(password.isEmpty){
          toastInfor(msg: "You need to fill password");
        }
        try{
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: emailAddress,
              password: password
          );
          if(credential.user == null){
            toastInfor(msg: "You don't exist");
            return;
          }
          if(!credential.user!.emailVerified){
            toastInfor(msg: "You need to verify your email");
            return;
          }
          var user = credential.user;
          if(user!=null){
            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route) => false);
          }else{
            toastInfor(msg: "You don not user of this app");
          }
        } on FirebaseAuthException catch(e){
            if(e.code == 'user-not-found'){
              toastInfor(msg: "No user for that email");
            }else if(e.code == 'wrong-password'){
            toastInfor(msg: "Wrong password provider");
            }else if(e.code == 'Invalid-email'){
              toastInfor(msg: "Your email is wrong");
            }
        }
      }
    }catch(e){

    }
  }
}