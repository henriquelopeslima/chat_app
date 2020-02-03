// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_composer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TextComposerController on _TextComposerBase, Store {
  final _$textAtom = Atom(name: '_TextComposerBase.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
  }

  final _$isComposingAtom = Atom(name: '_TextComposerBase.isComposing');

  @override
  bool get isComposing {
    _$isComposingAtom.context.enforceReadPolicy(_$isComposingAtom);
    _$isComposingAtom.reportObserved();
    return super.isComposing;
  }

  @override
  set isComposing(bool value) {
    _$isComposingAtom.context.conditionallyRunInAction(() {
      super.isComposing = value;
      _$isComposingAtom.reportChanged();
    }, _$isComposingAtom, name: '${_$isComposingAtom.name}_set');
  }

  final _$sendMessageAsyncAction = AsyncAction('sendMessage');

  @override
  Future<dynamic> sendMessage() {
    return _$sendMessageAsyncAction.run(() => super.sendMessage());
  }

  final _$_TextComposerBaseActionController =
      ActionController(name: '_TextComposerBase');

  @override
  void changeText(String txt) {
    final _$actionInfo = _$_TextComposerBaseActionController.startAction();
    try {
      return super.changeText(txt);
    } finally {
      _$_TextComposerBaseActionController.endAction(_$actionInfo);
    }
  }
}
