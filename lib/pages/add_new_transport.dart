import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transport_app/model/transport_item.dart';
import 'package:transport_app/pages/add_comment_page.dart';
import 'package:uuid/uuid.dart';

TransportItem transport = TransportItem();
TransportItem editTransport = TransportItem();

class AddTransportItemPage extends StatefulWidget {
  const AddTransportItemPage(
      {super.key, required this.isEdit, required this.editTransport});
  final bool isEdit;
  final TransportItem editTransport;

  @override
  State<AddTransportItemPage> createState() => _AddTransportItemPageState();
}

class _AddTransportItemPageState extends State<AddTransportItemPage> {
  TextEditingController typeOfTransportController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController rentalController = TextEditingController();
  TextEditingController depositController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      typeOfTransportController.text = widget.editTransport.type!;
      nameController.text = widget.editTransport.name!;
      numberController.text = widget.editTransport.number!;
      rentalController.text =
          widget.editTransport.rentalCost!.toStringAsFixed(0);
      depositController.text =
          widget.editTransport.valueOfDeposit!.toStringAsFixed(0);
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
                      if (typeOfTransportController.text.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          rentalController.text.isNotEmpty &&
                          depositController.text.isNotEmpty) {
                        transport.type = typeOfTransportController.text;
                        transport.name = nameController.text;
                        if (numberController.text.isNotEmpty) {
                          transport.number = numberController.text;
                        }
                        transport.rentalCost =
                            double.tryParse(rentalController.text);
                        transport.valueOfDeposit =
                            double.tryParse(depositController.text);
                        transport.id = const Uuid().v1();

                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const AddCommentPage(
                                    isEdit: false,
                                  )),
                        );
                      }
                    } else {
                      if (typeOfTransportController.text.isNotEmpty &&
                          nameController.text.isNotEmpty &&
                          rentalController.text.isNotEmpty &&
                          depositController.text.isNotEmpty) {
                        editTransport.type = typeOfTransportController.text;
                        editTransport.name = nameController.text;
                        if (numberController.text.isNotEmpty) {
                          editTransport.number = numberController.text;
                        }
                        editTransport.rentalCost =
                            double.tryParse(rentalController.text);
                        editTransport.valueOfDeposit =
                            double.tryParse(depositController.text);
                        editTransport.id = widget.editTransport.id;
                        editTransport.comment = widget.editTransport.comment;
                        editTransport.state = widget.editTransport.state;
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const AddCommentPage(
                                    isEdit: true,
                                  )),
                        );
                      }
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  'Type of transportation',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: typeOfTransportController,
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
                    typeOfTransportController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  'Name of transport',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: nameController,
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
                    nameController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  'Transport number (optional)',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: numberController,
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
                    numberController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  'Rental cost (\$/hour)',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: rentalController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
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
                    rentalController.text = text;
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                child: Text(
                  'Value of deposit (\$)',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: TextField(
                  cursorColor: Colors.grey,
                  controller: depositController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.number,
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
                    depositController.text = text;
                    setState(() {});
                  },
                ),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
