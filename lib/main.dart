// import 'dart:io';
//
// import 'package:demo_flutter/injection.dart';
// import 'package:demo_flutter/network/connectivity_manager/ConnectivityManager.dart';
// import 'package:demo_flutter/screens/recipe_details/ui/recipe_details_cubit.dart';
// import 'package:demo_flutter/screens/recipe_list/ui/search_receipe_screen.dart';
// import 'package:demo_flutter/screens/recipe_list/ui/search_receipe_screen_cubit.dart';
// import 'package:demo_flutter/screens/search_recipe/search_recipe_cubit.dart';
// import 'package:demo_flutter/themes/app_theme.dart';
// import 'package:demo_flutter/themes/theme_notifier.dart';
// import 'package:demo_flutter/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   getItSetupInit();
//
//   HttpOverrides.global = MyHttpOverrides();
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//   runApp(
//     ChangeNotifierProvider<ThemeNotifier>(
//       create: (_) => ThemeNotifier(AppTheme().purpleTheme),
//       child:  MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           body: ConnectivityManager(child: TKGeneralApp()),
//         ),
//         onGenerateRoute: Routes.onGeneratedRoute,
//       ),
//     ),
//   );
// }
//
// class TKGeneralApp extends StatefulWidget {
//   const TKGeneralApp({super.key});
//
//   @override
//   State<TKGeneralApp> createState() => _TKGeneralAppState();
// }
//
// class _TKGeneralAppState extends State<TKGeneralApp> {
//   @override
//   Widget build(BuildContext context) {
//     final themeNotifier = Provider.of<ThemeNotifier>(context);
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<SearchReceipeScreenCubit>(
//             create: (BuildContext context) =>
//                 getIt<SearchReceipeScreenCubit>()),
//         BlocProvider<RecipeDetailsCubit>(
//             create: (BuildContext context) => getIt<RecipeDetailsCubit>()),
//         BlocProvider<SearchRecipeCubit>(
//             create: (BuildContext context) => getIt<SearchRecipeCubit>()),
//       ],
//       child: const SearchRecipeListScreen(),
//     );
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
import 'dart:io';
import 'package:demo_flutter/injection.dart';
import 'package:demo_flutter/model/local_db/data_base_helper.dart';
import 'package:demo_flutter/network/connectivity_manager/ConnectivityManager.dart';
import 'package:demo_flutter/screens/recipe_details/ui/recipe_details_cubit.dart';
import 'package:demo_flutter/screens/recipe_list/ui/search_receipe_screen.dart';
import 'package:demo_flutter/screens/recipe_list/ui/search_receipe_screen_cubit.dart';
import 'package:demo_flutter/screens/search_recipe/search_recipe_cubit.dart';
import 'package:demo_flutter/themes/app_theme.dart';
import 'package:demo_flutter/themes/theme_notifier.dart';
import 'package:demo_flutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// void main() async {
//   // Ensure that Flutter is initialized
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Initialize dependency injection
//   getItSetupInit();
//
//   // Override HTTP client to accept all certificates
//   HttpOverrides.global = MyHttpOverrides();
//
//   // Set preferred orientations
//   SystemChrome.setPreferredOrientations(
//       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
//
//   // Run the app
//   runApp(
//     ChangeNotifierProvider<ThemeNotifier>(
//       // Provide the theme notifier for theme changes
//       create: (_) => ThemeNotifier(AppTheme().purpleTheme),
//       child: const MaterialApp(
//         // Disable the debug banner
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           // Use ConnectivityManager to manage connectivity
//           body: ConnectivityManager(child: TKGeneralApp()),
//         ),
//         // Define custom route generation logic
//         onGenerateRoute: Routes.onGeneratedRoute,
//       ),
//     ),
//   );
// }


void main() async {
  // Ensure that Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  getItSetupInit();

  // Initialize the DatabaseHelper
  final databaseHelper = DatabaseHelper(); // Assuming this class has a default constructor

  // Override HTTP client to accept all certificates
  HttpOverrides.global = MyHttpOverrides();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Run the app
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      // Provide the theme notifier for theme changes
      create: (_) => ThemeNotifier(AppTheme().purpleTheme),
      child: MaterialApp(
        // Disable the debug banner
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // Use ConnectivityManager to manage connectivity
          body: ConnectivityManager(child: TKGeneralApp(databaseHelper: databaseHelper)),
        ),
        // Define custom route generation logic
        onGenerateRoute: Routes.onGeneratedRoute,
      ),
    ),
  );
}


class TKGeneralApp extends StatefulWidget {
  final DatabaseHelper databaseHelper;

  const TKGeneralApp({Key? key, required this.databaseHelper}) : super(key: key);

  @override
  State<TKGeneralApp> createState() => _TKGeneralAppState();
}

class _TKGeneralAppState extends State<TKGeneralApp> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchReceipeScreenCubit>(
            create: (BuildContext context) =>
                getIt<SearchReceipeScreenCubit>()),
        BlocProvider<RecipeDetailsCubit>(
            create: (BuildContext context) => getIt<RecipeDetailsCubit>()),
        BlocProvider<SearchRecipeCubit>(
            create: (BuildContext context) => getIt<SearchRecipeCubit>()),
      ],
      child: SearchRecipeListScreen(databaseHelper: widget.databaseHelper),
    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
