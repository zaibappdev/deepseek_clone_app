import 'package:flutter/material.dart';

class CircularCheckboxWidget extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CircularCheckboxWidget({
    super.key,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  State<CircularCheckboxWidget> createState() => _CircularCheckboxWidgetState();
}

class _CircularCheckboxWidgetState extends State<CircularCheckboxWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void _toggle() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: isChecked
            ? const Icon(Icons.check, color: Colors.white, size: 16)
            : null,
      ),
    );
  }
}
