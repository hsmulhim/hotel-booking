class Hotels {
  String? hotelId;
  String? name;
  int? roomsAvailable;
  num? roomPrice;
  String? image;
  String? city;
  String? description;

  Hotels(
      {this.hotelId,
      this.name,
      this.roomsAvailable,
      this.roomPrice,
      this.image,
      this.city,
      this.description});

  Hotels.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    name = json['name'];
    roomsAvailable = json['rooms_available'];
    roomPrice = json['room_price'];
    image = json['image'];
    city = json['city'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hotel_id'] = this.hotelId;
    data['name'] = this.name;
    data['rooms_available'] = this.roomsAvailable;
    data['room_price'] = this.roomPrice;
    data['image'] = this.image;
    data['city'] = this.city;
    data['description'] = this.description;
    return data;
  }
}
