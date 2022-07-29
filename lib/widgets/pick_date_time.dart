import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sample_animation/utils/style.dart';

import 'platform_button.dart';

class PickDateTime extends StatefulWidget {
  final DateTime defaultTime;
  final Function(DateTime) onChanged;

  const PickDateTime(
      {Key? key, required this.onChanged, required this.defaultTime})
      : super(key: key);

  @override
  PickDateTimeState createState() => PickDateTimeState();
}

class PickDateTimeState extends State<PickDateTime> {
  late DateTime activeTime;

  @override
  void initState() {
    activeTime = widget.defaultTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: PlatformFlatButton(
                  handler: () => presentTimePicker(context, activeTime),
                  buttonChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat.Hm().format(activeTime),
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'ProximaNova',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.access_time_filled,
                        size: 38,
                        color: Colors.white,
                      )
                    ],
                  ),
                  color: yellow700Swatch,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                child: PlatformFlatButton(
                  handler: () => _pickDate(context),
                  buttonChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd/MM').format(activeTime),
                        style: const TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'ProximaNova',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.date_range,
                        size: 38,
                        color: Colors.white,
                      )
                    ],
                  ),
                  color: yellow700Swatch,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pickDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now().add(const Duration(days: 30)))
        .then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          activeTime = pickedDate;
          presentTimePicker(context, pickedDate);
        });
      }
    });
  }

  void presentTimePicker(BuildContext context, DateTime pickedDate) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((chosen) {
      if (chosen != null) {
        setState(() {
          final finalDate = DateTime(pickedDate.year, pickedDate.month,
              pickedDate.day, chosen.hour, chosen.minute);
          activeTime = finalDate;
          widget.onChanged(finalDate);
        });
      }
    });
  }
}
