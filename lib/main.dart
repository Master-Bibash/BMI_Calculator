import 'package:flutter/material.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var wttextController = TextEditingController();

  var ftController = TextEditingController();

  var inController = TextEditingController();

  var result = '';
  var msg='';
  Color color=Colors.indigo.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your BMI'),
      ),
      body: Container(
        color:color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "BMI",
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: wttextController,
                      decoration: InputDecoration(
                          label: Text("Enter weight in kg"),
                          prefixIcon: Icon(Icons.line_weight)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text("Enter height in meter"),
                          prefixIcon: Icon(Icons.height)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text("Enter weight in range"),
                          prefixIcon: Icon(Icons.line_weight)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wt = wttextController.text;
                          var ft = ftController.text;
                          var inch = inController.text;
                          if (wt != '' && ft != '' && wt != '') {
                            var iwt = int.parse(wt);
                            var iFt = int.parse(ft);
                            var iInch = int.parse(inch);
      
                            var tInch = (iFt * 12) + iInch;
                            var tCm = tInch * 0.54;
                            var tM = tCm / 100;
                            var bmi = iwt / (tM * tM);

                            if (bmi>25) {
                              msg="You're OverWeight!!!";
                              color=Colors.orange.shade100;
                              
                            }else if(bmi<18){
                                msg="You're UnderWeight!!!";
                              color=Colors.red.shade100;

                            }else{
                                msg="You're Healthy!!!";
                              color=Colors.green.shade100;

                            }
                            setState(() {
                              result = "${msg}\nYour BMI is :${bmi.toStringAsFixed(4)}";
                           
                            });
                          } else {
                            setState(() {
                              result = "Please fill al the requred blanks";
                            });
                          }
                        },
                        child: Text("Calculate")),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
