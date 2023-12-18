import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routemaster/routemaster.dart';
import 'package:silktech_users/config/routes/routes.dart';
import 'package:silktech_users/config/themes/app_themes.dart';
import 'package:silktech_users/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Silk Tech Users',
      theme: AppTheme.light,
      routerDelegate:
          RoutemasterDelegate(routesBuilder: (_) => RouterConatiner().routes),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
