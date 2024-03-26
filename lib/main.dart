// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:estote_parati/firebase_options.dart';
import 'package:estote_parati/src/providers/providers.dart';
import 'package:estote_parati/src/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDateFormatting('es', null)
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (_) => GroupPlanProvider()),
        ChangeNotifierProxyProvider<GroupPlanProvider, GroupPlanSectionProvider>(
          create: ( context ) => GroupPlanSectionProvider(),
          update: ( context, groupPlanProvider, controller ) {
            if(controller != null)
              return controller..setProvider(groupPlanProvider);
            else
              return GroupPlanSectionProvider()..setProvider(groupPlanProvider);
          }
        ),
        ChangeNotifierProvider(create: (_) => GroupAdviceProvider()),
        ChangeNotifierProvider(create: (_) => ActivityProvider()),
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Estote Parati',
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(brightness: Brightness.light),
            themeMode: ThemeMode.dark,
            initialRoute: 'startupScreen',
            routes: {
              'startupScreen': (_) => const SplashScreen(),

              'homeScreen': (_) => const HomeScreen(),

              'adviceScreen': (_) => const AdviceScreen(),

              'lastAdvicesScreen': (_) => const LastAdvicesScreen(),
              'selectedAdvicesScreen': (_) => const SelectedAdvicesScreen(),

              'groupPlan': (_) => const GroupPlanScreen(),
              'groupPlanSection': (_) => const GroupPlanSectionScreen(),

              'inventoryScreen': (_) => const InventoryScreen(),

              'calendarScreen': (_) => const CalendarScreen(),

              'resourcesScreen': (_) => const ResourcesScreen(),

              'activitiesScreen': (_) => const ActivitiesScreen(),
              'selectedActivityScreen': (_) => const SelectedActivityScreen(),
            },
          );
        },
      ),
    );
  }
}