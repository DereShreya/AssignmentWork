class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? practionerId;
  String? billingAddress;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.practionerId,
      this.billingAddress});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    practionerId = json['practioner_id'];
    billingAddress = json['billing_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['practioner_id'] = this.practionerId;
    data['billing_address'] = this.billingAddress;
    return data;
  }
}