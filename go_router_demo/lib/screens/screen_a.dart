import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/main.dart';
import 'package:go_router_demo/models/message_model.dart';
import 'package:go_router_demo/notifier/message_notifier.dart';

class TipScreen extends ConsumerWidget {

  const TipScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageProvider);

    MessageModel onSelectTip() {
      final newMessage = message.copyWith(tipAmount: '25.55');
      ref.read(messageProvider.notifier).state = newMessage;
      return newMessage;
    }


    return Scaffold(
        appBar: AppBar(title: Text(CaseTest.title[0])),
        body: BodyWidget(
          btnNextTitle: 'Tip 25.55\$',
          onTapNext: () {
            context.go("/tipFlow", extra: onSelectTip());
          },
        ));
  }
}
