class UserModel {
  late String? namaDepan;
  late String? namaBelakang;
  late String? email;
  late String? password;

  UserModel({
    this.namaDepan,
    this.namaBelakang,
    this.email,
    this.password,
  });
}

class NotificationModel extends UserModel {
  late String? saran;

  NotificationModel({
    super.namaDepan,
    super.namaBelakang,
    super.email,
    super.password,
    this.saran,
  });
}
