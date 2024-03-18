import 'package:flutter/material.dart';
import 'package:transport_app/model/transport_item.dart';
import 'package:transport_app/pages/add_comment_page.dart';
import 'package:transport_app/pages/add_new_transport.dart';
import 'package:transport_app/pages/home_page.dart';

class DescriptionTransportPage extends StatefulWidget {
  const DescriptionTransportPage({super.key, required this.transport});
  final TransportItem transport;

  @override
  State<DescriptionTransportPage> createState() =>
      _DescriptionTransportPageState();
}

class _DescriptionTransportPageState extends State<DescriptionTransportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1F23),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 16),
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
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              AddTransportItemPage(
                                isEdit: true,
                                editTransport: widget.transport,
                              )),
                    );
                  },
                  child: const Text(
                    'Edit',
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
                'Transport',
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
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: const Color(0xFF252730),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.transport.name!,
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Type',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'State',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Deposit',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Rental cost',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Number',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.transport.type!,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                widget.transport.state!.text,
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color:
                                        widget.transport.state == EState.perfect
                                            ? const Color(0xFFAEFFC5)
                                            : widget.transport.state ==
                                                    EState.average
                                                ? const Color(0xFFFD9F5B)
                                                : const Color(0xFFFB5050),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '${widget.transport.valueOfDeposit!.toStringAsFixed(0)}\$',
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Color(0xFF7089E1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '${widget.transport.rentalCost!.toStringAsFixed(0)}\$ hour',
                                style: const TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Color(0xFF7089E1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                widget.transport.number!.isNotEmpty &&
                                        widget.transport.number != null
                                    ? widget.transport.number!
                                    : '-',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ]),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Row(
                  children: [
                    Text(
                      'Comment',
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  height: 105,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xFf2E313C),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    widget.transport.comment!,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )
            ],
          )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: InkWell(
            onTap: () {
              transports.remove(widget.transport);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => const HomePage()),
              );
              addToSP();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: const Color(0xFF7089E1),
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                'Delete transport',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
