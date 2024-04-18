import '../abstractClasses/Entity.dart';
import '../util/util.dart';

class Mood extends Entity {
  Mood(String id, String desc) : super(id, desc, getDateNow());

  @override
  set desc(String desc) {
    String desc_cleaned = desc.trim();
    desc_cleaned = desc_cleaned.replaceAll(RegExp(r'[^a-zA-Z\s]+|\s{2,}'), ' ');
    super.desc = desc_cleaned;
  }
}