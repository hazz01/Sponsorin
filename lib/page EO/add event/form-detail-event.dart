import 'package:flutter/material.dart';
import 'package:sponsorin/page%20EO/add%20event/components.dart';
import 'package:sponsorin/page%20EO/page%20proses/proses-proposal.dart';
import 'package:sponsorin/style/textstyle.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:file_picker/file_picker.dart';

class FormEvent extends StatefulWidget {
  const FormEvent({super.key});

  @override
  State<FormEvent> createState() => _FormEventState();
}

class _FormEventState extends State<FormEvent> {
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();
  final TextEditingController _tagController = TextEditingController();
  final List<String> _tags = [];
  final List<String> _suggestions = [
    "Flutter",
    "Dart",
    "Programming",
    "Mobile"
  ];

  final TextEditingController _fileControllerdokum = TextEditingController();
  final List<String> _fileNamesDocum = [];

  final TextEditingController _fileControllerKegiatan = TextEditingController();
  final List<String> _listKegiatanEvent = [];

  final TextEditingController _fileControllerTargetAudiens =
      TextEditingController();
  final List<String> _listTargetAudiens = [];

  final TextEditingController _fileControllerDemografiAudiens =
      TextEditingController();
  final List<String> _listDemografiAudiens = [];

  final TextEditingController _fileControllerSponsorsip =
      TextEditingController();
  final List<String> _listSponsorsip = [];

  final TextEditingController _fileControllerProposal = TextEditingController();
  final List<String> _listProposal = [];

  void _pickFileDokum() async {
    FilePickerResult? resultDokum = await FilePicker.platform.pickFiles();

    if (resultDokum != null) {
      _fileControllerdokum.text = resultDokum.files.single.name;
    }
  }

  void _pickFileProposal() async {
    FilePickerResult? resultProposal = await FilePicker.platform.pickFiles();

    if (resultProposal != null) {
      _fileControllerProposal.text = resultProposal.files.single.name;
    }
  }

  void _addFileNameDocum() {
    setState(() {
      _fileNamesDocum.add(_fileControllerdokum.text);
      _fileControllerdokum.clear();
    });
  }

  void _addKegiatanEvent() {
    if (_fileControllerKegiatan.text.isNotEmpty) {
      print('Adding text: ${_fileControllerKegiatan.text}');
      setState(() {
        _listKegiatanEvent.add(_fileControllerKegiatan.text);
        _fileControllerKegiatan.clear();
      });
      print('Current list: $_listKegiatanEvent');
    } else {
      print('Text field is empty');
    }
  }

  void _removeKegiatanEvent(String fileName) {
    setState(() {
      _listKegiatanEvent.remove(fileName);
    });
    print('Removed $fileName. Current list: $_listKegiatanEvent');
  }

  void _addTargetAudiens() {
    if (_fileControllerTargetAudiens.text.isNotEmpty) {
      print('Adding text: ${_fileControllerTargetAudiens.text}');
      setState(() {
        _listTargetAudiens.add(_fileControllerTargetAudiens.text);
        _fileControllerTargetAudiens.clear();
      });
      print('Current list: $_listTargetAudiens');
    } else {
      print('Text field is empty');
    }
  }

  void _removeTargetAudiens(String fileName) {
    setState(() {
      _listTargetAudiens.remove(fileName);
    });
    print('Removed $fileName. Current list: $_listTargetAudiens');
  }

  void _addDemografiAudiens() {
    if (_fileControllerDemografiAudiens.text.isNotEmpty) {
      print('Adding text: ${_fileControllerDemografiAudiens.text}');
      setState(() {
        _listDemografiAudiens.add(_fileControllerDemografiAudiens.text);
        _fileControllerDemografiAudiens.clear();
      });
      print('Current list: $_listDemografiAudiens');
    } else {
      print('Text field is empty');
    }
  }

  void _removeDemografiAudiens(String fileName) {
    setState(() {
      _listDemografiAudiens.remove(fileName);
    });
    print('Removed $fileName. Current list: $_listDemografiAudiens');
  }

  void _addSponsorsip() {
    if (_fileControllerSponsorsip.text.trim().isNotEmpty) {
      print('Adding text: ${_fileControllerSponsorsip.text}');
      setState(() {
        _listSponsorsip.add(_fileControllerSponsorsip.text);
        _fileControllerSponsorsip.clear();
      });
      print('Current list: $_listSponsorsip');
    } else {
      print('Text field is empty');
    }
  }

