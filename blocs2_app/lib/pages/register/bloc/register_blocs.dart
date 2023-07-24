import 'package:bloc/bloc.dart';
import 'package:blocs2_app/pages/register/bloc/register_event.dart';
import 'package:blocs2_app/pages/register/bloc/register_state.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates>{
    RegisterBlocs():super(RegisterStates()){
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
    }

    void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit){
      emit(state.copyWith(userName:event.userName));
      print(event.userName);
    }
    void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit){
        emit(state.copyWith(email:event.email));
    }
    void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit){
        emit(state.copyWith(password:event.password));
    }
    void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit){
        emit(state.copyWith(rePassword:event.rePassword));
    }
}