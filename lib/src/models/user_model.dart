import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String email;
  // total de figurinhas do album
  final int totalAlbum;
  // total de figurinhas que eu tenho no album
  final int totalStickers;
  // total de figurinhas repetidas
  final int totalDuplicates;
  // total de figurinhas q faltam para completar o album
  final int totalComplete;
  // porcentagem
  final int totalCompletePercent;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.totalAlbum,
    required this.totalStickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletePercent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'totalAlbum': totalAlbum,
      'totalStickers': totalStickers,
      'totalDuplicates': totalDuplicates,
      'totalComplete': totalComplete,
      'totalCompletePercent': totalCompletePercent,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      totalAlbum: map['total_album']?.toInt() ?? 0,
      totalStickers: map['total_stickers']?.toInt() ?? 0,
      totalDuplicates: map['total_duplicates']?.toInt() ?? 0,
      totalComplete: map['total_complete']?.toInt() ?? 0,
      totalCompletePercent: map['total_complete_percent']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
