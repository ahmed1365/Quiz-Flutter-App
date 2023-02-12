import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function q;
  final int resultScore;

  Result(this.q, this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 120) {
      resultText = "your Grade is A .. Great";
    } else if (resultScore >= 90) {
      resultText = "your Grade is B .. Good";
    }
    else if (resultScore >= 50) {
      resultText = "your Grade is F .. so Bad";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
      Text(
      "    your score is "
      " $resultScore ♥"
      "               $resultPhrase ",
        textAlign: TextAlign.center,
        style: TextStyle(

            fontSize: 25,
            color: Colors.white,
            backgroundColor: Colors.black,
            fontWeight: FontWeight.bold),
      ),
      FlatButton(
        child: Text(
          "Restart Quiz",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 25,
            fontWeight: FontWeight.bold,),
        ),
        onPressed: q,
      ),
      Text("Developed By Mahran",
        textAlign: TextAlign.center,
        style: TextStyle(

            fontSize: 20,
            color: Colors.amber,
            backgroundColor: Colors.black,
            fontWeight: FontWeight.bold),
      ),

    ],
    )
    ,
    );
  }
}
