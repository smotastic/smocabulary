import 'package:flutter/material.dart';

abstract class Bridge<R, T> {
  R bridge(T value);
}

abstract class ContextBridge<R> extends Bridge<R, BuildContext> {}
