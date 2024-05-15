import 'package:flutter/material.dart';

import 'counter_action.dart';

class CustomFloatingButton extends StatefulWidget {
  final CounterAction _action;
  final String _tooltip;
  final Icon _icon;
  final int _counter;
  int _clickCount;

  CustomFloatingButton(this._action, this._tooltip, this._icon, this._counter,
      this._clickCount, {super.key})


  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  _CustomFloatingButtonState(CounterAction action, String tooltip, Icon icon, int counter);


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        widget._counter == 0 && widget._action == CounterAction.decrement
            ? null
            : _onClickButton(widget._action, widget._counter );
      },
      tooltip: widget._tooltip,
      child: widget._icon,
    );
  }

  void _onClickButton(CounterAction action, int counter) {
    counter = action == CounterAction.increment ? widget._counter + 1 : widget._counter - 1;
    setClickCount(action);
  }

  void setClickCount(CounterAction action) {
    action == CounterAction.increment ? widget._clickCount += 1 : widget._clickCount -= 1;
  }
}
