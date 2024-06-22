import 'package:blockstate/features/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          "Bloc State Management",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
        ),
      ),

      body: BlocConsumer<CounterBloc, CounterState>(
        bloc: counterBloc,
        listenWhen: (previous, current) => current is CounterActionState,
        buildWhen: (previous, current) => current is! CounterActionState,
        listener: (context, state) {
          if (state is CounterShowSnackbarActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('SnacBar Button Pressed!')));
          }
        },
        builder: (context, state) {
          int counterValue = 0;
          if (state is CounterIncreamentState) {
            counterValue = state.val;
          } else if (state is CounterDecreamentState) {
            counterValue = state.val;
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counterValue.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 80),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        counterBloc.add(CounterDecreamentevent());
                      },
                      backgroundColor: Colors.teal.shade200,
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        counterBloc.add(CounterIncreamentevent());
                      },
                      backgroundColor: Colors.teal.shade200,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.amber)),
                    onPressed: () {
                      counterBloc.add(CounterShowSnacbarEvent());
                    },
                    child: const Text(
                      'SnackBar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ))
              ],
            ),
          );
        },
      ),

      // body: BlocListener<CounterBloc, CounterState>(
      //   bloc: counterBloc,
      //   listener: (context, state) {
      //     if (state is CounterShowSnackbarActionState) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //           const SnackBar(content: Text('Snacbar Button Pressed!')));
      //     }
      //   },
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const Text(
      //           '0',
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80),
      //         ),
      //         const SizedBox(
      //           height: 30,
      //         ),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             FloatingActionButton(
      //               onPressed: () {
      //                 counterBloc.add(CounterDecreamentevent());
      //               },
      //               backgroundColor: Colors.teal.shade200,
      //               child: const Icon(Icons.remove),
      //             ),
      //             FloatingActionButton(
      //               onPressed: () {
      //                 counterBloc.add(CounterIncreamentevent());
      //               },
      //               backgroundColor: Colors.teal.shade200,
      //               child: const Icon(Icons.add),
      //             ),
      //           ],
      //         ),
      //         const SizedBox(
      //           height: 30,
      //         ),
      //         ElevatedButton(
      //             style: const ButtonStyle(
      //                 backgroundColor: WidgetStatePropertyAll(Colors.amber)),
      //             onPressed: () {
      //               counterBloc.add(CounterShowSnacbarEvent());
      //             },
      //             child: const Text(
      //               'SnackBar',
      //               style: TextStyle(
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.black,
      //                   fontSize: 25),
      //             ))
      //       ],
      //     ),
      //   ),
      // ),

      // body: BlocBuilder<CounterBloc, CounterState>(
      //   bloc: counterBloc,
      //   builder: (context, state) {
      //     int counterValue = 0;

      //     if (state is CounterIncreamentState) {
      //       counterValue = state.val;
      //     } else if (state is CounterDecreamentState) {
      //       counterValue = state.val;
      //     }

      //     return Center(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             counterValue.toString(),
      //             style: const TextStyle(
      //                 fontWeight: FontWeight.bold, fontSize: 80),
      //           ),
      //           const SizedBox(
      //             height: 30,
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               FloatingActionButton(
      //                 onPressed: () {
      //                   counterBloc.add(CounterDecreamentevent());
      //                 },
      //                 backgroundColor: Colors.teal.shade200,
      //                 child: const Icon(Icons.remove),
      //               ),
      //               FloatingActionButton(
      //                 onPressed: () {
      //                   counterBloc.add(CounterIncreamentevent());
      //                 },
      //                 backgroundColor: Colors.teal.shade200,
      //                 child: const Icon(Icons.add),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
