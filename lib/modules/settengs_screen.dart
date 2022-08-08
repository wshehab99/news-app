import 'package:flutter/material.dart';

class SettignsScreen extends StatelessWidget {
  const SettignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Settigns Screen",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
