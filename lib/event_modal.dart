class EventModal {
  bool? isSuccess;
  Data? data;
  String? message;

  EventModal({this.isSuccess, this.data, this.message});

  EventModal.fromJson(Map<String, dynamic> json) {
    isSuccess = json['is_success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_success'] = this.isSuccess;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Trainings>? trainings;

  Data({this.trainings});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['trainings'] != null) {
      trainings = <Trainings>[];
      json['trainings'].forEach((v) {
        trainings!.add(new Trainings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.trainings != null) {
      data['trainings'] = this.trainings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Trainings {
  String? month;
  List<TrainingEvents>? trainingEvents;

  Trainings({this.month, this.trainingEvents});

  Trainings.fromJson(Map<String, dynamic> json) {
    month = json['Month'];
    if (json['training_events'] != null) {
      trainingEvents = <TrainingEvents>[];
      json['training_events'].forEach((v) {
        trainingEvents!.add(new TrainingEvents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Month'] = this.month;
    if (this.trainingEvents != null) {
      data['training_events'] =
          this.trainingEvents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrainingEvents {
  String? date;
  String? day;
  List<Events>? events;

  TrainingEvents({this.date, this.day, this.events});

  TrainingEvents.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    day = json['Day'];
    if (json['Events'] != null) {
      events = <Events>[];
      json['Events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Day'] = this.day;
    if (this.events != null) {
      data['Events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int? id;
  String? status;
  TE? tE;

  Events({this.id, this.status, this.tE});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    tE = json['TE'] != null ? new TE.fromJson(json['TE']) : null;
    // status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.tE != null) {
      data['TE'] = this.tE!.toJson();
    }
    // data['Status'] = this.status;
    return data;
  }
}

class TE {
  String? tmName;

  TE({this.tmName});

  TE.fromJson(Map<String, dynamic> json) {
    tmName = json['tm_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tm_name'] = this.tmName;
    return data;
  }
}
