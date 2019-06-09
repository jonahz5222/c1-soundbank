class Phrase {
  Speaker speaker;
  String title;
  String soundclip;


  Phrase({this.speaker,this.title,this.soundclip});
}

enum Speaker {
  all,
  /*
    Add Speakers Here
  */
  
}

const Map<Speaker, String> SpeakerStrings = {
  Speaker.all: "All",
  /*
    Add Speakers' Display Names Here
  */
  
};

const Map<Speaker, String> SpeakerImageFileName = {
  /*
    Add Speakers' Image File Paths Here
  */

};