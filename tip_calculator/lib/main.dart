import 'package:flutter/material.dart';

void main() {
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      home: FirstRoute(),
    );
  }
}

class FirstRoute extends StatefulWidget {
  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Tip Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter the amount in Rupees",
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SecondRoute(value: myController.text)),
                  );
                },
                child: const Text('Next', style: TextStyle(fontSize: 20)),
                color: Colors.orange,
                textColor: Colors.black,
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  String value;
  double finalamount;

  SecondRoute({Key key, this.value}) : super(key: key);
  final controller2 = TextEditingController();

  String tippercent(String bill) {
    double tip = double.parse(controller2.text);
    finalamount = (tip / 100) * double.parse(value) + double.parse(value);
    return finalamount.toString();
  }

  createalertdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Total bill'),
            content: Text(tippercent("bill")),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Text("Amount entered is " + value),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Percentage tip You want to give ",
                labelText: "% tip",
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            onPressed: () {
              createalertdialog(context);
            },
            child: const Text('Total Amount', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
            textColor: Colors.black,
            elevation: 5,
          ),
        ],
      ),
    );
  }
}
