import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/profile_screen/add_product/add_box/add_box_segment.dart';
import 'package:moscow_city_hack_web/widgets/buttons/mch_button.dart';

import 'add_box_controller.dart';


class AddBox extends StatefulWidget {

  late AddBoxController controller;

  AddBox({super.key, AddBoxController? controller}) {
    this.controller = controller?? AddBoxController();
  }

  @override
  State<AddBox> createState() => _AddBoxState();
}

class _AddBoxState extends State<AddBox> {

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.controller.values.length,
      itemBuilder: (c, i) {
        return Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: AddBoxSegment(
                    onSpec: (s) {
                      widget.controller.values[i].spec = s;
                    },
                    onValue: (s) {
                      widget.controller.values[i].value = s;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: i == widget.controller.values.length-1? SizedBox(
                    height: 60,
                    child: MCHButton(onPressed: () {
                      widget.controller.values.add(AddBoxPair('', ''));
                      setState((){});
                    }, text: 'Добавить характеристику', color: Styles.cardCallButton, textColor: Styles.greenTextColor,),
                  ) : SizedBox(height: 60,),
                )
              )
            ],
          ),
        );
      },
    );
  }
}