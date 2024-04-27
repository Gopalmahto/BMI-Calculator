import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key?Key}):super(key:Key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.amberAccent;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:Text('BMI'),
      ),
      body:Container(
        color: bgColor,

        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI' , style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 21,),

                TextField(
                  controller: wController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in Kg'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text('Enter Your height in feet'),
                      prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Input your height in Inches'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),
                ElevatedButton(onPressed: (){
                  var wt =wController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();

                  if(wt!="" && ft!="" && inch!=""){
                     //BMI calculation
                     var iwt = int.parse(wt);
                     var ift = int.parse(ft);
                     var iInch = int.parse(inch);

                     var tInch = (ift*12) + iInch;
                     var tCm = tInch*2.54;
                     var tM = tCm/100;
                     var msg  ="";

                     var bmi = iwt/(tM*tM);

                     if(bmi>25){
                       msg="You are Over Weight";
                       bgColor = Colors.orangeAccent;

                     }
                     else if(bmi<18){
                       msg = "You are Under Weight";
                       bgColor = Colors.redAccent;
                     }
                     else{
                         msg = "You are Healthy!!";
                         bgColor=Colors.greenAccent;
                     }

                      setState(() {
                        result = " $msg \n Your BMI is: ${bmi.toStringAsFixed(3)} ";
                      });

                  }
                  else{
                      setState(() {
                        result="Please fill all the required blanks!!";
                      });
                  }

                }, child: Text('Calculate')),

                SizedBox(height: 11,),

                Text(result, style: TextStyle(fontSize: 22),),
              ],
            ),
          ),
        ),
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
