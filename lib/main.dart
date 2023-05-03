import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/observer/observer.dart';
import 'package:social_app/core/resources/constants_manager.dart';
import 'package:social_app/core/resources/theme_manager.dart';
import 'package:social_app/core/util/network/cache_helper.dart';
import 'package:social_app/modules/layout/layout.dart';
import 'package:social_app/modules/login/login.dart';
import 'package:social_app/modules/on_boarding/on_boarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  debugPrint(onBoarding.toString());
  uId = CacheHelper.getData(key: 'uId');

  if(onBoarding != null){
    if(uId != null){
      widget = const LayoutScreen();
    }else{
      widget = const LoginScreen();
    }
  }else{
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({super.key,required this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationLightTheme(),
      home: startWidget,
    );
  }
}
