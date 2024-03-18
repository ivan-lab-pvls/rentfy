import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transport_app/model/user.dart';
import 'package:transport_app/pages/add_comment_page.dart';
import 'package:transport_app/pages/home_page.dart';

UserItem user = UserItem();

class AcquaintancePage extends StatefulWidget {
  const AcquaintancePage({super.key});

  @override
  State<AcquaintancePage> createState() => _AcquaintancePageState();
}

class _AcquaintancePageState extends State<AcquaintancePage> {
  TextEditingController controller = TextEditingController();
  List<ECarsCount> types = [
    ECarsCount.fisrt,
    ECarsCount.second,
    ECarsCount.third
  ];
  ECarsCount selected = ECarsCount.fisrt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1F23),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 65, 16, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Let’s start',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'What brand of car do you prefer?',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: TextField(
                    cursorColor: Colors.grey,
                    controller: controller,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Your name',
                      hintStyle: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.25)),
                      filled: true,
                      fillColor: const Color(0xFF2E313C),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (text) {
                      controller.text = text;
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'How many cars did you own?',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: getTypes(),
                )
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            child: InkWell(
              onTap: () {
                if (controller.text.isNotEmpty) {
                  user.brandName = controller.text;
                  user.type = selected;
                  addToSP();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(17),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: controller.text.isNotEmpty
                        ? const Color(0xFF7089E1)
                        : const Color(0xFF7089E1).withOpacity(0.7)),
                child: Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: controller.text.isNotEmpty
                          ? Colors.white
                          : Colors.white.withOpacity(0.25),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getTypes() {
    List<Widget> list = [];
    for (var type in types) {
      list.add(InkWell(
        onTap: () {
          selected = type;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
              color: const Color(0xFF2E313C),
              border: Border.all(
                  color: selected == type
                      ? const Color(0xFF7089E1)
                      : Colors.transparent,
                  width: 1),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type.text,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ));
      list.add(const SizedBox(
        height: 8,
      ));
    }
    return Column(
      children: list,
    );
  }
}
