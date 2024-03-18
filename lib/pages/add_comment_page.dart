import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_app/model/transport_item.dart';
import 'package:transport_app/model/user.dart';
import 'package:transport_app/pages/greeting_page.dart';
import 'package:transport_app/pages/add_new_transport.dart';
import 'package:transport_app/pages/home_page.dart';

class RentfyNews extends StatelessWidget {
  final String news;

  const RentfyNews({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(news)),
        ),
      ),
    );
  }
}

class AddCommentPage extends StatefulWidget {
  const AddCommentPage({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  TextEditingController commentController = TextEditingController();
  List<EState> types = [EState.perfect, EState.average, EState.bad];
  EState selected = EState.perfect;
  @override
  void initState() {
    super.initState();
    if (widget.isEdit && editTransport.comment != null) {
      commentController.text = editTransport.comment!;
      selected = editTransport.state!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1F23),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                      color: Color(0xFF7089E1),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Color(0xFF7089E1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (!widget.isEdit) {
                      if (commentController.text.isNotEmpty) {
                        transport.comment = commentController.text;
                      }
                      transport.state = selected;
                      transports.add(transport);
                      addToSP();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                      );
                    } else {
                      editTransport.comment = commentController.text;
                      editTransport.state = selected;
                      transports.removeWhere(
                          (element) => element.id == editTransport.id);
                      transports.add(editTransport);
                      addToSP();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomePage()),
                      );
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFF7082E1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'New transport',
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Row(
                  children: [
                    Text(
                      'Write a comment on the transport',
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
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  maxLines: 4,
                  cursorColor: Colors.grey,
                  controller: commentController,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.25)),
                    filled: true,
                    fillColor: const Color(0xFF2E313C),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (text) {
                    commentController.text = text;
                    setState(() {});
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Row(
                  children: [
                    Text(
                      'State of transportation',
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: getTypes(),
              )
            ],
          )),
        )
      ]),
    );
  }

  Widget getTypes() {
    List<Widget> list = [];
    for (var type in types) {
      list.add(Expanded(
        child: InkWell(
          onTap: () {
            selected = type;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(0xFF2E313C),
                border: Border.all(
                    color: selected == type
                        ? const Color(0xFF7089E1)
                        : Colors.transparent,
                    width: 1),
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  type.text,
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: selected == type
                          ? const Color(0xFF7089E1)
                          : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ));
      list.add(const SizedBox(
        width: 8,
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }
}

Future<void> addToSP() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('transports', jsonEncode(transports));
  prefs.setString('user', jsonEncode(user));
}

void getSP(Function() callBack) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString('user') != null) {
    Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
    user = UserItem.fromJson(userMap);
  }
  final List<dynamic> jsonData1 =
      jsonDecode(prefs.getString('transports') ?? '[]');

  transports = jsonData1.map<TransportItem>((jsonList) {
    {
      return TransportItem.fromJson(jsonList);
    }
  }).toList();

  callBack();
}
