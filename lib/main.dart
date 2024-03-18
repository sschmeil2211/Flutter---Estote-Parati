import 'package:estote_parati/src/transitions/transitions.dart';
import 'package:flutter/material.dart';

import 'package:estote_parati/src/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          title: 'Estote Parati',
          debugShowCheckedModeBanner: false,
          darkTheme: ThemeData(brightness: Brightness.light),
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  for (final platform in TargetPlatform.values)
                    platform: const NoTransitionsBuilder(),
                }
            ),
          ),
          initialRoute: 'homeScreen',
          routes: {
            'homeScreen': (_) => const HomeScreen(),

            'adviceScreen': (_) => const AdviceScreen(),
            'lastAdvicesScreen': (_) => const LastAdvicesScreen(),
            'selectedAdvicesScreen': (_) => const SelectedAdvicesScreen(),
            'groupPlan': (_) => const GroupPlanScreen(),
            'groupPlanSection': (_) => const GroupPlanSectionScreen(),
            'inventoryScreen': (_) => const InventoryScreen(),

            'calendarScreen': (_) => const CalendarScreen(),

            'resourcesScreen': (_) => const ResourcesScreen()
          },
        );
      },
    );
  }
}