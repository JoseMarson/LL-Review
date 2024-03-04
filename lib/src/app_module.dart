import 'package:flutter_modular/flutter_modular.dart';
import 'package:locallog_client_reviw/src/modules/home/home_page.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => HomePage());
  }
}
