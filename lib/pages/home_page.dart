import 'package:flutter/material.dart';
import 'package:transport_app/model/transport_item.dart';
import 'package:transport_app/pages/add_comment_page.dart';
import 'package:transport_app/pages/add_new_transport.dart';
import 'package:transport_app/pages/description_transport_page.dart';
import 'package:transport_app/pages/news_page.dart';
import 'package:transport_app/pages/settings_page.dart';

List<TransportItem> transports = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getSP(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1F23),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const SettingsPage()),
                  );
                },
                child: const Text(
                  'Settings',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFF7089E1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const NewsPage()),
                  );
                },
                child: const Text(
                  'News',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFF7089E1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Row(
            children: [
              Text(
                'Main',
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
          child: transports.isEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Text(
                          'No transport yet',
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFF7089E1),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        'Click the button below to add the new transportation',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: getTransports(),
                )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: InkWell(
            onTap: () {
              transport = TransportItem();
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddTransportItemPage(
                          isEdit: false,
                          editTransport: TransportItem(),
                        )),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                  color: const Color(0xFF7089E1),
                  borderRadius: BorderRadius.circular(16)),
              child: const Text(
                'Add new transport',
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

  Widget getTransports() {
    List<Widget> list = [];
    for (var transport in transports) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionTransportPage(
                      transport: transport,
                    )),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: const Color(0xFF252730),
              borderRadius: BorderRadius.circular(8)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    transport.name!,
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Text(
                  '${transport.rentalCost!.toStringAsFixed(0)}\$ Hour',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    transport.state!.text,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: transport.state == EState.perfect
                            ? const Color(0xFFAEFFC5)
                            : transport.state == EState.average
                                ? const Color(0xFFFD9F5B)
                                : const Color(0xFFFB5050),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF7089E1),
                )
              ],
            )
          ]),
        ),
      ));
      list.add(const SizedBox(
        height: 16,
      ));
    }
    return Column(
      children: list,
    );
  }
}
