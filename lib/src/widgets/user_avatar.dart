import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shaimaa_fudiyo/src/models/user_model.dart';

int _avatarColorIndex;

class UserAvatar extends StatelessWidget {
  final UserModel user;

  const UserAvatar(this.user);

  @override
  Widget build(BuildContext context) {
    final length = Colors.primaries.length;
    if (_avatarColorIndex == null) {
      final random = Random();
      _avatarColorIndex = random.nextInt(length);
    }
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.primaries.elementAt(_avatarColorIndex),
      ),
      child: Center(
        child: Text(
          user.name.substring(0, 1).toUpperCase(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
