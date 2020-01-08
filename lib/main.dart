import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BrightnessSliderContainer(),
        ),
      ),
    );
  }
}

class BrightnessSliderContainer extends StatefulWidget {
  @override
  _BrightnessSliderContainerState createState() => _BrightnessSliderContainerState();
}

class _BrightnessSliderContainerState extends State<BrightnessSliderContainer> {
  double brightness = 0.0;


  @override
  Widget build(BuildContext context) {
    return /* Slider  */ CupertinoSlider( 
        activeColor: CupertinoColors.activeGreen,
        min: 0.0,
        max: 1.0,
        value: brightness,
        onChanged: (val) {
          Screen.setBrightness(brightness);
          setState(() {
            brightness = val;
          });
        },
      );
  }
}


class RangeSliderWidget extends StatefulWidget {
  @override
  _RangeSliderWidgetState createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
   static double _lowerValue = 0.0;
  static double _upperValue = 10.0;

  RangeValues values = RangeValues(_lowerValue, _upperValue);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 15,
        overlayColor: Colors.transparent,
        minThumbSeparation: 100,
        rangeThumbShape: RoundRangeSliderThumbShape(
          enabledThumbRadius: 10,
          disabledThumbRadius: 10,
        ),
      ),
      child: RangeSlider( 
        activeColor: CupertinoColors.activeGreen,
        labels: RangeLabels(values.start.abs().toString(), values.end.abs().toString()),
        min: 0.0,
        max: 1.0,
        values: values,
        onChanged: (val) {
          setState(() {
            values = val;
          });
        },
      ),
    );
  }
}