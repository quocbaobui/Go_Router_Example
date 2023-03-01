import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/main.dart';
import 'package:go_router_demo/models/message_model.dart';
import 'package:go_router_demo/screens/screen_a.dart';
import 'package:go_router_demo/screens/screen_b.dart';
import 'package:go_router_demo/screens/screen_c.dart';
import 'package:go_router_demo/screens/screen_d.dart';
import 'router_provider.dart';

// Current Flow ScreenA(Tip) -> ScreenB(Signature) -> ScreenC(ReceiptType) -> ScreenD(Submit)

final goRouters = GoRouter(
  initialLocation: RouterPathProvider.home,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: RouterNameProvider.login,
      path: RouterPathProvider.login,
      builder: (context, state) => Container(),
    ),
    GoRoute(
      path: RouterPathProvider.home,
      name: RouterNameProvider.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: RouterNameProvider.tipScreen,
      path: RouterPathProvider.tipScreen,
      builder: (context, state) => const TipScreen(),
    ),
    GoRoute(
      name: RouterNameProvider.signatureScreen,
      path: RouterPathProvider.signatureScreen,
      builder: (context, state) => const SignatureScreen(),
    ),
    GoRoute(
      name: RouterNameProvider.receiptScreen,
      path: RouterPathProvider.receiptScreen,
      builder: (context, state) => const ReceiptScreen(),
    ),
    GoRoute(
      name: RouterNameProvider.doneTipScreen,
      path: RouterPathProvider.doneTipScreen,
      builder: (context, state) => const DoneScreen(),
    ),
    GoRoute(
      name: RouterNameProvider.tipFlow,
      path: RouterPathProvider.tipFlow,
      builder: (context, state) => const TipScreen(),
      redirect: (context, state) {
        final message = state.extra as MessageModel;

        // ignore: unnecessary_null_comparison
        if (message == null) {
          throw ('Message is null');
        }

        if (message.tipAmount == null || message.tipAmount!.isEmpty) {
          return RouterPathProvider.tipScreen;
        }
        if (message.signature == null || message.signature!.isEmpty) {
          return RouterPathProvider.signatureScreen;
        }

        if (message.receiptType == null || message.receiptType!.isEmpty) {
          return RouterPathProvider.receiptScreen;
        }

        return RouterPathProvider.doneTipScreen;
      },
    ),
  ],
);
