import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StartPage();
  }
}

class StartPage extends State<Start> {

  showImg(){
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: 100,
        ),
        child:  Image(image: AssetImage('img/img.png'))
      ),
    );
  }

  showButton(){
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 180,
        ),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width*0.8,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'SF Pro Text',
                ),
              ),
            child: const Text('Start'),
            onPressed: () {
              Navigator.pushNamed(context, '/Quiz');
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Quiz()));
            }
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body:Column(
        children: [
          showImg(),
          showButton()
        ],
      ),
    );
  }
}