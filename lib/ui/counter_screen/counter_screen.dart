import 'package:bloc_learn/bloc/counter/counter_event.dart';
import 'package:bloc_learn/bloc/counter/counter_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_learn/bloc/counter/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // global bloc k liye
  late CounterBloc _counterBloc;
  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Counter app')),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // use of blocbuilder
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counter.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  // kb build krna h uske liye hai
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        // jo counterincrement ka fun . bnye te vhi call krenge ki press ho kr work kre
                        context.read<CounterBloc>().add(IncrementCouter());
                      },
                      child: const Text('Add')
                    );
                  },
                ),


                SizedBox(width: 15),
                BlocBuilder<CounterBloc, CounterState>(
                  // kb build krna h uske liye hai
                  buildWhen: (current, previous) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        // jo counterdecrement ka fun . bnye te vhi call krenge ki press ho kr work kre
                        context.read<CounterBloc>().add(DecrementCouter());
                      },
                      child: const Text('Removed')
                    );
                  },
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
