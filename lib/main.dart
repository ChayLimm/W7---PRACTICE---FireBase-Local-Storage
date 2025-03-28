import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/data/repository/local/local_ride_preferences_repository.dart';
import 'package:week_3_blabla_project/data/repository/locations_firestore_repository.dart';
import 'package:week_3_blabla_project/ui/provider/rides_prefs_provider.dart';
// import 'data/repository/mock/mock_locations_repository.dart';
import 'data/repository/mock/mock_rides_repository.dart';
import 'domain/service/locations_service.dart';
import 'domain/service/rides_service.dart';

import 'ui/screens/ride_pref/ride_pref_screen.dart';
// import 'service/ride_prefs_service.dart';
import 'ui/theme/theme.dart';

Future<void> main() async {
  // 1 - Initialize the services
  // RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService.initialize(LocationsFirestoreRepository());
  RidesService.initialize(MockRidesRepository());

  // 2 - Run the UI with providers
   // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCOOOMGHwIn5qvqgHv7WC1Ztu4MoiEmDvY",
      authDomain: "blablacar-9f7e4.firebaseapp.com",
      databaseURL: "https://blablacar-9f7e4-default-rtdb.firebaseio.com",
      projectId: "blablacar-9f7e4",
      storageBucket: "blablacar-9f7e4.firebasestorage.app",
      messagingSenderId: "1009034178904",
      appId: "1:1009034178904:web:1523fdc19d54da444b752d",
      measurementId: "G-S2TWLG1Q3B"
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RidesPrefsProvider(LocalRidePreferencesRepository())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
