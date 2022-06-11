import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/model/styles.dart';


class PicturesPicker extends StatefulWidget {

  List<String> urls;

  PicturesPicker({super.key, required this.urls});

  @override
  State<PicturesPicker> createState() => _PicturesPickerState();
}

class _PicturesPickerState extends State<PicturesPicker> {

  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.urls.length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    current = i;
                  });
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: current != i? Colors.white: Styles.accentColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 8,),
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.only(top: 2),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}