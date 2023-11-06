class Appointment {
  String? date;
  Schedule? schedule;

  @override
  String toString() {
    return 'Appointment{date: $date, schedule: $schedule}';
  }

  Appointment({this.date, this.schedule});

  Appointment.fromJson(Map<dynamic, dynamic> json) {
    date = json['date'];
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
  }

}

class Schedule {
  List<Morning>? morning;
  List<Evening>? evening;

  @override
  String toString() {
    return 'Schedule{morning: $morning, evening: $evening}';
  }

  Schedule({this.morning, this.evening});

  Schedule.fromJson(Map<String, dynamic> json) {
    if (json['morning'] != null) {
      morning = <Morning>[];
      json['morning'].forEach((v) {
        morning!.add(new Morning.fromJson(v));
      });
    }
    if (json['evening'] != null) {
      evening = <Evening>[];
      json['evening'].forEach((v) {
        evening!.add(new Evening.fromJson(v));
      });
    }
  }

}



class Evening {
  String? time;

  @override
  String toString() {
    return 'Evening{time: $time, isSecreted: $isSecreted}';
  }

  bool? isSecreted;

  Evening({this.time, this.isSecreted});

  Evening.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    isSecreted = json['isSecreted'];
  }
}

class Morning {
  String? time;
  bool? isSecreted;

  @override
  String toString() {
    return 'Morning{time: $time, isSecreted: $isSecreted}';
  }

  Morning({this.time, this.isSecreted});

  Morning.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    isSecreted = json['isSecreted'];
  }
}
