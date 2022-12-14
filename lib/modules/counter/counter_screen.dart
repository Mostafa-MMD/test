import 'package:eng_abdallah/modules/counter/cubit/cubit.dart';
import 'package:eng_abdallah/modules/counter/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterMinusState) {
            print('minus state ${state.counter}');
          }
          if (state is CounterPlusState) {
            print('plus state ${state.counter}');
          }
          if (state is CounterRefreshState) {
            print('plus state ${state.counter}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).minus();
                        },
                        child: Text(
                          'MINUS',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Text(
                          '${CounterCubit.get(context).counter}',
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          CounterCubit.get(context).plus();
                        },
                        child: Text(
                          'PLUS',
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    iconSize: 40.0,
                    color: Colors.blue,
                    onPressed: () {
                      CounterCubit.get(context).refresh();
                    },
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
