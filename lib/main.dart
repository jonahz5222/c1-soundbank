import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'phrase.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primaryColor: Colors.white,
        accentColor: Colors.red,
        
      ),
      home: MyHomePage(title: 'Rich Soundbank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Phrase> filteredPhrases = List<Phrase>();
  List<Phrase> phrases =  <Phrase>[
    Phrase(
      title: "Yeah Baby!",
      personality: Personality.sammi,
      soundclip: "yeahBaby.mp3"
    ),
    Phrase(
      title: "Venture",
      personality: Personality.jenni,
      soundclip: "happierWithVenture.mp3"
    ),
    Phrase(
      title: "Gary Gary Gary",
      personality: Personality.sammi,
      soundclip: "garyGaryGary.mp3"
    ),
    Phrase(
      title: "Pina Coladas?",
      personality: Personality.charli,
      soundclip: "pinaColadas.mp3"
    ),
    
    Phrase(
      title: "Woo! That's Good!",
      personality: Personality.sammi,
      soundclip: "wooThatsGood.mp3"
    ),
    Phrase(
      title: "Simple, Smart",
      personality: Personality.sammi,
      soundclip: "simpleSmartChoices.mp3"
    ),
    Phrase(
      title: "Giddyup",
      personality: Personality.sammi,
      soundclip: "giddyup.mp3"
    ),
    
    Phrase(
      title: "Wallet",
      personality: Personality.jenni,
      soundclip: "jenniWIYW.mp3"
    ),
    
    Phrase(
      title: "Turtle Rat",
      personality: Personality.charli,
      soundclip: "turtleRat.mp3"
    ),
    Phrase(
      title: "Good, Bad, and Ugly",
      personality: Personality.sammi,
      soundclip: "goodBadUgly.mp3"
    ),
    Phrase(
      title: "Cantaloupe",
      personality: Personality.charli,
      soundclip: "deerloupCantaloup.mp3"
    ),
    Phrase(
      title: "NSFW Wallet",
      personality: Personality.sammi,
      soundclip: "wiywNSFW.mp3"
    ),
    Phrase(
      title: "Champion!",
      personality: Personality.sammi,
      soundclip: "champion.mp3"
    ),
    Phrase(
      title: "Sucker",
      personality: Personality.charli,
      soundclip: "potterySuck.mp3"
    ),
    Phrase(
      title: "Velvety",
      personality: Personality.charli,
      soundclip: "velvety.mp3"
    ),
    Phrase(
      title: "Super Easy",
      personality: Personality.sammi,
      soundclip: "superEasy.mp3"
    ),
    Phrase(
      title: "My Bad :(",
      personality: Personality.sammi,
      soundclip: "myBad.mp3"
    ),
    

  ];

  void initState() {
    super.initState();
    filteredPhrases = phrases;
  }

  String _value;

  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  AudioCache player = new AudioCache();
  var alarmAudioPath = "happierWithVenture.mp3";

  String imageChooser(Personality personality) {
    switch (personality) {
      case Personality.sammi:
        return "lib/images/sammi2.jpg";
      case Personality.charli:
        return "lib/images/charli.png";
      case Personality.jenni:
        return "lib/images/jenni.png";
      case Personality.alec:
        return "lib/images/alec.jpeg";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
            hint: Text("All"),
            items: <String>['All', 'Jenni', 'Sammi', 'Charli'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            value: _value,
              
              onChanged: (chosen) {
                setState(() {
                  _value = chosen;
                });
                filteredPhrases = List<Phrase>();
                switch (chosen) {
                  case "All":
                    filteredPhrases = phrases;
                    break;
                  case "Jenni":
                    for (Phrase phrase in phrases) {
                      if (phrase.personality == Personality.jenni) {
                        filteredPhrases.add(phrase);
                      }
                    }
                    break;
                  case "Sammi":
                    for (Phrase phrase in phrases) {
                      if (phrase.personality == Personality.sammi) {
                        filteredPhrases.add(phrase);
                      }
                    }
                    break;
                  case "Charli":
                    for (Phrase phrase in phrases) {
                      if (phrase.personality == Personality.charli) {
                        filteredPhrases.add(phrase);
                      }
                    }
                    break;
                  
                }
                setState(() {});
              },
            ),
          ),
          
        ],

        title: new FlatButton(
          child: new Image.asset('lib/images/logo.png', fit: BoxFit.cover,),
          splashColor: Colors.transparent,  
          highlightColor: Colors.transparent, 
          onPressed: () {
            player.play('richi.mp3');
          },
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(filteredPhrases.length, (index) {
              return Card(
                
                  //Have list of phrases, access with index
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 6,
                child: new GestureDetector(
                    onTap: (){
                      print("clicked");
                      player.play(filteredPhrases[index].soundclip);
                    },
                    child: Container(
                      child: 
                        Stack(
                        children: <Widget>[
                          Opacity(
                            opacity: 0.5,
                            child: Image(
                            image: AssetImage(imageChooser(filteredPhrases[index].personality)),
                            fit: BoxFit.fill,
                            ),
                          ),
                          
                          Center(
                            child: Text(
                              filteredPhrases[index].title,
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.black87),
                              textAlign: TextAlign.center,
                              
                            ),
                          )
                          
                        ] ,
                        
                      ),
                      
                    ),
                ),
                
                
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20
                )),
                margin: EdgeInsets.all(10),
              ); 
          })
        )
          
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
