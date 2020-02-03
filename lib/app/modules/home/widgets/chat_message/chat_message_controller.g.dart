// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatMessageController on _ChatMessageBase, Store {
  final _$valueAtom = Atom(name: '_ChatMessageBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_ChatMessageBaseActionController =
      ActionController(name: '_ChatMessageBase');

  @override
  void increment() {
    final _$actionInfo = _$_ChatMessageBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_ChatMessageBaseActionController.endAction(_$actionInfo);
    }
  }
}
