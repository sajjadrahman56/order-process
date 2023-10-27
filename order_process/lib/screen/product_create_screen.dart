import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdcutScreen extends StatefulWidget {
  const ProdcutScreen({super.key});

  @override
  State<ProdcutScreen> createState() => _ProdcutScreenState();
}

class _ProdcutScreenState extends State<ProdcutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Product Create Screen'),
      ),
      body: Stack( 
        children: [
          Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                    TextFormField(),
                  ],
                ),
              ),
            ),
          )
        ],
       ),
    );
  }
}