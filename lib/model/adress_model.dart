class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPersonName;
  late String? _contacktPersonNumer;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel({
    id,
    required addressType,
    contactPersonName,
    contacktPersonNumer,
    address,
    latitude,
    longitude,
  }) {
    _id = id;
    _addressType = addressType;
    _contactPersonName = contactPersonName;
    _contacktPersonNumer = contacktPersonNumer;
    _longitude = longitude;
    _latitude = latitude;
  }
  String get address => _address;
  String get addressType => _addressType;
  String? get contactPersonName => _contactPersonName;
  String? get contacktPersonPerson => _contacktPersonNumer;
  String? get latitude => _latitude;
  String? get longitude => _longitude;

  AddressModel.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    _addressType = json["address_type"];
    _contacktPersonNumer = json["contackt_person_numer"] ?? "";
    _contactPersonName = json["contact_person_name"] ?? "";
    _address = json["address"];
    _latitude = json["latitude"];
    _longitude = json["longitude"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["id"] = this._id;
    data["address_type"] = this.addressType;
    data["contackt_person_numer"] = this._contacktPersonNumer;
    data["contact_person_name"] = this._contactPersonName;
    data["address"] = this.address;
    data["latitude"] = this.latitude;
    data["longitude"] = this.longitude;

    return data;
  }
}
