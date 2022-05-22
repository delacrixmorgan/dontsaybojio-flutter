import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomScreen extends StatelessWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Random")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.go('/page2'),
                child: const Text('Go to page 2'),
              ),
            ],
          ),
        ),
      );
}
