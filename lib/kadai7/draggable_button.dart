import 'package:flutter/cupertino.dart';

class DraggableButton extends StatefulWidget {
  const DraggableButton({
    super.key,
    required this.childWidget,
    required this.initialOffset,
    required this.onPressed,
  });
  final Widget childWidget;
  final Offset initialOffset;
  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() => _DraggableButtonState();
}

class _DraggableButtonState extends State<DraggableButton> {
  bool _isDragging = false;
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = widget.initialOffset;
  }

  void _updatePosition(PointerMoveEvent pointerMoveEvent) {
    final newOffsetX = _offset.dx + pointerMoveEvent.delta.dx;
    final newOffsetY = _offset.dy + pointerMoveEvent.delta.dy;

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
        child: widget.childWidget,
      ),
    );
  }
}
