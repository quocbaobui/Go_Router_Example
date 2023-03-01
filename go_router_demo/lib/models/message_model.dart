import 'dart:convert';

class MessageModel {
  final String? totalAmount;
  final String? tipAmount;
  final String? signature;
  final String? receiptType;

  MessageModel(
      {this.totalAmount, this.tipAmount, this.signature, this.receiptType});

  Map<String, dynamic> toMap() {
    return {
      'tipAmount': tipAmount,
      'signature': signature,
      'receiptType': receiptType,
      'totalAmount': totalAmount,
    };
  }

  MessageModel copyWith({
    final String? totalAmount,
    final String? tipAmount,
    final String? signature,
    final String? receiptType,
  }) =>
      MessageModel(
          totalAmount: totalAmount ?? this.totalAmount,
          tipAmount: tipAmount ?? this.tipAmount,
          signature: signature ?? this.signature,
          receiptType: receiptType ?? this.receiptType);

  static MessageModel? fromMap(Map<String, dynamic>? map) {
    if (map == null) return null;
    try {
      return MessageModel(
        tipAmount: map['tipAmount'],
        signature: map['signature'],
        receiptType: map['receiptType'],
        totalAmount: map['totalAmount'],
      );
    } catch (e) {
      return null;
    }
  }

  String toJson() => json.encode(toMap());

  static MessageModel? fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  static MessageModel exmapleMesssage() => MessageModel(
        tipAmount: "10.5",
        signature: "232421sdfdsgdd",
        receiptType: "print",
        totalAmount: "125.6",
      );
}
