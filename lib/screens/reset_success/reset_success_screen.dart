import 'package:flutter/material.dart';

import 'components/body.dart';

class ResetSuccessScreen extends StatelessWidget {
  static String routeName = "/reset_success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
      ),
      body: Body(),
    );
  }
}
