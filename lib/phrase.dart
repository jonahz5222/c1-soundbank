class Phrase {
  Speaker speaker;
  String title;
  String soundclip;

  Phrase({this.speaker,this.title,this.soundclip});
}

enum Speaker {
  all,
  charli,
  jenni,
  sammi,
}

const Map<Speaker, String> SpeakerStrings = {
  Speaker.all: "All",
  Speaker.charli: "Charli",
  Speaker.jenni: "Jenni",
  Speaker.sammi: "Sammi",
};

const Map<Speaker, String> SpeakerImageFileName = {
  Speaker.charli: "lib/images/charli.png",
  Speaker.jenni: "lib/images/jenni.png",
  Speaker.sammi: "lib/images/sammi2.jpg",
};