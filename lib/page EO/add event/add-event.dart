import 'package:flutter/material.dart';
import 'package:sponsorin/page%20EO/add%20event/form-detail-event.dart';
import 'package:sponsorin/page%20EO/page%20home/custom-container-panjang.dart';
import 'package:sponsorin/style/textstyle.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final List<Map<String, String>> dataEventUser = [
    {
      "image": "image/google.png",
      "title": "Google I/O Extended",
      "subtitle": "Sebuah seminar yang memperkenalkan teknologi."
    },
  ];
  late List<Map<String, String>> dataEventUserCopy;

  @override
  void initState() {
    super.initState();
    dataEventUserCopy = List.from(dataEventUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(244, 244, 244, 100),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ), // Set the same right padding
              child: Container(
                // color: Colors.yellow,
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
          leading: Padding(
            padding:
                const EdgeInsets.only(left: 20), // Set the same left padding
            child: const SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.account_circle_outlined,
                size: 40,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 60, // Set the desired width
          height: 60, // Set the desired height
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormEvent()),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Set the desired radius
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            backgroundColor: Colors.blue,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromRGBO(244, 244, 244, 100),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                      text: 'Daftar event yang anda buat',
                      style: CustomTextStyles.header),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: dataEventUserCopy
                        .map((business) => Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: BuildContainerPanjang(business["image"]!,
                                  business["title"]!, business["subtitle"]!),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
