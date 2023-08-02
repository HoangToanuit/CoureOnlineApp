import 'package:blocs2_app/common/routes/names.dart';
import 'package:blocs2_app/global.dart';
import 'package:blocs2_app/pages/application/application_page.dart';
import 'package:blocs2_app/pages/application/bloc/app_blocs.dart';
import 'package:blocs2_app/pages/register/bloc/register_blocs.dart';
import 'package:blocs2_app/pages/register/register.dart';
import 'package:blocs2_app/pages/sign_in/bloc/sigin_blocs.dart';
import 'package:blocs2_app/pages/sign_in/sign_in_page.dart';
import 'package:blocs2_app/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/welcome/bloc/welcome_bloc.dart';


class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const WelcomePage(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())
      ),
      PageEntity(
          route: AppRoutes.SING_IN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())
      ),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(create: (_) => RegisterBlocs())
      ),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBlocs())
      ),

    ];
  }

  static List<dynamic> allBlocsProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        print("valid name:${settings.name}");
        bool deviceIsFirstOpen = Global.storageService.getDeviceFirstOpen();
        if(result.first.route==AppRoutes.INITIAL&&deviceIsFirstOpen){
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const ApplicationPage(), settings: settings);
          }
           return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
      }
        return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);
      }
    }
    print("valid:${settings.name}");
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc
});
}