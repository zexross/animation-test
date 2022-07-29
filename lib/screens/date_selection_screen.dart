import 'package:flutter/material.dart';
import 'package:sample_animation/screens/home_screen.dart';
import 'package:sample_animation/utils/style.dart';
import 'package:sample_animation/widgets/pick_date_time.dart';
import 'package:sample_animation/widgets/platform_button.dart';

class DateSelectionScreen extends StatefulWidget {
  const DateSelectionScreen({Key? key}) : super(key: key);

  @override
  State<DateSelectionScreen> createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  DateTime dateTime = DateTime.now();

  void _onDateTimePick(DateTime pickedDateTime) {
    dateTime = pickedDateTime;
  }

  void _navigateToHomePage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: RouteSettings(arguments: dateTime)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            dateTimePickInstruction(),
            PickDateTime(onChanged: _onDateTimePick, defaultTime: dateTime),
            submitButton()
          ]),
        ),
      ),
    );
  }

  Padding submitButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: PlatformFlatButton(
          buttonChild: Container(
            padding: const EdgeInsets.all(12),
            child: const Text(
              'Submit',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          color: yellow700Swatch,
          handler: _navigateToHomePage),
    );
  }

  Padding dateTimePickInstruction() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Please Pick date & time:',
        style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
    );
  }
}
