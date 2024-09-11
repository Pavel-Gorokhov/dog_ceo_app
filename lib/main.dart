import 'package:dog_seo_app/pages/home/bloc/home_page_bloc.dart';
import 'package:dog_seo_app/pages/home/bloc/home_page_event.dart';
import 'package:dog_seo_app/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog CEO Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: BlocProvider(
        create: (_) => HomePageBloc()..add(HomePageEventFetchData()),
        child: const HomePage(),
      ),
    );
  }
}
