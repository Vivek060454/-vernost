import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vernost/screen/product_screenn.dart';

import 'Repository/product_repo.dart';
import 'bloc/product_bloc.dart';

void main() {
  runApp(RepositoryProvider(
      create: (context)=>WebServise(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
          errorColor: Colors.red,
          colorScheme: ThemeData().colorScheme.copyWith(
            primary:Colors.red,
          ),
          primaryColor: Colors.red,
        ),
        home:  MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {



  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>BlocProvider(
                  create: (context)=>ProfileBloc(WebServise()),
                  child: Home()),
            )));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red ,
      body: Container(

        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('Vernost Marketing Technology Pvt Ltd',textAlign:TextAlign.center,style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500),),
          ),
        ),
      ),
    );
  }
}