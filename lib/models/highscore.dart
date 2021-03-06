import 'package:cognitionAD/models/modes.dart';

class Highscore {
  Modes mode;
  double time;

  Highscore({
    this.mode,
    this.time,
  });

  String get getModeString => mode.toString().substring(6);
  double get getTimeinSeconds => time / 1000;
  Modes get getMode => mode;
  double get getTime => time;

  Map<String, dynamic> toJson() {
    return {
      "mode": this.mode.toString().substring(6),
      "time": this.time,
    };
  }

  factory Highscore.fromJson(Map<String, dynamic> parsedJson) {
    String modeString = parsedJson['mode'];
    Modes tempMode;
    if (modeString == "Visual") {
      tempMode = Modes.Visual;
    } else if (modeString == "Vibrate") {
      tempMode = Modes.Vibrate;
    } else {
      tempMode = Modes.Sound;
    }

    return Highscore(
      mode: tempMode,
      time: parsedJson['time'],
    );
  }
}
