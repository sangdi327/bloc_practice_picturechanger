import 'package:cubitbloc_practice_picturechanger/bloc/picture_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('landscape pictures'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<PictureBloc, PictureState>(builder: (context, state) {
                return Column(
                  children: [
                    if (state.count >= 0)
                      Text(
                        state.count.toString(),
                        style: const TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    SizedBox(
                      height: 300,
                      child: state.path == ''
                          ? const SizedBox()
                          : Image.asset('image/${state.path}'),
                    ),
                  ],
                );
              }),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<PictureBloc>().add(PictureEvent());
                },
                child: const Text('change pictures'),
              ),
            ],
          ),
        ));
  }
}
