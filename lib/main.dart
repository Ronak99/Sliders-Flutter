import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SliderContainer(),
        ),
      ),
    );
  }
}

class SliderContainer extends StatefulWidget {
  @override
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  static double _lowerValue = 0.0;
  static double _upperValue = 10.0;

  double brightness = 0.0;

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
        min: 0.0,
        max: 1.0,
        value: values,
        onChanged: (val) {
          
          setState(() {
            brightness = val;
          });
        },
      ),
    );
  }
}