  void _removeSponsorsip(String fileName) {
    setState(() {
      _listSponsorsip.remove(fileName);
    });
    print('Removed $fileName. Current list: $_listSponsorsip');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 244, 244, 100),
        title: Text(
          "Add event",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20), // Set the same left padding
          child: Container(
            width: 50,
            height: 50,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black54,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 20, 24, 25),
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "Harap Diisi dengan Data yang Akurat dan Benar",
                    style: CustomTextStyles.header),
                SizedBox(
                  height: 20,
                ),
                CustomTextArea(hintText: "Judul event"),
                CustomTextArea(hintText: "Lokasi event"),
                IntlPhoneField(
                  focusNode: focusNode,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    labelStyle: TextStyle(color: Colors.black45, fontSize: 15),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                  initialCountryCode: 'ID', // Set default country to Indonesia
                  languageCode: "IN",
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                  onCountryChanged: (country) {
                    print('Country code changed to: ' + country.name);
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: _tagController,
                  onChanged: (text) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Tags event',
                    hintStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8.0,
                  children: _tags
                      .map((tag) => Chip(
                            label: Text(tag),
                            labelStyle: TextStyle(color: Colors.white),
                            backgroundColor: Colors.blue,
                            deleteIcon: Icon(
                              Icons.remove_circle_outline_sharp,
                              color: Colors.white,
                              size: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: Colors.white),
                            ),
                            onDeleted: () {
                              setState(() {
                                _tags.remove(tag);
                              });
                            },
                          ))
                      .toList(),
                ),
                if (_tagController.text.isNotEmpty)
                  Wrap(
                    spacing: 8.0,
                    children: _suggestions
                        .where((tag) => tag
                            .toLowerCase()
                            .contains(_tagController.text.toLowerCase()))
                        .map((tag) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (!_tags.contains(tag)) _tags.add(tag);
                                  _tagController.clear();
                                });
                              },
                              child: Chip(
                                label: Text(tag),
                                labelStyle: TextStyle(color: Colors.white),
                                backgroundColor: Colors.blue,
                                deleteIcon: Icon(
                                  Icons.remove_circle_outline_sharp,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  side: BorderSide(color: Colors.white),
                                ),
                                onDeleted: () {
                                  setState(() {
                                    _tags.remove(tag);
                                  });
                                },
                              ),
                            ))
                        .toList(),
                  ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Deskripsi event",
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextField(
                  controller: _fileControllerdokum,
                  readOnly: true,
                  onTap: _pickFileDokum,
                  decoration: InputDecoration(
                    hintText: "Dokumentasi event (opsional)",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Color(0xFF1EAAFD),
                      ),
                      onPressed: _addFileNameDocum,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _fileNamesDocum.map((fileName) {
                    return fileName.isNotEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(fileName),
                              IconButton(
                                icon: Icon(Icons.cancel, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _fileNamesDocum.remove(fileName);
                                  });
                                },
                              ),
                            ],
                          )
                        : Container(); // Return an empty container if fileName is empty
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                buildTextAdderTextField(
                    controller: _fileControllerKegiatan,
                    onAddText: _addKegiatanEvent,
                    Title: "Kegiatan event"),
                SizedBox(
                  height: 10,
                ),
                buildTextList(
                    texts: _listKegiatanEvent, onRemove: _removeKegiatanEvent),
                SizedBox(
                  height: 20,
                ),
                buildTextAdderTextField(
                    controller: _fileControllerTargetAudiens,
                    onAddText: _addTargetAudiens,
                    Title: "Target audiens"),
                SizedBox(
                  height: 10,
                ),
                buildTextList(
                    texts: _listTargetAudiens, onRemove: _removeTargetAudiens),
                SizedBox(
                  height: 20,
                ),
                buildTextAdderTextField(
                    controller: _fileControllerDemografiAudiens,
                    onAddText: _addDemografiAudiens,
                    Title: "Demografi audiens"),
                SizedBox(
                  height: 10,
                ),
                buildTextList(
                    texts: _listDemografiAudiens,
                    onRemove: _removeDemografiAudiens),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  controller: _fileControllerSponsorsip,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Paket sponsorsip",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        color: Color(0xFF1EAAFD),
                      ),
                      onPressed: _addSponsorsip,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                    contentPadding: const EdgeInsets.all(16),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 1)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 1)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                buildTextList(
                    texts: _listSponsorsip, onRemove: _removeSponsorsip),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  readOnly: true,
                  onTap: _pickFileProposal,
                  controller: _fileControllerProposal,
                  decoration: InputDecoration(
                    hintText: "Proposal event",
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.file_upload_outlined,
                        color: Color(0xFF1EAAFD),
                      ),
                      onPressed: _pickFileProposal,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(89, 89, 89, 100)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      borderSide: BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.fromLTRB(
            24, 15, 24, 15), // Jarak dari samping kiri, kanan, dan bawah
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Color(0xFF1EAAFD),
            minimumSize: Size(200, 50), // Ukuran minimum tombol
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProsesProposal()),
            );
          },
          child: Text(
            "Tambahkan Event",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
