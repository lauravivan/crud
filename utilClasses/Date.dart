import '../util/util.dart';

class Date {
  int _day = 0;
  int _month = 0;
  int _year = 0;
  String _date = '';

  Date(String date) {
    setDate(date);
  }

  void setDate(String date) {
    /**
     * setDate vai receber uma string e extrair dela somente os números;
     * Uma data precisa ter no mínimo 6 caracteres, menos que isso retorna 0/0/0; 
     * Por padrão considerará os primeiro e segundo caracteres como mês e dia e os 4 restantes o ano;
     * Para verificar se a data inserida é de fato válida, é instanciado um DateTime com os dados;
     */

    String date_clean = getExtractedNumbers(date);
    
    if (date_clean.length >= 6) {
      int month_clean = int.parse(date_clean[0]);
      int day_clean = int.parse(date_clean[1]);
      int year_clean = int.parse(date_clean.substring(2, 6));

      if ((date_clean.length == 7)) {
        month_clean = int.parse(date_clean.substring(0, 2));
        day_clean = int.parse(date_clean.substring(1, 3));
        year_clean = int.parse(date_clean.substring(3, 7));

        if (month_clean <= 12) {
          day_clean = int.parse(date_clean[2]);
        } else {
           if (day_clean <= 31) {
             month_clean = int.parse(date_clean[0]);
           }
        }
      } 

      if ((date_clean.length == 8)) {
        day_clean = int.parse(date_clean.substring(2, 4));
        month_clean = int.parse(date_clean.substring(0, 2));
        year_clean = int.parse(date_clean.substring(4, 8));
      }

      if ((month_clean > 12) || (day_clean > 31)) {
        day_clean = 0;
        month_clean = 0;
        year_clean = 0;
      }

      if ((month_clean != 0) && (day_clean != 0) && (year_clean != 0)) {
        DateTime date_valid = DateTime(year_clean, month_clean, day_clean);

        _day = date_valid.day;
        _month = date_valid.month;
        _year = date_valid.year;
      }
    }

    _date = '${month}/${day}/${year}';
  }
  
  int get day => _day;

  int get month => _month;

  int get year => _year;

  String get date => _date;
}