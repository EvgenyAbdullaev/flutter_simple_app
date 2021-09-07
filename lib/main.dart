import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'navigation/app_state_manager.dart';
import 'navigation/app_router.dart';
import 'network/net_service.dart';
import 'data/moor/m_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = MoorRepo();
  await repository.init();

  runApp(MyApp(repository: repository,));
}

class MyApp extends StatefulWidget {
  final MoorRepo repository;
  const MyApp({required this.repository, Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();
  final _netService = NetService.create();

  late final AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(appStateManager: _appStateManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        Provider(
          lazy: false,
          create: (_) => _netService,
        ),
        Provider<MoorRepo>(
          lazy: false,
          create: (_) => widget.repository,
          dispose: (_, MoorRepo repository) => repository.close(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          primaryColor: Colors.white,
          accentColor: Colors.amber,
          brightness: Brightness.light,
          primaryIconTheme: IconThemeData(color: Colors.black),
        ),
        home: Router(
          routerDelegate: _appRouter,
          backButtonDispatcher: RootBackButtonDispatcher(),
        ),
      ),
    );

  }
}
