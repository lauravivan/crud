import '../abstractClasses/Entity.dart';

class Action extends Entity {
  Action(String id, String desc, String date) : super(id, desc, date);

  String getCounting() {
    if ((day != 0) && (month != 0) && (year != 0)) {
      DateTime current_date = DateTime.now();

      int years_have_been = (current_date.year - year).abs();
      int months_have_been = (current_date.month - month).abs();
      int days_have_been = (current_date.day - day).abs();
      String phrase = "It's been ";

      if (years_have_been > 0) {
        phrase += '${years_have_been} ${years_have_been == 1 ? 'year' : 'years'}';
      } 

      if (months_have_been > 0) {
        if (years_have_been > 0 && days_have_been > 0) {
          phrase += ', ';
        } else if (years_have_been > 0) {
          phrase += ' and ';
        }
        
        phrase += '${months_have_been} ${months_have_been == 1 ? 'month' : 'months'}';
      }

      if (days_have_been > 0) {
        if (months_have_been > 0 || years_have_been > 0) {
          phrase += ' and ';
        }

        phrase += '${days_have_been} ${days_have_been == 1 ? 'day' : 'days'}';
      }

      return phrase;
    }

    return "";
  }

  @override
  String getInfo() {
    return '''${super.getInfo()}
${getCounting()}''';
  }
}