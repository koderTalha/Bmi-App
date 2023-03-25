import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bmicalculator(),
    );
  }
}
class Bmicalculator extends StatefulWidget {
  const Bmicalculator({Key? key}) : super(key: key);

  @override
  State<Bmicalculator> createState() => _BmicalculatorState();
}

class _BmicalculatorState extends State<Bmicalculator> {

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar:AppBar(
          title:const Text(
            'BMI Calulator',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0xfffafafa),
          actions: [
            IconButton(
                onPressed: (){},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black45,
                  size: 32,
                )
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.pinkAccent, 1),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "Your height in cm :",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Your height in cm',
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeindex(int index){
    setState(() {
      currentindex =index;
    });
  }

  Widget radioButton(String value, Color color, int index){
    return Expanded(
      child: Container(
        height: 60,
        margin:const EdgeInsets.symmetric(horizontal: 12.0),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: currentindex == index ? color : Colors.grey.shade400,
           // color = currentindex == index ? color : Colors.grey,
          onPressed: () {
            changeindex(index);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
              value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
            ),
          ),
        ),
      ),
    );
  }
}
