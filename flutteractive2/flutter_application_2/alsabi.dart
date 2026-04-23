import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyHome()));
}

class MyHome extends StatelessWidget {
  // عرفنا قائمة بأسماء الجوالات هنا
  final List<String> phones = [
    "آيفون 15 برو",
    "سامسونج جالكسي S23",
    "هواوي P60 برو",
    "جوجل بيكسل 8",
    "شاومي 13 الترا",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("متجر الجوالات"),
        backgroundColor: Colors.orange,
      ),

      body: ListView.builder(
        itemCount: phones.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.phone_android),
            title: Text(phones[index]),
            trailing: Icon(Icons.arrow_forward_ios, size: 15),
            onTap: () async {
              var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(pName: phones[index]),
                ),
              );

              if (result != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(result.toString())));
              }
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String pName;
  DetailsPage({required this.pName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفاصيل " + pName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mobile_friendly,
              size: 100,
              color: Colors.orange,
            ), // شكل جوال كبير
            SizedBox(height: 20),
            Text(
              "المنتج المختار: $pName",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "تمت إضافة $pName للمفضلة");
              },
              child: Text("إضافة للمفضلة"),
            ),
          ],
        ),
      ),
    );
  }
}
