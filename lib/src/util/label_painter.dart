import 'package:flutter/widgets.dart' as widgets
    show TextStyle, TextSpan, TextPainter;
import 'package:flutter/material.dart' as material show Colors;
import 'dart:ui' as ui;
import 'package:flutter_charts/src/chart/options.dart';

/// Provides ability to paint individual elements
/// of the chart: Labels, Axis, Titles.
///
class LabelPainter {
  /// Options allow to configure certain sizes, colors, and layout.
  ChartOptions _options;

  LabelPainter({ChartOptions options}) {
    _options = options;
  }

  /// Paints the passed string using a [widgets.TextPainter].
  ///
  /// For the passed string , obtains a new TextPainter that can be used
  /// both for measuring and drawing.
  ///
  /// For the measured values to correspond the drawn sizes,
  /// all size related styling is included.
  ///
  /// Returns a layed-out `textPainter` instance of [widgets.TextPainter],
  /// which can paint itself on `canvas`, with top-left position at `offset`,
  /// using `textPainter.paint(canvas, offset)`.
  widgets.TextPainter textPainterForLabel(String string) {
    var text = new widgets.TextSpan(
      text: string,
      style: _options.labelTextStyle, // All labels share one style object
    );
    var textPainter = new widgets.TextPainter(
      text: text,
      textDirection: _options.labelTextDirection,
      textAlign: _options.labelTextAlign, // center text in available space
      textScaleFactor: _options.labelTextScaleFactor,
    ); //  textScaleFactor does nothing ??

    textPainter.layout(); // minWidth:100.0, maxWidth: 300.0

    return textPainter;
  }
}
