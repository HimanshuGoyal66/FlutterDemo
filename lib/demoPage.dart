
import 'package:demo_flutter_project/second_state_full_widget.dart';
import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget{
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: ()
          {
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15)),
              onPressed: (){

              }, child: const Text("First Red Button",style: TextStyle(color: Colors.white)
              )
          ),
          const SizedBox(height: 20),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 15)),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondStateFullWidget(),
                  ),
                );
              }, child: const Text("Second Page",style: TextStyle(color: Colors.white)
              )
          ),
        ],
      ),),
    );
  }

}