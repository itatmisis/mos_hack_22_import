import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/widgets/mch_textfield.dart';

class CatalogPageSlider extends StatefulWidget {

  CatalogPageSlider({super.key});

  @override
  State<CatalogPageSlider> createState() => _CatalogPageSliderState();
}

class _CatalogPageSliderState extends State<CatalogPageSlider> {

  double _startValue = 0, _endValue = 450000;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          min: 0.0,
          max: 450000.0,
          values: RangeValues(_startValue, _endValue),
          onChanged: (values) {
            setState(() {
              _startValue = values.start;
              _endValue = values.end;
            });
          },
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: SizedBox(
                height: 40,
                child: MCHTextField(),
              ),
            ),
            Expanded(

              child: SizedBox(),
            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: 40,
                child: MCHTextField(),
              )
            )
          ],
        )
      ],
    );
  }
}