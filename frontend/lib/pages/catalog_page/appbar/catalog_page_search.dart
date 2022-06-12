import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moscow_city_hack_web/model/styles.dart';

class CatalogPageSearch extends StatelessWidget {

  double borderRadius = 8;

  CatalogPageSearch({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3272D9), style: BorderStyle.solid),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), bottomLeft: Radius.circular(borderRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF3272D9), style: BorderStyle.solid),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), bottomLeft: Radius.circular(borderRadius)),
                  ),
                  hintText: 'Искать'
              )
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius)),
              color: Styles.accentColor,
            ),
            child: Center(
              child: SvgPicture.asset('assets/search.svg'),
            ),
          ),
        )
      ],
    );
  }
}