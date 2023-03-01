import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/main.dart';
import 'package:go_router_demo/models/message_model.dart';
import 'package:go_router_demo/notifier/message_notifier.dart';

class SignatureScreen extends ConsumerWidget {
  const SignatureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final message = ref.watch(messageProvider);

    MessageModel onSignatured() {
      final newMessage = message.copyWith(signature: 'ghhtuiwehtiuew');
      ref.read(messageProvider.notifier).state = newMessage;

      return newMessage;
    }


    return Scaffold(
        appBar: AppBar(title: Text(CaseTest.title[1])),
        body: BodyWidget(
          btnNextTitle: 'Signature',
          onTapNext: () {
            context.go("/tipFlow", extra: onSignatured());
          },
        ));
  }
}
