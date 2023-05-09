import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hiring/Constants/constants.dart';
import 'package:hiring/widgets/app_bar.dart';
import 'package:carbon_icons/carbon_icons.dart';
import 'package:hiring/widgets/button.dart';
import 'package:hiring/widgets/platform.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // var info = PlatformInfo();
    // print(info.getCurrentPlatformType());
  }

  final phoneController = TextEditingController();
  final RegExp phoneRegex = RegExp(r'^[6-9]\d{9}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe7f0fd),
      appBar: const CustomAppBar(
        text: "Hiring",
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
        ),
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Constant.height / 20,
                ),
                Text(
                  "We are here to help you ,",
                  style: TextStyle(fontSize: Constant.height / 25),
                ),
                SizedBox(height: Constant.height / 40),
                Text(
                  "Verify     \n     Yourself, ",
                  style: TextStyle(
                      fontSize: Constant.height / 12,
                      color: Colors.deepOrangeAccent),
                ),
                SizedBox(height: Constant.height / 10),
                Container(
                  height: Constant.height / 6,
                  width: Constant.width / 1.5,
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    textInputAction: TextInputAction.go,
                    smartDashesType: SmartDashesType.enabled,
                    decoration: const InputDecoration(
                      prefix: Text(
                        "OTP : ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      suffixIcon: Icon(
                        CarbonIcons.checkbox_checked,
                        color: Colors.green,
                        size: 30,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'OTP',
                      hintText: 'Enter Six Digit Code',
                    ),
                  ),
                ),
                SizedBox(
                  height: Constant.height / 10,
                ),
                Container(
                  height: Constant.height / 16,
                  width: Constant.width / 3,
                  child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(CarbonIcons.checkbox_checked_filled),
                      label: const Text("DONE")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
