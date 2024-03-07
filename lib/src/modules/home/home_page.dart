import 'package:flutter/material.dart';
import 'widgets/app_bar_widget.dart';
import '../review/review_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(
            barrierColor: Colors.black.withOpacity(0.4),
            context: context,
            builder: (_) => ReviewPage(),
          ),
          child: const Text('Abrir Janela Modal'),
        ),
      ),
    );
  }
}
