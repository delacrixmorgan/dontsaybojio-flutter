import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random/src/data/injections.dart';
import 'package:random/src/data/random_repository.dart';
import 'package:random/src/ui/random_bloc.dart';
import 'package:random/src/ui/random_event.dart';
import 'package:random/src/ui/random_state.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setupDataLocators();
    return BlocProvider(
        create: (context) =>
            RandomBloc(randomRepository: getIt.get<RandomRepository>())
              ..add(const Start()),
        child: Scaffold(
            appBar: AppBar(title: const Text("Random")),
            body: const RandomListView()));
  }
}

class RandomListView extends StatelessWidget {
  const RandomListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RandomBloc, RandomState>(listener: (context, state) {})
      ],
      child: BlocBuilder<RandomBloc, RandomState>(builder: (context, state) {
        log('State: $state');
        if (state.randoms.isEmpty) {
          if (state.state == RandomStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state != RandomStatus.success) {
            return const SizedBox();
          } else {
            return Center(
              child: Text(
                "Random List is Empty",
                style: Theme.of(context).textTheme.caption,
              ),
            );
          }
        }

        for (final random in state.randoms) {
          log('Random: ${random.text}');
        }

        return Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.vertical,
            itemCount: state.randoms.length,
            itemBuilder: (context, index) {
              final item = state.randoms[index];
              final bloc = context.read<RandomBloc>();

              return Text(item.text);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 0);
            },
          ),
        );
      }),
    );
  }
}
