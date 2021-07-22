import 'package:flutter/material.dart';

void main() =>
  runApp(MaterialApp(
      home:Feedback(),
    ),
  );

class Feedback extends StatefulWidget {

  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  var question =[ 'How was your day?','How was the coordination with the students?','How do you rate this project?','How was the pace of the project?', 'How was the UI of this project?', 'Do you think that the developers did a good job?',];
  int i = 0;
  var rating = 0.0;
  double sum = 0.0;
  Widget kamker(double sum) {
    if(sum>=0.0 && sum<=10.0)
      { return Text('We are sorry for inconvenience',
      style: TextStyle(
        letterSpacing: 2.0,
        color: Colors.red,
        fontSize: 20.0,
      ),);}
    else if(sum>10.0 && sum<=20.0)
      {return Text('Hope we serve you better next time',
        style: TextStyle(
          letterSpacing: 2.0,
          color: Colors.yellow,
          fontSize: 20.0,
        ),);}
    else if(sum>20.0 && sum<=30.0)
        {return Text('We hope you come back again next time',
          style: TextStyle(
            letterSpacing: 2.0,
            color: Colors.green,
            fontSize: 20.0,
          ),);
        }
    return SizedBox(height: 0.0,);
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Feedback App'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: (i< (question.length)
      ?Padding(padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Question${i+1}:',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 30.0,
                  color: Colors.blueGrey,
                ),),
              SizedBox(height: 5.0,),
              Text(question[i],
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 24.0,
                  color: Colors.blueGrey
                ),),
              SizedBox(height: 20.0,),
              Slider(value: rating , onChanged: (newRating) {
                setState(() => rating= newRating);
              },
                 min: 0.0,
                 max: 5.0,
             divisions: 5,
              label: "$rating",),
              RaisedButton(onPressed: () {
                setState(() {
                  i++;
                  sum= sum+ rating;
                  rating = 0;
                });
              },
              child: (i < (question.length)
              ? Text('Next')
              : Text('gmg vvro')) ,
              color: Colors.amber,
                 ),
            ],),
        ),
      )
    : Padding(padding: EdgeInsets.all(20.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [ Text(
        ' Thank you for your time  \n Total sum of your feedback :$sum',
    style: TextStyle(
      letterSpacing: 2.0,
      color: Colors.blueGrey,
      fontSize: 14.0,
    ),),
      _FeedbackState().kamker(sum),
    ],
    ),
    ),)
      ),);

  }
}

