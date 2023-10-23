import 'package:flutter/material.dart';
import 'package:klinik_app/model/model.dart';
import 'package:klinik_app/view/data_detail_page.dart';

class DataListPage extends StatefulWidget {
  final List data;
  final String pageTitle;

  const DataListPage(this.data, this.pageTitle, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  List filteredData = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredData.addAll(widget.data);
  }

  void filterData(String query) {
    filteredData.clear();
    if (query.isEmpty) {
      filteredData.addAll(widget.data);
    } else {
      filteredData.addAll(widget.data.where((item) {
        return item.nama.toLowerCase().contains(query.toLowerCase());
      }));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Data ${widget.pageTitle}'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Cari ${widget.pageTitle}',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    filterData('');
                  },
                ),
              ),
              onChanged: (value) {
                filterData(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final item = filteredData[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: ListTile(
                    title: Text(
                      item.nama,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      item is Pegawai ? 'NIP: ${item.nip}' : 'Nomor RM: ${item.nomorRm}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataDetailPage(item, widget.pageTitle),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
