class RouterNameProvider {
  static String login = 'login';
  static String home = 'home';
  static String tipFlow = 'tipFlow';

  static String tipScreen = 'tipScreen';
  static String signatureScreen = 'tipFlowSignature';
  static String receiptScreen = 'tipFlowReceipt';
  static String doneTipScreen = 'tipFlowDone';
}

class RouterPathProvider {
  static String login = '/loginScreen';
  static String home = '/homeScreen';
  static String tipFlow = '/tipFlow';
  static String tipScreen = '/tipScreen';
  static String signatureScreen = '/signatureScreen';
  static String receiptScreen = '/receiptScreen';
  static String doneTipScreen = '/doneTipScreen';
}

String getRouteSub(String name, String path) => '$name$path';
