import 'package:flutter/material.dart';

class AgeHeight extends StatefulWidget {

  const AgeHeight({Key? key,
    required this.onChange,
    required this.title,
    required this.min,
    required this.max,
    required this.initValue}) : super(key: key);

  final Function(int) onChange;
  final String title;
  final int initValue;
  final int min;
  final int max;


  @override
  State<AgeHeight> createState() => _AgeHeightState();
}

class _AgeHeightState extends State<AgeHeight> {

  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = widget.initValue;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: const RoundedRectangleBorder(),
      child: Column(children:
      [
        Text(widget.title,style: const TextStyle(fontSize: 20, color: Colors.grey),),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            InkWell(
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
              ),
              onTap: (){
                setState(() {
                  if(counter > widget.min)
                  {
                    counter--;
                  }
                });

                widget.onChange(counter);
              },
            ),
            SizedBox(height: 15,),

            Text(
              counter.toString(),
              textAlign: TextAlign.center,
            style:const TextStyle(color: Colors.black87,fontSize: 18,fontWeight: FontWeight.w500),),

            SizedBox(height: 15,),

            InkWell(
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.amber,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              onTap: (){
                setState(() {
                  if(counter < widget.max)
                  {
                    counter++;
                  }
                });

                widget.onChange(counter);
              },
            )
          ],),
        )

      ]
      )
    );
  }
}
