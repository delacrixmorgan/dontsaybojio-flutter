part of 'random_bloc.dart';

class RandomPage extends StatelessWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RandomBloc(randomRepository: RandomRepository())
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
        BlocListener<RandomBloc, RandomState>(listener: (context, state) {
          log('Listener State: ${state.state.name}');
        })
      ],
      child: BlocBuilder<RandomBloc, RandomState>(builder: (context, state) {
        if (state.filteredRandoms.isEmpty) {
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
        final random = state.filteredRandoms[state.currentPosition].text;

        return Center(
            child: Card(
                margin: const EdgeInsets.all(32.0),
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Wrap(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(random,
                                style: Theme.of(context).textTheme.headline2),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: filterChips(context, state),
                            ),
                            const SizedBox(height: 16),
                            FloatingActionButton.extended(
                              label: const Text('Random'),
                              icon: const Icon(Icons.shuffle_rounded),
                              onPressed: () {
                                onRandomButtonClicked(context);
                              },
                            )
                          ],
                        ),
                      ],
                    ))));
      }),
    );
  }

  List<Widget> filterChips(BuildContext context, RandomState state) {
    final List<Widget> chips = [];
    for (final randomType in state.randomSelectableTypes) {
      chips.addAll({
        FilterChip(
          label: Text(randomType.type.name.toString()),
          selected: randomType.isSelected,
          onSelected: (bool value) {
            randomType.isSelected = value;
            context
                .read<RandomBloc>()
                .add(FiltersUpdated(state.randomSelectableTypes));
          },
        ),
        const SizedBox(width: 6)
      });
    }
    return chips;
  }

  void onRandomButtonClicked(BuildContext context){
    context
        .read<RandomBloc>()
        .add(RandomButtonClicked());
  }
}
