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
