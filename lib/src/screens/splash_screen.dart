// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lottie/lottie.dart';

import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/utils/utils.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      backgroundColor: groupColor,
      body: Center(
        child: Builder(
          builder: (context){
            SplashScreenProvider splashScreenController = Provider.of<SplashScreenProvider>(context, listen: false);
            GroupPlanProvider groupPlanProvider = Provider.of<GroupPlanProvider>(context, listen: false);
            GroupAdviceProvider groupAdviceProvider = Provider.of<GroupAdviceProvider>(context, listen: false);
            EventProvider eventProvider = Provider.of<EventProvider>(context, listen: false);

            groupPlanProvider.init();
            groupAdviceProvider.init();
            eventProvider.init();

            splashScreenController.startAnimation();
            splashScreenController.onAnimationEnd(() {
              bool loadedProviders = groupPlanProvider.loaded
                  && groupAdviceProvider.loaded
                  && eventProvider.loaded;
              if(loadedProviders)
                Navigator.pushNamedAndRemoveUntil(context, 'homeScreen', (route) => false);
            });

            return Lottie.asset(loading, height: 150);
          },
        ),
      )
    );
  }
}