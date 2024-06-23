
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open/fetures/Home/data/Repo/HomeRepoimplemtion.dart';
import 'package:open/fetures/Home/data/Repo/Homerepo.dart';
import 'package:open/fetures/Home/presention/cubit/news_cubit.dart';
import 'package:open/fetures/Onbordingscreen/presention/view/onbording.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ), // Wrap your app
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  HomeRepo homeRepo = HopmeRepoImp();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit(homeRepo: homeRepo))
      ],
      child: const MaterialApp(
         useInheritedMediaQuery: true,
     
      builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      BlocProvider.of<NewsCubit>(context)
      .getcourses("News");
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.center,
              colors: [Colors.blue, Colors.white],
            ),
          ),
          child: const OnBordingScreen()),
    );
  }
}
