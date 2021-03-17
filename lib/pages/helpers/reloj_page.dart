import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class RelojPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              TimeRange result = await showTimeRangePicker(
                context: context,
                labels: [
                  "12 pm",
                  "3 am",
                  "6 am",
                  "9 am",
                  "12 am",
                  "3 pm",
                  "6 pm",
                  "9 pm"
                ].asMap().entries.map((e) {
                  return ClockLabel.fromIndex(
                      idx: e.key, length: 8, text: e.value);
                }).toList(),
                labelOffset: 35,
                rotateLabels: false,
                padding: 55,
              );
              if (result != null) {
                print('hora ' + result.startTime.format(context));
                print('horario ' + result.startTime.toString());
                print("result " +
                    result.startTime.hour.toString() +
                    ':' +
                    result.startTime.minute.toString());
              }
            },
            child: Text("Pure"),
          ),
        ));
  }
}
