import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final VoidCallback callback;
  final Widget child;
  final int index;

  const DetailScreen({
    super.key,
    required this.callback,
    required this.child, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic hero Animation")),
      body: Center(
        child: Hero(
          tag: "Hero$index",
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}
