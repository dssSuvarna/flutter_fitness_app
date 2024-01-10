import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitnessapp/firebase_options.dart';
import 'package:fitnessapp/model/GetItUserData.dart';
import 'package:fitnessapp/screens/account_related_screens/splash_screen.dart';
import 'package:fitnessapp/screens/account_related_screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.instance.registerSingleton(GetItUserData());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('hi', 'IN')],
      path: 'assets/translation',
      fallbackLocale: const Locale('en', 'US'),
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData || FirebaseAuth.instance.currentUser != null) {
          // The user is signed in or there is a current user.
          return MaterialApp(
            theme: ThemeData(useMaterial3: true),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const Splash(),
          );
        } else {
          // No user is signed in.
          return MaterialApp(
            theme: ThemeData(useMaterial3: true),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: const WelcomeScreen(),
          );
        }
      },
    );

    // MaterialApp(
    //   title: 'Fitness App',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const WelcomeScreen(),
    // );
  }
}
