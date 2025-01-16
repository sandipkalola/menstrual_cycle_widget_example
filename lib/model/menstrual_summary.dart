class MenstrualCycleSummaryData {
  KeyMatrix? keyMatrix;
  PredictionMatrix? predictionMatrix;
  List<PredictedSymptomsPatternToday>? predictedSymptomsPatternToday;

  MenstrualCycleSummaryData(
      {this.keyMatrix,
      this.predictionMatrix,
      this.predictedSymptomsPatternToday});

  MenstrualCycleSummaryData.fromJson(Map<String, dynamic> json) {
    keyMatrix = json['key_matrix'] != null
        ? KeyMatrix.fromJson(json['key_matrix'])
        : null;
    predictionMatrix = json['prediction_matrix'] != null
        ? PredictionMatrix.fromJson(json['prediction_matrix'])
        : null;
    if (json['predicted_symptoms_pattern_today'] != null) {
      predictedSymptomsPatternToday = <PredictedSymptomsPatternToday>[];
      json['predicted_symptoms_pattern_today'].forEach((v) {
        predictedSymptomsPatternToday!
            .add(PredictedSymptomsPatternToday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (keyMatrix != null) {
      data['key_matrix'] = keyMatrix!.toJson();
    }
    if (predictionMatrix != null) {
      data['prediction_matrix'] = predictionMatrix!.toJson();
    }
    if (predictedSymptomsPatternToday != null) {
      data['predicted_symptoms_pattern_today'] =
          predictedSymptomsPatternToday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KeyMatrix {
  int? currentDayCycle;
  int? avgCycleLength;
  int? avgPeriodDuration;
  bool? isPeriodStart;
  int? periodDay;
  bool? isOvulationDay;
  int? prevCycleLength;
  int? prevPeriodDuration;
  String? cycleRegularityScoreStatus;
  double? cycleRegularityScore;
  String? periodRegularityScoreStatus;
  double? periodRegularityScore;

  KeyMatrix(
      {this.currentDayCycle,
      this.avgCycleLength,
      this.avgPeriodDuration,
      this.isPeriodStart,
      this.periodDay,
      this.isOvulationDay,
      this.prevCycleLength,
      this.prevPeriodDuration,
      this.cycleRegularityScoreStatus,
      this.cycleRegularityScore,
      this.periodRegularityScoreStatus,
      this.periodRegularityScore});

  KeyMatrix.fromJson(Map<String, dynamic> json) {
    currentDayCycle = json['current_day_cycle'];
    avgCycleLength = json['avg_cycle_length'];
    avgPeriodDuration = json['avg_period_duration'];
    isPeriodStart = json['is_period_start'];
    periodDay = json['period_day'];
    isOvulationDay = json['is_ovulation_day'];
    prevCycleLength = json['prev_cycle_length'];
    prevPeriodDuration = json['prev_period_duration'];
    cycleRegularityScoreStatus = json['cycle_regularity_score_status'];
    cycleRegularityScore = json['cycle_regularity_score'];
    periodRegularityScoreStatus = json['period_regularity_score_status'];
    periodRegularityScore = json['period_regularity_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_day_cycle'] = currentDayCycle;
    data['avg_cycle_length'] = avgCycleLength;
    data['avg_period_duration'] = avgPeriodDuration;
    data['is_period_start'] = isPeriodStart;
    data['period_day'] = periodDay;
    data['is_ovulation_day'] = isOvulationDay;
    data['prev_cycle_length'] = prevCycleLength;
    data['prev_period_duration'] = prevPeriodDuration;
    data['cycle_regularity_score_status'] = cycleRegularityScoreStatus;
    data['cycle_regularity_score'] = cycleRegularityScore;
    data['period_regularity_score_status'] = periodRegularityScoreStatus;
    data['period_regularity_score'] = periodRegularityScore;
    return data;
  }
}

class PredictionMatrix {
  String? nextPeriodDay;
  String? ovulationDay;
  bool? isPeriodStartFromToday;
  bool? isPeriodStartFromTomorrow;

  PredictionMatrix(
      {this.nextPeriodDay,
      this.ovulationDay,
      this.isPeriodStartFromToday,
      this.isPeriodStartFromTomorrow});

  PredictionMatrix.fromJson(Map<String, dynamic> json) {
    nextPeriodDay = json['next_period_day'];
    ovulationDay = json['ovulation_day'];
    isPeriodStartFromToday = json['is_period_start_from_today'];
    isPeriodStartFromTomorrow = json['is_period_start_from_tomorrow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next_period_day'] = nextPeriodDay;
    data['ovulation_day'] = ovulationDay;
    data['is_period_start_from_today'] = isPeriodStartFromToday;
    data['is_period_start_from_tomorrow'] = isPeriodStartFromTomorrow;
    return data;
  }
}

class PredictedSymptomsPatternToday {
  String? symptomName;
  int? occurrences;

  PredictedSymptomsPatternToday({this.symptomName, this.occurrences});

  PredictedSymptomsPatternToday.fromJson(Map<String, dynamic> json) {
    symptomName = json['symptomName'];
    occurrences = json['occurrences'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['symptomName'] = symptomName;
    data['occurrences'] = occurrences;
    return data;
  }
}
