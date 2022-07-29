import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late DateTime _dateTime;
  final String _justBigText =
      'Unlimited travel as all National Expresses West Midlands and National Expresses buses are everywhere within the zone. If I forgot anything that please add that part as well. Thank you!';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _controller.repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    _dateTime = ModalRoute.of(context)!.settings.arguments as DateTime;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 65,
              child: Row(
                children: [
                  const Spacer(),
                  _textButton(label: 'Close', onTap: (() {}))
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(builder: (context, constraints) {
                return Card(
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Column(children: [
                      Container(
                        color: Colors.red,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text('Group Daysaver Tickets Group'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.84,
                        child: ListView(children: [
                          Container(
                            height: 320,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 120,
                                    child: Stack(
                                      children: [
                                        Row(children: [
                                          Expanded(
                                            child: Container(
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                          Expanded(
                                              child: Container(
                                            color: Colors.purple,
                                          )),
                                          Expanded(
                                              child: Container(
                                            color: Colors.orangeAccent,
                                          ))
                                        ]),
                                        AnimatedBuilder(
                                            animation: _controller,
                                            builder: (context, snapshot) {
                                              return Positioned(
                                                top: 15,
                                                left: 8 +
                                                    _controller.value *
                                                        constraints.maxWidth *
                                                        0.5,
                                                child: RichText(
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,
                                                  textScaleFactor: 2,
                                                  text: TextSpan(
                                                    text:
                                                        '${DateFormat.Hms().format(_dateTime)}\n',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: DateFormat.yMd()
                                                              .format(
                                                                  _dateTime),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(Icons.open_in_new),
                                  Text('NX Rewards Cashback')
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    textAlign: TextAlign.center, _justBigText),
                              )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AnimatedBuilder(
                                animation: _controller,
                                builder: (context, child) {
                                  return Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      FadeTransition(
                                        opacity: Tween(begin: 1.0, end: 0.0)
                                            .animate(CurvedAnimation(
                                                parent: _controller,
                                                curve:
                                                    const Interval(0.0, 0.5))),
                                        child: Image.asset(
                                          'assets/qr_code_2.png',
                                          key: const Key('2'),
                                          height: 160,
                                        ),
                                      ),
                                      FadeTransition(
                                        opacity: _controller,
                                        child: Image.asset(
                                          'assets/qr_code_1.png',
                                          key: const Key('1'),
                                          height: 160,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ]),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          _textButton(label: 'Actions', onTap: () {}),
                          const Spacer(),
                          _textButton(label: 'Details', onTap: () {})
                        ],
                      )
                    ]),
                  ),
                );
              }),
            )
          ],
        ),
      )),
    );
  }

  TextButton _textButton({required String label, required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
