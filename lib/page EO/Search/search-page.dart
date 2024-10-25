import 'package:flutter/material.dart';
import 'package:sponsorin/page%20EO/page%20home/custom-container-panjang.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = "Retail";
  String _searchQuery = ""; // Tambahkan variabel untuk pencarian

  final Map<String, List<Map<String, String>>> businessData = {
    "Retail": [
      {
        "image": "image/ibox.png",
        "title": "iBox",
        "subtitle": "iBox adalah reseller premium Apple terkemuka di Indonesia."
      },
      {
        "image": "image/informa.png",
        "title": "Informa",
        "subtitle": "Retail Informa"
      },
    ],
    "Makanan": [
      {
        "image": "image/warungWareg.png",
        "title": "Warung Wareg",
        "subtitle":
            "Menawarkan makanan tradisional Indonesia dengan harga terjangkau"
      },
      {
        "image": "image/aqua.png",
        "title": "Aqua",
        "subtitle": "Aqua adalah air mineral yang sudah dikenal sejak lama"
      },
    ],
    "Jasa": [
      {
        "image": "image/hisana.jpeg",
        "title": "Hisana",
        "subtitle":
            "Hisana Fried Chicken adalah merek ayam goreng krispi buatan asli anak bangsa yang enaknya disuka di Indonesia."
      },
      {
        "image": "image/kfc-logo.png",
        "title": "KFC",
        "subtitle":
            "KFC (Kentucky Fried Chicken) adalah jaringan restoran cepat saji asal Amerika Serikat yang terkenal dengan ayam gorengnya."
      },
    ],
    // Tambahkan data untuk kategori lainnya
  };

  // Fungsi untuk mengambil semua bisnis tanpa kategori
  List<Map<String, String>> getAllBusinesses() {
    return businessData.values.expand((list) => list).toList();
  }

  Widget _categoryButton(String text, bool isSelected, IconData icon) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = text;
          _searchQuery = ""; // Reset pencarian saat kategori diubah
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor:
            isSelected ? Colors.white : Color.fromARGB(255, 109, 109, 109),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          SizedBox(width: 5),
          Text(text,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Color.fromARGB(255, 109, 109, 109),
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Jika ada pencarian, kita ambil semua bisnis dan filter berdasarkan query
    List<Map<String, String>> displayedBusinesses = _searchQuery.isNotEmpty
        ? getAllBusinesses().where((business) {
            return business["title"]!
                .toLowerCase()
                .contains(_searchQuery.toLowerCase());
          }).toList()
        : businessData[selectedCategory] ?? [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(244, 244, 244, 100),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ), // Set the same right padding
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 30,
                color: Colors.black54,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(left: 20), // Set the same left padding
          child: Container(
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(244, 244, 244, 100),
          child: Padding(
            padding: EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value; // Perbarui query pencarian
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Cari perusahaan di sini',
                    hintStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color:
                          Color(0xFF539DF3), // Set the color of the search icon
                      size: 26, // Set the size of the search icon
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _categoryButton("Retail", selectedCategory == "Retail",
                          Icons.card_travel),
                      SizedBox(width: 15),
                      _categoryButton("Makanan", selectedCategory == "Makanan",
                          Icons.fastfood_outlined),
                      SizedBox(width: 15),
                      _categoryButton("Jasa", selectedCategory == "Jasa",
                          Icons.handyman_outlined),
                      SizedBox(width: 15),
                      _categoryButton(
                          "Kesehatan",
                          selectedCategory == "Kesehatan",
                          Icons.local_hospital_outlined),
                      SizedBox(width: 15),
                      _categoryButton(
                          "Pendidikan",
                          selectedCategory == "Pendidikan",
                          Icons.school_outlined),
                      SizedBox(width: 15),
                      _categoryButton("Hiburan", selectedCategory == "Hiburan",
                          Icons.park_outlined),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: displayedBusinesses
                      .map((business) => Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: BuildContainerPanjang(business["image"]!,
                                business["title"]!, business["subtitle"]!),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
