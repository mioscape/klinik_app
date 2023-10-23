import 'package:flutter/material.dart';
import 'package:klinik_app/view/data_detail_page.dart';

class DataListPage extends StatelessWidget {
  final List data;
  final String pageTitle;

  const DataListPage(this.data, this.pageTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Data $pageTitle'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: ListTile(
              title: Text(
                item.nama,
                style: const TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataDetailPage(item, pageTitle),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
