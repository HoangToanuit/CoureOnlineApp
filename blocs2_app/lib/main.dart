
import 'package:blocs2_app/common/routes/pages.dart';
import 'package:blocs2_app/pages/application/application_page.dart';
import 'package:blocs2_app/pages/bloc/welcome_bloc.dart';
import 'package:blocs2_app/pages/bloc_providers.dart';
import 'package:blocs2_app/pages/register/register.dart';
import 'package:blocs2_app/pages/sign_in/bloc/sigin_blocs.dart';
import 'package:blocs2_app/pages/sign_in/sign_in_page.dart';
import 'package:blocs2_app/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [...AppPages.allBlocsProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: Colors.white
                )
              ),
              home: WelcomePage(),
              onGenerateRoute: AppPages.GenerateRouteSettings,
            );
          },
        )
    );
  }
}

