import 'package:bloc_learn/bloc/counter/counter_bloc.dart';
import 'package:bloc_learn/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_learn/bloc/posts/posts_bloc.dart';
import 'package:bloc_learn/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_learn/equtable_testing.dart';
import 'package:bloc_learn/ui/counter_screen/counter_screen.dart';
import 'package:bloc_learn/ui/home_screen/home_screen.dart';
import 'package:bloc_learn/ui/posts/posts_screen.dart';
import 'package:bloc_learn/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_learn/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // use of multiblocprovider , explain in copy
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => PostsBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: HomeScreen()
      ),
    );
  }
}
