import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/color_manage.dart';
import 'package:flutter_application_1/core/componant/big_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpandableTextWidget extends StatefulWidget {
  String text;
  ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstText;
  late String secondText;
  bool textHeddin = true;
  double textheigh = 200;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textheigh) {
      firstText = widget.text.substring(0, textheigh.toInt());
      secondText =
          widget.text.substring(textheigh.toInt() + 1, widget.text.length);
    } else {
      firstText = widget.text;
      secondText = '';
    }
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: secondText.isEmpty
            ? SmallText(text: firstText)
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    textHeddin
                        ? SmallText(
                            text: firstText + "...",
                            size: 15,
                            color: ColorManage.paraColor,
                          )
                        : SmallText(
                            text: firstText + secondText,
                            size: 15,
                            color: ColorManage.paraColor,
                          ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          textHeddin = !textHeddin;
                        });
                      },
                      child: Container(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SmallText(
                                text: 'show more',
                                color: ColorManage.Primary,
                              ),
                              Icon(
                                textHeddin
                                    ? Icons.arrow_drop_down
                                    : Icons.arrow_drop_up,
                                color: ColorManage.Primary,
                              ),
                            ]),
                      ),
                    )
                  ]),
      ),
    );
  }
}
