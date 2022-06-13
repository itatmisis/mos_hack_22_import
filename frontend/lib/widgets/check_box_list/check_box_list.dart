import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';
import 'package:moscow_city_hack_web/widgets/text_fields/mch_textfield.dart';

class CheckBoxList extends StatefulWidget {

  List<String> data;
  CheckBoxList({Key? key, required this.data}) : super(key: key);

  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {

  List checked = [];


  @override
  void initState() {
    checked = List.generate(widget.data.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(
        //   height: 40,
        //   child: MCHTextField(),
        // ),
        //SizedBox(height: 10,),
        Expanded(
          child: ListView.builder(
              controller: ScrollController(),
              itemCount: widget.data.length,
              itemBuilder: (b, i) {
                return Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: checked[i],
                      onChanged: (bool? value) {
                        setState(() {
                          checked[i] = checked[i] == false;
                        });
                      },
                    ),
                    Text(
                        widget.data[i]
                    )
                  ],
                );
              }
          ),
        )
      ],
    );
  }
}