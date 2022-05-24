import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
          RandomBloc(randomRepository: RandomRepository())
            ..add(const Start()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Random")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const RandomListView(),
              ElevatedButton(
                onPressed: () => context.go('/page2'),
                child: const Text('Go to page 2'),
              ),
            ],
          ),
        ),
      ),
    );
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

        return Scrollbar(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 4),
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
