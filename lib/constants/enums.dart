enum Gender {
  male,
  female,
}

extension GenderExtension on Gender {
  String get label {
    switch (this) {
      case Gender.male:
        return 'MALE';
      case Gender.female:
        return 'FEMALE';
    }
  }

  String get emoji {
    switch (this) {
      case Gender.male:
        return '👨';
      case Gender.female:
        return '👩';
    }
  }
}
