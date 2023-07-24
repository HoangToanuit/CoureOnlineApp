import 'package:bloc/bloc.dart';
import 'package:blocs2_app/pages/sign_in/bloc/signin_envents.dart';
import 'package:blocs2_app/pages/sign_in/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc():super(const SignInState()){
    on<EmailEvent>(_emailEvent);

    on<PassWordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SignInState>emit){
    // print({event.email});
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PassWordEvent event, Emitter<SignInState>emit){
    // print({event.password});
    emit(state.copyWith(password: event.password));
  }
}