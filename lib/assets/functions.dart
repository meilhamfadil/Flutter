import 'dart:math';

import 'package:baseflutter/assets/values.dart';

String indonesianDate(String date) {
  var exploded = date.split("-");
  return "${exploded[2]} ${month[int.parse(exploded[1])]} ${exploded[0]}";
}

String generateRandomString({int length = 8, String mode = "alphanumeric"}) {
  var result = "";
  for (var i = 0; i < length; i++) {
    var firstRandom = randomInt(3);
    switch (mode) {
      case "alphanumeric":
        result += (firstRandom == 0)
            ? chara.substring(randomInt(52))
            : number.substring(randomInt(10));
        break;
      case "alpha":
        result += chara.substring(randomInt(52));
        break;
      case "numeric":
        result += number.substring(randomInt(10));
        break;
      case "symbol":
        result += (firstRandom == 0)
            ? chara.substring(randomInt(52))
            : ((firstRandom == 1)
                ? number.substring(randomInt(10))
                : symbol.substring(randomInt(15)));
        break;
      default:
        result += (firstRandom == 0)
            ? chara.substring(randomInt(52))
            : number.substring(randomInt(10));
        break;
    }
  }
  return result;
}

int randomIntRange(int min, int max) => min + Random().nextInt(max - min);

int randomInt(int max) => Random().nextInt(max);
