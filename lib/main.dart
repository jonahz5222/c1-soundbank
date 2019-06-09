import 'package:audioplayers/audio_cache.dart';
import 'phrase.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundbank',
      theme: ThemeData(
        
        primaryColor: Colors.white,
        accentColor: Colors.red,
        
      ),
      home: MyHomePage(title: 'Soundbank'),
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
  List<Phrase> filteredPhrases;
  List<Phrase> phrases;

  String _dropdownValue;
  
  AudioCache _player; 

  void initState() {
    super.initState();

    
    phrases = <Phrase>[
    /*
      Add Phrases to Array Here
    */
    Phrase(
      title: "Yeah Baby!",
      speaker: Speaker.sammi,
      soundclip: "yeahBaby.mp3"
    ),
    Phrase(
      title: "Venture",
      speaker: Speaker.jenni,
      soundclip: "happierWithVenture.mp3"
    ),
    Phrase(
      title: "Gary Gary Gary",
      speaker: Speaker.sammi,
      soundclip: "garyGaryGary.mp3"
    ),
    Phrase(
      title: "Pina Coladas?",
      speaker: Speaker.charli,
      soundclip: "pinaColadas.mp3"
    ),
    
    Phrase(
      title: "Woo! That's Good!",
      speaker: Speaker.sammi,
      soundclip: "wooThatsGood.mp3"
    ),
    Phrase(
      title: "Simple, Smart",
      speaker: Speaker.sammi,
      soundclip: "simpleSmartChoices.mp3"
    ),
    Phrase(
      title: "Giddyup",
      speaker: Speaker.sammi,
      soundclip: "giddyup.mp3"
    ),
    
    Phrase(
      title: "Wallet",
      speaker: Speaker.jenni,
      soundclip: "jenniWIYW.mp3"
    ),
    
    Phrase(
      title: "Turtle Rat",
      speaker: Speaker.charli,
      soundclip: "turtleRat.mp3"
    ),
    Phrase(
      title: "Good, Bad, and Ugly",
      speaker: Speaker.sammi,
      soundclip: "goodBadUgly.mp3"
    ),
    Phrase(
      title: "Cantaloupe",
      speaker: Speaker.charli,
      soundclip: "deerloupCantaloup.mp3"
    ),
    Phrase(
      title: "NSFW Wallet",
      speaker: Speaker.sammi,
      soundclip: "wiywNSFW.mp3"
    ),
    Phrase(
      title: "Champion!",
      speaker: Speaker.sammi,
      soundclip: "champion.mp3"
    ),
    Phrase(
      title: "Sucker",
      speaker: Speaker.charli,
      soundclip: "potterySuck.mp3"
    ),
    Phrase(
      title: "Velvety",
      speaker: Speaker.charli,
      soundclip: "velvety.mp3"
    ),
    Phrase(
      title: "Super Easy",
      speaker: Speaker.sammi,
      soundclip: "superEasy.mp3"
    ),
    Phrase(
      title: "My Bad :(",
      speaker: Speaker.sammi,
      soundclip: "myBad.mp3"
    ),
    
        
    ];

    filteredPhrases = phrases;
    _player = new AudioCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
            hint: Text("All"),
            items: SpeakerStrings.values.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            value: _dropdownValue,
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value;
                });

                if (SpeakerStrings[Speaker.all] == value) {
                  filteredPhrases = phrases;
                  return;
                }

                filteredPhrases = List<Phrase>();

                for (Phrase phrase in phrases) {
                  if (SpeakerStrings[phrase.speaker] == value) {
                    filteredPhrases.add(phrase);
                  }
                }

                setState(() {});
              },
            ),
          ),
          
        ],

        title: new Text(widget.title)
      ),

      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(filteredPhrases.length, (index) {
            return Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 6,
              child: new GestureDetector(
                onTap: () {
                  _player.play(filteredPhrases[index].soundclip);
                },
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Opacity(
                        opacity: 0.5,
                        child: Image(
                        image: AssetImage(SpeakerImageFileName[(filteredPhrases[index].speaker)]),
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
                    ],
                  ),              
                ),
              ),
              
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(10),
            ); 
          })
        )
      ),
    );
  }
}
