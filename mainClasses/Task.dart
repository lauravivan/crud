import '../abstractClasses/Entity.dart';
import '../util/task_status.dart';
import '../utilClasses/Time.dart';
import '../util/util.dart';

class Task extends Entity {
  Time _starts_at = new Time('0:0');
  Time _ends_at = new Time('0:0');
  late Map<String, String> _status;
  
  Task(String id, String desc) : super(id, desc, getDateNow());

  Time get starts_at => _starts_at;

  set starts_at(Time starts_at) => _starts_at = starts_at;
  
  Time get ends_at => _ends_at;

  set ends_at(Time ends_at) => _ends_at = ends_at;

  Map<String, String> get status => _status;

  void setStatus(String status) {
    String trimStatus = status.trim();
    
    switch (trimStatus) {
      case '1':
        _status = task_status['To Do']!;
        break;
      case '2':
        _status = task_status['In Progress']!;
        break;
      case '3':
        _status = task_status['On Hold']!;
        break;
      case '4':
        _status = task_status['Blocked']!;
        break;
      case '5':
        _status = task_status['Completed']!;
        break;
      case '6':
        _status = task_status['Deferred']!;
        break;
      case '7':
        _status = task_status['Cancelled']!;
        break;
      default:
        _status = task_status['To Do']!;
        break;
    }
  }

  @override
  String getInfo() {
    String info = '';

    if (desc.length > 0) {
      info = desc;
    }
    
    if (starts_at.hours != 0) {
      info += ' (${starts_at.time}';

      if (ends_at.hours != 0) {
        info += ' - ${ends_at.time})';
      } else {
        info += ')';
      }
    }
    
    return info;
  }
}