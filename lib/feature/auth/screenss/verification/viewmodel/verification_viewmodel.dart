import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../constants.dart';

part 'verification_viewmodel.g.dart';

class VerificationVM = _VerificationVMBase with _$VerificationVM;

abstract class _VerificationVMBase with Store {
  @observable
  String lottiePath = VerificationConstants.nonVerifiedLottie;

  @action
  void changePath() {
    lottiePath = VerificationConstants.verifiedLottie;
  }

  @action
  Future<void> checkEmailVerification(
      BuildContext context, User user, Timer timer) async {
    // ignore: parameter_assignments
    user = FirebaseAuth.instance.currentUser!;
    await user.reload();
    if (user.emailVerified) {
      changePath();
      timer.cancel();
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, "/home");
      });
    }
  }
}
