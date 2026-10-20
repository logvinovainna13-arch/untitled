import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/ui/fox/bloc/fox_bloc.dart';

class FoxScreen extends StatefulWidget {
  const FoxScreen({super.key});

  @override
  State<FoxScreen> createState() => _FoxScreenState();
}

class _FoxScreenState extends State<FoxScreen> {
  late final FoxBloc _foxBloc;

  @override
  void initState() {
    super.initState();
    _foxBloc = FoxBloc();
    _foxBloc.add(GetFoxImageEvent());
  }

  @override
  void dispose() {
    _foxBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          _foxBloc.add(GetFoxImageEvent());
        },
      ),
      body: Center(
        child: BlocBuilder<FoxBloc, FoxState>(
          bloc: _foxBloc,
          builder: (context, state) {
            if (state is LoadedFoxImageState) {
              return Image.network(
                state.img,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              );
            }
            if (state is ErrorFoxState) {
              return const Text(
                'Ошибка загрузки',
                style: TextStyle(fontSize: 50),
              );
            }
            if (state is LoadingFoxState) {
              return const CircularProgressIndicator.adaptive();
            }
            return const Text('Initial State');
          },
        ),
      ),
    );
  }
}
