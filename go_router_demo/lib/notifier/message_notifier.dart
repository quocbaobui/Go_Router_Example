import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router_demo/models/message_model.dart';

final messageProvider = StateProvider<MessageModel>((ref) {
  print("Rebuild messageProvider");
  return MessageModel.exmapleMesssage();
});
