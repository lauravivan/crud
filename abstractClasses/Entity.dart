import '../utilClasses/Date.dart';

abstract class Entity extends Date {
  String _id = '';
  String _desc = '';

  Entity(String id, String desc, String date) : super(date) {
    this.id = id;
    this.desc = desc;
  }

  String get id => _id;
  set id(String id) => _id = id;

  String get desc => _desc;
  set desc(String desc) {
    int max_length = 100;
    String desc_trim = desc.trim();

    if (desc_trim.length > max_length) {
      _desc = desc_trim.substring(0, max_length);
    } else {
      _desc = desc_trim;
    }
  }

  String getInfo() {
    if (desc.length > 0) {
      return '${desc} - (${date})';
    }

    return '';
  }
}
