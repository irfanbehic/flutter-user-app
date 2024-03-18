class Validators {
  String? validateNameSurname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name and surname.';
    }
    if (value.length > 30) {
      return 'Name and surname should be less than 30 characters.';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name and surname should only contain letters and spaces.';
    }
    List<String> nameParts = value.split(' ');
    if (nameParts.length < 2) {
      return 'Please enter at least two words for name and surname.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    if (value.length > 30) {
      return 'Email address should be less than 30 characters.';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number.';
    }
    if (value.length >= 12 || value.length < 11) {
      return 'Phone number should be at most 11 digits.';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Phone number should only contain digits.';
    }
    if (value[0] != "0") {
      return "Phone number must starts with 0 ";
    }
    return null;
  }

  String? validateBirthDate(DateTime? value) {
    if (value == null) {
      return 'Please select a birth date.';
    }
    return null;
  }
  
}