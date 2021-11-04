import 'package:tap_material/models/barang_mitra.dart';

class Mitra {
  final String image, nama, alamat;
  List<BarangMitra1>? barangMitra1;
  List<BarangMitra2>? barangMitra2;
  List<BarangMitra3>? barangMitra3;

  Mitra(
      {required this.nama,
      required this.image,
      required this.alamat,
      this.barangMitra1,
      this.barangMitra2,
      this.barangMitra3});
}

List<BarangMitra1> barangMitra1 = [
  BarangMitra1(
    barang: "Barang 1",
    price: 20000,
    image: "assets/images/batu.jpg",
  ),
  BarangMitra1(
    barang: "Barang 2",
    price: 20000,
    image: "assets/images/batu.jpg",
  ),
];

List<Mitra> mitras = [
  Mitra(
    nama: "Mitra1",
    alamat: "Jalan 1",
    image: "assets/images/Toko.jpg",
    barangMitra1: barangMitra1,
  ),
  Mitra(
    nama: "Mitra2",
    alamat: "Jalan 2",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra3",
    alamat: "Jalan 3",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra4",
    alamat: "Jalan 4",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra5",
    alamat: "Jalan 5",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra6",
    alamat: "Jalan 6",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra7",
    alamat: "Jalan 7",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra8",
    alamat: "Jalan 8",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra9",
    alamat: "Jalan 9",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra10",
    alamat: "Jalan 10",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra11",
    alamat: "Jalan 11",
    image: "assets/images/Toko.jpg",
  ),
  Mitra(
    nama: "Mitra12",
    alamat: "Jalan 12",
    image: "assets/images/Toko.jpg",
  ),
];
