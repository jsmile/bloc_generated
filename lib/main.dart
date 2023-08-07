import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_generated/cubits/counter/counter_cubit.dart';
import 'package:bloc_generated/show_me_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Generated Route Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: _counterCubit,
                child: const MyHomePage(title: 'Bloc Generate Route Home'),
              ),
            );

          case '/counter':
            return MaterialPageRoute(builder: (context) {
              return BlocProvider.value(
                value: _counterCubit,
                child: const ShowMeCounter(),
              );
            });

          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Show me Counter',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/counter',
                );
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text(
                'Increase Counter',
                style: TextStyle(fontSize: 24.0),
              ),
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
            )
          ],
        ),
      ),
    );
  }
}
