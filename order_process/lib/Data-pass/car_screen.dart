import 'package:flutter/material.dart';
import 'package:order_process/Data-pass/detailes_screen.dart';
class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  List<String> cars = ['hatch', 'wagon', 'sub'];
  List<String> carsUb = ['1h', '1w', '1s'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('car screen'),
        ),
        body: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.car_rental),
                title: Text(cars[index]),
                subtitle: Text(carsUb[index]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                cartText: cars[index],
                                subText: carsUb[index],
                                updateList: (String newText , String nt2) {
                                  cars[index] = newText;
                                  carsUb[index]=nt2;
                                  setState(() {});
                                },
                              )));
                },
              );
            }));
  }
}


