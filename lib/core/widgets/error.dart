import 'package:flutter/cupertino.dart';

class Error extends StatelessWidget {
  const Error({
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
