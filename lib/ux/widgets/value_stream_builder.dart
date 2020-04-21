import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:watchlist/ux/ux_utils.dart';

class ValueStreamBuilder<T> extends StatelessWidget {
  const ValueStreamBuilder({
    Key key,
    @required this.valueStream,
    @required this.builder,
  }) : super(key: key);

  final ValueStream<T> valueStream;
  final ContextValueBuilder<T> builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: valueStream,
      initialData: valueStream.value,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // ignore: only_throw_errors
          throw snapshot.error;
        }
        return builder(context, snapshot.data);
      },
    );
  }
}
