import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  resizeToAvoidBottomInset: true, // Set this property to true
  appBar: AppBar(
    title: Text('Your App Title'),
  ),
  body: Column(
    children: [ 
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your name',
                        hintText: 'Enter your name here',
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: InkWell(
                          child: Icon(Icons.check),
                          onTap: () {
                            print('I am click');
                          },
                        ),
                      ),
                ),
                TextFormField(
                   decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your name',
                        hintText: 'Enter your name here',
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: InkWell(
                          child: Icon(Icons.check),
                          onTap: () {
                            print('I am click');
                          },
                        ),
                      ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Add me'),
                ),
              ],
            ),
          ),
        ),
      ),Expanded(
              flex: 3,
              child: ListView.separated(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.add),
                    title: Text('sajjad ${index + 1}'),
                    trailing: Icon(Icons.abc_sharp),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 15,
                    color: Colors.lightBlue,
                  );
                },
              ))
       
    ],
  ),
)
;
  }
}

Widget Contain(Color? color) {
  return Container(
    height: 200,
    width: double.infinity,
    color: color,
  );
}
