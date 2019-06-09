# soundbank


# How To

## Assets
1. Add all sound assets (as mp3s) to the root level assets folder. 

2. Add all image assets to the lib/images folder.

## phrase.dart
1. Add all of your speakers to the enum. Do not remove the all case. These will be tied to your desired image below.

2. In SpeakerStrings, add a key value pair for each case in your enum with your desired publically visible name.

3. In SpeakerImageFileName, add a key value pair for each case in your enum (except for all) with your desired image. The image string should look something like `"lib/images/FILENAME.EXTENSION"`


## main.dart
1. Add your list of phrases in the indicated location. Each phrase constructor should look something like this:
```dart
Phrase(
  title: "TITLE",
  speaker: Speaker.EXAMPLE,
  soundclip: "EXAMPLE.mp3"
),
```

  
And that's it! You have a fully functioning soundboard app that you can put on any phone! For creating .apk's and .ipa's to load on to people's phones, please refer to flutter's documentation for [iOS](https://flutter.dev/docs/deployment/ios) and [Android](https://flutter.dev/docs/deployment/android)
