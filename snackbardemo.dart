import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SnackBarDemo extends StatefulWidget {
  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Snack Bar',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SNACK BAR EXAMPLE",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 15, bottom: 15),
                backgroundColor: Colors.pink,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: SnackBar_Widget(
                    msgTittle: 'Server Error',
                    msgBody:
                        'Server is down due to migration of data to a new server. It will be back in the next 12 hour',
                    iconData: Icons.error,
                    color: Colors.green,
                    press: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                  behavior: SnackBarBehavior.floating,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  duration: const Duration(minutes: 10),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Click Me',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.6),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SnackBar_Widget extends StatelessWidget {
  const SnackBar_Widget({
    Key? key,
    required this.msgTittle,
    required this.msgBody,
    required this.iconData,
    required this.press,
    this.color = Colors.red,
  }) : super(key: key);
  final String msgTittle;
  final String msgBody;
  final IconData iconData;
  final VoidCallback press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 19,
          shadowColor: Colors.blue[600],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
                //  color: Colors.blue[600],
                image: const DecorationImage(
                    image: AssetImage('assets/images/bubble.jpg'),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    iconData,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(msgTittle,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(msgBody,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                InkWell(
                    onTap: press,
                    child: const Text(
                      "Dismiss",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 10,
          child: Image.asset(
            'assets/images/drop.png',
            //color: Colors.blue[600],
            height: 50,
            width: 50,
          ),
        ),
      ],
    );
  }
}
