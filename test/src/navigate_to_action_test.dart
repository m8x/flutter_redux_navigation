import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should pass the NavigationType.shouldPop and no route name', () {
    var action = NavigateToAction.pop();
    expect(action.type, NavigationType.shouldPop);
    expect(action.name, isEmpty);
  });

  test('should pass the NavigationType.shouldPopUntil and no route name', () {
    var action = NavigateToAction.popUntil(predicate: (_) => false);
    expect(action.type, NavigationType.shouldPopUntil);
    expect(action.name, isEmpty);
  });

  test('should pass the NavigationType.shouldReplace and route name', () {
    var action = NavigateToAction.replace('name');
    expect(action.type, NavigationType.shouldReplace);
    expect(action.name, 'name');
  });

  test('should pass the NavigationType.shouldPush and route name', () {
    var action = NavigateToAction.push('name');
    expect(action.type, NavigationType.shouldPush);
    expect(action.name, 'name');
  });

  test('should have a default type of NavigationType.shouldPush', () {
    var action = NavigateToAction('name');
    expect(action.type, NavigationType.shouldPush);
  });

  test(
      'should throw AssertionError if the route name is empty on NavigationType.shouldPush',
      () {
    expect(() => NavigateToAction(''), throwsAssertionError);
  });

  test(
      'should throw AssertionError if the route name is empty on NavigationType.shouldReplace',
      () {
    expect(() => NavigateToAction('', type: NavigationType.shouldReplace),
        throwsAssertionError);
  });

  test('should allow empty route name on NavigationType.shouldPop', () {
    expect(
        () => NavigateToAction('', type: NavigationType.shouldPop), isNotNull);
  });

  test('should allow empty route name on NavigationType.shouldPopUntil', () {
    expect(
        () => NavigateToAction('',
            type: NavigationType.shouldPopUntil, predicate: (_) => false),
        isNotNull);
  });

  test(
      'should throw AssertionError if the route name is empty or predicate is null on NavigationType.pushNamedAndRemoveUntil',
      () {
    expect(
        () => NavigateToAction('',
            type: NavigationType.shouldPushNamedAndRemoveUntil),
        throwsAssertionError);
    expect(
        () => NavigateToAction('name',
            type: NavigationType.shouldPushNamedAndRemoveUntil),
        throwsAssertionError);
  });

  test(
      'should throw AssertionError if the predicate is empty on NavigationType.popUntil',
      () {
    expect(() => NavigateToAction('', type: NavigationType.shouldPopUntil),
        throwsAssertionError);
  });
}
