class Bookings {
  String? id;
  String? createdAt;
  String? userId;
  String? hotelName;
  int? daysNumber;
  String? image;
  String? city;
  String? description;
  int? roomPrice;
  String? hotelId;

  Bookings(
      {this.id,
      this.createdAt,
      this.userId,
      this.hotelName,
      this.daysNumber,
      this.image,
      this.city,
      this.description,
      this.roomPrice,
      this.hotelId});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    userId = json['user_id'];
    hotelName = json['hotel_name'];
    daysNumber = json['days_number'];
    image = json['image'];
    city = json['city'];
    description = json['description'];
    roomPrice = json['room_price'];
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['user_id'] = this.userId;
    data['hotel_name'] = this.hotelName;
    data['days_number'] = this.daysNumber;
    data['image'] = this.image;
    data['city'] = this.city;
    data['description'] = this.description;
    data['room_price'] = this.roomPrice;
    data['hotel_id'] = this.hotelId;
    return data;
  }
}
