List<String> preferenceKeys = ['LOW', 'MEDIUM', 'HIGH'];

int getPreferenceFromKey(String? preferenceKey) {
  switch (preferenceKey) {
    case "LOW":
      return 1;
    case "MEDIUM":
      return 2;
    case "HIGH":
      return 3;
    default:
      return 1;
  }
}

String getKeyFromPreference(int? preference) {
  switch (preference) {
    case 1:
      return "LOW";
    case 2:
      return "MEDIUM";
    case 3:
      return "HIGH";
    default:
      return "LOW";
  }
}
