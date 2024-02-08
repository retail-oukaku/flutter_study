import 'dart:developer';

import 'package:flutter/cupertino.dart';

class DraggableButton extends StatefulWidget {
  const DraggableButton({
    super.key,
    required this.childWidget,
    required this.initialOffset,
    required this.onPressed,
    required this.parentKey,
  });
  final Widget childWidget;
  final Offset initialOffset;
  final VoidCallback onPressed;
  final GlobalKey parentKey;

  @override
  State<StatefulWidget> createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  final GlobalKey _key = GlobalKey();

  bool _isDragging = false;
  late Offset _offset;
  late Offset _minOffset;
  late Offset _maxOffset;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;

    /// builded‘s callback
    WidgetsBinding.instance.addPostFrameCallback(_setBoundary);
  }

  ///
  _setBoundary(_) {
    _setAsyncBoundary();
  }

  void _setAsyncBoundary() async {
    /// 画面加载完成
    log('画面加载完成');
    final parentRenderBox =
        widget.parentKey.currentContext!.findRenderObject()! as RenderBox;
    final renderBox = _key.currentContext!.findRenderObject()! as RenderBox;

    log(parentRenderBox.size.width.toString());
    log(renderBox.size.width.toString());
    try {
      final parentSize = parentRenderBox.size;
      final size = renderBox.size;

      setState(() {
        _minOffset = Offset.zero;
        _maxOffset = Offset(
          parentSize.width - size.width,
          parentSize.height - size.height,
        );
      });
    } on Exception catch (e) {
      log('catch: $e');
    }
  }

  void _updatePosition(PointerMoveEvent pointerMoveEvent) {
    var newOffsetX = _offset.dx + pointerMoveEvent.delta.dx;
    var newOffsetY = _offset.dy + pointerMoveEvent.delta.dy;

    if (newOffsetX < _minOffset.dx) {
      newOffsetX = _minOffset.dx;
    } else if (newOffsetX > _maxOffset.dx) {
      newOffsetX = _maxOffset.dx;
    }

    if (newOffsetY < _minOffset.dy) {
      newOffsetY = _minOffset.dy;
    } else if (newOffsetY > _maxOffset.dy) {
      newOffsetY = _maxOffset.dy;
    }

    setState(() {
      _offset = Offset(newOffsetX, newOffsetY);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Listener(
        onPointerMove: (PointerMoveEvent pointerMoveEvent) {
          _updatePosition(pointerMoveEvent);

          setState(() {
            _isDragging = true;
          });
        },
        onPointerUp: (PointerUpEvent pointerUpEvent) {
          if (_isDragging) {
            setState(() {
              _isDragging = false;
            });
          } else {
            widget.onPressed();
          }
        },
        child: Container(
          key: _key,
          child: widget.childWidget,
        ),
      ),
    );
  }
}
