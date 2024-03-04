import 'package:flutter_modular/flutter_modular.dart';
import 'package:locallog_client_reviw/src/modules/review/review_page.dart';

class ModalModule extends Module {
  void routes(r) {
    r.child('/review', child: (context) => ReviewPage());
  }
}
