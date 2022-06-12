import 'package:flutter/material.dart';

class AdvWidget extends StatelessWidget {

  AdvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/city.png', fit: BoxFit.fitWidth,),
        Expanded(
          flex: 15,
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Продолжается набор в Московскую техническую школу', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                        SizedBox(height: 13,),
                        Text('Московская техническая школа - проект, призванный обеспечить продуктивное взаимодействие образовательных и промышленных организаций по вопросам подготовки и переподготовки кадров.', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}