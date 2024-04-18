import '../util/util.dart';

class Time {
  int _hours = 0;
  int _minutes = 0;
  bool _isAM = false; /* padrão */
  String _time = '';

  Time(String time) {
    setTime(time);
  }

  void setTime(String time) {
    /**
     * setTime vai receber uma string e extrair dela somente os números;
     * O tempo precisa ter no mínimo 1 caractere, menos que isso retorna 0:0; 
     * Por padrão considerará os 2 primeiros caracteres como hora, se passar de 12 considera o primeiro caractere como hora e o segundo como minuto;
     */

    String time_clean = getExtractedNumbers(time);

    if (time_clean.length >= 1) {
      int hour_clean = int.parse(time_clean[0]);
      int minute_clean = 0;

      if (time_clean.length == 2) {
        hour_clean = int.parse(time_clean.substring(0, 2));

        if (!_isHoursValid(hour_clean)) {
          hour_clean = int.parse(time_clean[0]);
          minute_clean = int.parse(time_clean[1]);
        }
      }

      if (time_clean.length == 3) {
        hour_clean = int.parse(time_clean.substring(0, 2));
        minute_clean = int.parse(time_clean.substring(1, 3));

        if (_isHoursValid(hour_clean)) {
          minute_clean = int.parse(time_clean[2]);
        } else {
          if (_isMinutesValid(minute_clean)) {
            hour_clean = int.parse(time_clean[0]);
          } 
        }
      }

      if (time_clean.length == 4) {
        hour_clean = int.parse(time_clean.substring(0, 2));
        minute_clean = int.parse(time_clean.substring(2, 4));
      }

      if (!_isHoursValid(hour_clean)) {
        hour_clean = 0;
        minute_clean = 0;
      }

      if (!_isMinutesValid(minute_clean)) {
         minute_clean = 0;
      }

      _hours = hour_clean;
      _minutes = minute_clean;
    }
    
     _time = '${hours}:${minutes < 10 ? '0' : ''}${minutes}';
  }

  int get hours => _hours;

  int get minutes => _minutes;

  bool get isAM => _isAM;

  set isAM(bool isAM) => _isAM = isAM;

  String get time => _time + '${isAM ? ' AM' : ' PM'}';

  bool _isHoursValid(hours) {
    return hours > 0 && hours <= 12;
  }

  bool _isMinutesValid(minutes) {
    return minutes > 0 && minutes <= 59;
  }
}
