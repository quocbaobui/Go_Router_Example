import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_demo/models/message_model.dart';
import 'package:go_router_demo/routes/router_provider.dart';
import 'package:go_router_demo/routes/routers.dart';

import 'notifier/message_notifier.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp.router(routerConfig: goRouters)));
}

class CaseTest {
  static List<String> title = [
    'Tip Screen',
    'Signature Screen',
    'Receipt Screen'
  ];
  final List<bool> enbaleScreen;
  CaseTest(this.enbaleScreen);
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CaseTest> lstCase = [
      CaseTest([true, true, true]),
      CaseTest([true, true, false]),
      CaseTest([true, false, true]),
      CaseTest([true, false, false]),
      CaseTest([false, true, true]),
      CaseTest([false, false, true]),
      CaseTest([false, false, false]),
    ];

    MessageModel getMessageCase(CaseTest caseScreen) {
      var message = MessageModel.exmapleMesssage();
      for (var i = 0; i < caseScreen.enbaleScreen.length; i++) {
        if (caseScreen.enbaleScreen[i]) {
          switch (i) {
            case 0:
              message = message.copyWith(tipAmount: '');
              break;
            case 1:
              message = message.copyWith(signature: '');
              break;
            case 2:
              message = message.copyWith(receiptType: '');
              break;
            default:
          }
        }
      }
      return message;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Go Router Test'),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: lstCase.length,
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
              );
            },
            itemBuilder: (context, index) {
              final testCase = lstCase[index];
              return InkWell(
                onTap: () {
                  print("Run");
                  final message = getMessageCase(testCase);
                  ref.read(messageProvider.notifier).state = message;
                  context.goNamed(RouterNameProvider.tipFlow, extra: message);
                  // context.goNamed(RouterNameProvider.signatureScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ...CaseTest.title.map(
                            (e) => Expanded(
                              child: Center(child: Text(e)),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            ...testCase.enbaleScreen.map((e) => Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: e ? Colors.green : Colors.red,
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  width: 15,
                                  height: 15,
                                )))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })

        // floatingActionButton: FloatingActionButton(
        //   child: const Icon(Icons.abc),
        //   onPressed: () {
        //     context.goNamed("/tipFlow", queryParams: getMessageCase().toMap());
        //   },
        // ),
        );
  }
}

class BodyWidget extends StatelessWidget {
  final VoidCallback? onTapBack;
  final VoidCallback? onTapNext;
  final String? btnBackTitle;
  final String? btnNextTitle;
  final String? data;
  const BodyWidget(
      {super.key,
      this.onTapBack,
      this.onTapNext,
      this.btnBackTitle,
      this.btnNextTitle,
      this.data});

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Center(child: Text('The location is ${state.location}')),
          // ),
          if (data != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(data!)),
            ),
          if (onTapBack != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(size.width * 0.6, kToolbarHeight)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () => onTapBack?.call(),
                  child: Text(btnBackTitle ?? 'Back')),
            ),
          if (onTapNext != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        Size(size.width * 0.6, kToolbarHeight)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () => onTapNext?.call(),
                  child: Text(btnNextTitle ?? 'Next')),
            )
        ],
      ),
    );
  }
}
