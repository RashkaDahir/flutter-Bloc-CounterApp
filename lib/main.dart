import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_learn/bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => CounterBloc(),
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    state.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () => context.read<CounterBloc>().add(CounterIncreament()),
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 10,),
                      FloatingActionButton(
                        onPressed: () => context.read<CounterBloc>().add(CounterDecreament()),
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    
    );
  }
}
