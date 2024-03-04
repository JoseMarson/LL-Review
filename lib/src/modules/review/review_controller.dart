import 'package:mobx/mobx.dart';

part 'review_controller.g.dart';

class ReviewController = _ReviewController with _$ReviewController;

abstract class _ReviewController with Store {
  @observable
  double rating = 0.0;

  @observable
  ObservableList<String> selectedOptions = ObservableList<String>();

  @computed
  bool get canSubmitReview => rating > 0.0;

  @action
  void setRating(double value) {
    rating = value;
  }

  @action
  void toggleOption(String option) {
    if (selectedOptions.contains(option)) {
      selectedOptions.remove(option);
    } else {
      selectedOptions.add(option);
    }
  }
}
