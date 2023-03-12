import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asbeza/presentation/pages/cartPage.dart';

import 'package:asbeza/presentation/pages/Home.dart';

import 'bloc/item_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => itemBloc(),
      child: MaterialApp(
        
          theme: ThemeData(
           
          ),
          home: const item()
        ),
    );
  }
}
