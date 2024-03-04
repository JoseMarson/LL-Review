import 'package:flutter/material.dart';
import 'package:locallog_client_reviw/src/modules/home/widgets/app_bar_widget.dart';
import 'package:locallog_client_reviw/src/modules/review/review_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              barrierColor: Colors.black.withOpacity(0.4),
              context: context,
              builder: (BuildContext context) {
                return ReviewPage();
              },
            );
          },
          child: Text('Abrir Janela Modal'),
        ),
      ),
    );
  }
}
