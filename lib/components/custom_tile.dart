// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String companyAddress;
  final String jobInfo;
  final String jobPay;
  final String jobTitle;
  final String jobHours;
  final String jobDate;
  final String jobShiftTime;

  const CustomTile(
      {Key? key,
      required this.companyLogo,
      required this.companyName,
      required this.companyAddress,
      required this.jobInfo,
      required this.jobPay,
      required this.jobTitle,
      required this.jobHours,
      required this.jobDate,
      required this.jobShiftTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 204,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(companyLogo, height: 40, width: 40),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: companyName,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 4),
                      SmallText(
                        text: companyAddress,
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(Icons.share_outlined),
                      onPressed: () {
                        print('pressed');
                      }),
                ],
              ),
              const Divider(
                color: Color(0xffA7A7A7),
                thickness: 0.1,
              ),
              Row(
                children: [
                  BigText(text: jobInfo),
                  const Spacer(),
                  BigText(text: jobPay.toString()),
                ],
              ),
              Row(
                children: [
                  Text(jobTitle),
                  const Spacer(),
                  Text(
                    '${jobHours.toString()} Hours',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xffA7A7A7),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 12),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month_outlined),
                              const SizedBox(width: 6),
                              SmallText(text: jobDate, fontSize: 13),
                            ],
                          ),
                          Row(children: [
                            const Icon(Icons.timer_outlined),
                            const SizedBox(width: 6),
                            SmallText(text: jobShiftTime, fontSize: 13),
                          ]),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                      icon: const Icon(Icons.bookmark_outline),
                      onPressed: () {
                        print('pressed');
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const SmallText({
    Key? key,
    required this.text,
    this.fontSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: const Color(0xffA7A7A7),
      ),
    );
  }
}

class BigText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const BigText({
    Key? key,
    required this.text,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
