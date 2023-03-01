import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/main.dart';
import 'package:go_router_demo/notifier/message_notifier.dart';
import 'package:go_router_demo/routes/router_provider.dart';

class DoneScreen extends ConsumerWidget {
  const DoneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageProvider);

    return Scaffold(
        appBar: AppBar(title: const Text('Done Screen')),
        body: BodyWidget(
          data: message.toJson().toString(),
          onTapBack: () {
            context.goNamed(RouterNameProvider.home);
          },
        ));
  }
}
