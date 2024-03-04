// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReviewController on _ReviewController, Store {
  Computed<bool>? _$canSubmitReviewComputed;

  @override
  bool get canSubmitReview =>
      (_$canSubmitReviewComputed ??= Computed<bool>(() => super.canSubmitReview,
              name: '_ReviewController.canSubmitReview'))
          .value;

  late final _$ratingAtom =
      Atom(name: '_ReviewController.rating', context: context);

  @override
  double get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  late final _$_ReviewControllerActionController =
      ActionController(name: '_ReviewController', context: context);

  @override
  void setRating(double value) {
    final _$actionInfo = _$_ReviewControllerActionController.startAction(
        name: '_ReviewController.setRating');
    try {
      return super.setRating(value);
    } finally {
      _$_ReviewControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rating: ${rating},
canSubmitReview: ${canSubmitReview}
    ''';
  }
}
