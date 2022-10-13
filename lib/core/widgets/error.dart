import 'package:flutter/cupertino.dart';

class ErrorShowWidget extends StatelessWidget {
  const ErrorShowWidget({
    super.key,
    required this.errorMsg,
  });
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMsg,
      ),
    );
  }
}
