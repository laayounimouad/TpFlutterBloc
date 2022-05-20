import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/counter/bloc/counter_bloc.dart';
import 'package:flutterbloc/bloc/counter_cubit.dart';

class HomeCubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cubit")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                "Value ===> ${state.counterValue}",
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrement());
                  },
                  child: Text("Increment +")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrement());
                  },
                  child: Text("Decrement"))
            ],
          )
        ],
      ),
    );
  }
}
