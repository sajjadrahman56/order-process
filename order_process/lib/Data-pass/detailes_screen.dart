import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.cartText, required this.subText,required this.updateList});

  String cartText;
  String subText;
  Function updateList;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController ted = TextEditingController();
  TextEditingController ted1 = TextEditingController();

  @override
  void initState() {
    ted.text = this.widget.cartText;
    ted1.text = this.widget.subText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen')),
      body: Column(
        children: [
          TextFormField(
            controller: ted,
          ),
          TextFormField(
            controller: ted1,
          ),
          ElevatedButton(
              onPressed: () {
                this.widget.updateList(ted.text,ted1.text);
                Navigator.pop(context);
              },
              child: Text('Updated'))
        ],
      ),
    );
  }
}