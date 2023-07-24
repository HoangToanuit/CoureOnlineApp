import 'package:blocs2_app/pages/application/bloc/app_events.dart';
import 'package:blocs2_app/pages/application/bloc/app_states.dart';
import 'package:blocs2_app/pages/application/widgets/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'bloc/app_blocs.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppState>(builder: (context, state){
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryElement,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.h),
                          topRight: Radius.circular(20.h)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                        )
                      ]
                  ),
                  width: 375.w,
                  height: 58.w,
                  child: BottomNavigationBar(
                    currentIndex: state.index,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.primaryElement,
                    unselectedItemColor: AppColors.primaryFourElementText,
                    onTap: (value){
                      setState(() {
                        context.read<AppBlocs>().add(TriggerAppEvent(value));
                      });
                    },
                    items: bottomTabs
                  ),
                )
            ),
          ),
        );
    });
  }
}
