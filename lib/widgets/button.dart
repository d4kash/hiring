import 'package:flutter/material.dart';
import 'package:hiring/Constants/constants.dart';

class MyWidget extends StatelessWidget {
  final text = "VERIFY";

  const MyWidget({Key? key, required text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constant.height / 70,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 8.0,
                  spreadRadius: 2.0)
            ]),
        child: Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                    width: 48.0,
                    height: 48.0,
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: const Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.settings))),
                Expanded(
                    child: Center(
                  child: Text(text,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.black)),
                )),
              ],
            ),
            // SizedBox.expand(
            //   child: Material(
            //     type: MaterialType.transparency,
            //     child: InkWell(onTap: () {}),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
