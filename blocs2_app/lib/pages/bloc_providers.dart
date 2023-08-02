import 'package:blocs2_app/pages/register/bloc/register_blocs.dart';
import 'package:blocs2_app/pages/sign_in/bloc/sigin_blocs.dart';
import 'package:blocs2_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders{
  static get allBlocProvider=>[
    BlocProvider(
        lazy: false,
        create: (context) => WelcomeBloc()
    ),
    // BlocProvider(
    //     lazy: false,
    //     create: (context) => AppBlocs()
    // ),
    BlocProvider(
        create: (context) => SignInBloc()
    ),
    BlocProvider(
        create: (context) => RegisterBlocs(),
    )
  ];
}