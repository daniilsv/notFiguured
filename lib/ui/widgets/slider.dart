import 'package:notfiguured/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    @required this.currentMin,
    @required this.onChange,
    this.currentMax,
    this.min = 0,
    this.max = 100,
    this.disabled = false,
    this.jump = false,
    Color color,
  }): _color=color??AppColors.primary;

  final double min;
  final double max;
  final double currentMin;
  final double currentMax;
  final Function(int _, dynamic low, dynamic high) onChange;
  final bool disabled;
  final bool jump;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    final plainSlider = currentMin != null && currentMax == null;
    final _handler = FlutterSliderHandler(
      decoration: const BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: _color, width: 5),
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        height: 21,
        width: 21,
      ),
    );

    /// Небольшой костылик чтобы нажатие на слайдер не нажималось
    /// вместе с [AppListTile]
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: FlutterSlider(
        values:
            plainSlider ? [currentMin ?? min] : [currentMin ?? min, currentMax ?? max],
        rangeSlider: !plainSlider,
        min: min,
        max: max,
        disabled: disabled,
        jump: jump,
        onDragging: onChange,
        handler: _handler,
        rightHandler: _handler,
        handlerAnimation: const FlutterSliderHandlerAnimation(scale: 1.1),
        trackBar: FlutterSliderTrackBar(
          activeTrackBarHeight: 6,
          inactiveTrackBarHeight: 6,
          inactiveTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.greyED,
          ),
          activeTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _color,
          ),
        ),
        touchSize: 5,
        handlerHeight: 21,
        handlerWidth: 32,
        tooltip: FlutterSliderTooltip(disabled: true),
      ),
    );
  }
}
