import 'dart:developer';

import 'package:flutter/foundation.dart';

void showLog(String flag, dynamic content) {
  if (kDebugMode) {
    log('${DateTime.now()} === $flag\n$content\n');
  }
}
