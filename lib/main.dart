import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
            child: MaterialButton(
              color: Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
              },
              child: Text("START"),
              ),
          )
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
            child: MaterialButton(
              color: Colors.white,
              shape: CircleBorder(),
              height: 150,
              minWidth: 150,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
              },
              child: Text("START"),
              ),
          ))
        ],
      ),
    );
  }
}

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  double blueCardHeigth = 0;
  double redCardHeigth = 0;

  int playerAScore = 0;
  int playerBScore = 0;

  bool initialized = false;
  @override
  Widget build(BuildContext context) {

    if(initialized==false){
      blueCardHeigth=MediaQuery.of(context).size.height/2;
      redCardHeigth=MediaQuery.of(context).size.height/2;

      initialized=true;
    }


    
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () { 
              
              setState(() {
                blueCardHeigth = blueCardHeigth + 15;
                redCardHeigth = redCardHeigth - 15;

                playerBScore = playerBScore + 5;
              });

              double wHeight = MediaQuery.of(context).size.height-60;

              if(blueCardHeigth > wHeight){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(playerBScore,"b")));
              }
             },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: blueCardHeigth,
              color: Colors.blueAccent,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: Text("Player B", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  Text(playerBScore.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ),

          MaterialButton(
            onPressed: () { 
              
              setState(() {
                blueCardHeigth = blueCardHeigth - 15;
                redCardHeigth = redCardHeigth + 15;


                playerAScore = playerAScore+5;
              });

              double screenHeight = MediaQuery.of(context).size.height;
              double wHeight = MediaQuery.of(context).size.height-60;

              if(redCardHeigth>wHeight){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultPage(playerAScore,"a")));
              }
             },
            padding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              height: redCardHeigth,
              color: Colors.redAccent,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: Text("Player A", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ),
                  Text(
                    playerAScore.toString(),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


class ResultPage extends StatelessWidget {

  int score = 0;
  String player = "";
  ResultPage(this.score,this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.redAccent : Colors.blueAccent,
      body: Center(
        child: Column(
        children: [
          Text(
            score.toString(),
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            Text(
              player=="a" ? "PLAYER A WON" : "PLAYER B WON",
              style: TextStyle(fontSize: 35),
            ),
            MaterialButton(onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            color: Colors.white,
            child: Text("Restart Game"),)
        ],
      ),
      )
    );
  }
}
