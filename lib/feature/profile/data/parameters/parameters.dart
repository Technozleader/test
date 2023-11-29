class EditProfileParameters {
  String? name;
  String? lastName;
  String? email;
  String? phone;

  EditProfileParameters({
    this.name,
    this.lastName,
    this.email,
    this.phone,
  });

  bool isEmpty() {
    return (name?.isEmpty ?? true) &&
        (lastName?.isEmpty ?? true) &&
        (email?.isEmpty ?? true) &&
        (phone?.isEmpty ?? true);
  }


  EditProfileParameters compareAndReturnNull(EditProfileParameters other) {
    return EditProfileParameters(
      name: other.name == name? null:name ,
      lastName: other.lastName == lastName? null:lastName,
      email: other.email == email? null:email,
      phone: other.phone == phone? null:phone,
    );
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EditProfileParameters &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          lastName == other.lastName &&
          email == other.email &&
          phone == other.phone;

  @override
  int get hashCode =>
      name.hashCode ^ lastName.hashCode ^ email.hashCode ^ phone.hashCode;
}
