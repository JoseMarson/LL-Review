import 'package:flutter_modular/flutter_modular.dart';
import 'review_page.dart';

class ModalModule extends Module {
  @override
  void routes(r) {
    r.child('/review', child: (context) => const ReviewPage());
  }
}
