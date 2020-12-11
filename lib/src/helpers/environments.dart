

import 'package:flutter/foundation.dart';

const _NICE_APP_KEY = '123';
const _NICE_APP_SECRET = '321';

const uiDebugView = kDebugMode ? false : false;

class Config {
  final String appKey;
  final String appSecret;


  const Config(this.appKey, this.appSecret);
}


