class Patient {
  final String _patientId;
  final String _name;
  final int _age;
  final bool urgent;
  Patient(this._patientId, this._name, this._age, [this.urgent = false]);
  String get patientId => _patientId;
  String get name => _name;
  int get age => _age;
}

class Hospital {
  // a list of patients
  final List<Patient> _patients;
  Hospital(this._patients);
  // constructor
  List<Patient> getUrgentPatients() {
    return _patients.where((patient) => patient.urgent).toList();
  }
  List<Patient> getUrgentPatientsFrom60() {
    return _patients
        .where((patient) => patient.urgent && patient.age >= 60)
        .toList();
  }
}

void main() {
  // 1. create the 4 patients
  var patient1 = Patient("P001", "Dara", 70, true);
  var patient2 = Patient("P002", "Sophea", 8);
  var patient3 = Patient("P003", "Malis", 55, true);
  var patient4 = Patient("P004", "Rith", 65);
  // 2. create a hospital that holds them
  var hospital = Hospital([patient1, patient2, patient3, patient4]);
  // 3. print the two results
  print("urgent patients");
  for (final patient in hospital.getUrgentPatients()) {
    print("${patient.name}");
  }
    print("urgent patients aged 60 or more");
  for (final patient in hospital.getUrgentPatientsFrom60()) {
    print("${patient.name}");
  }
}
