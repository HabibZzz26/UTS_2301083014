class Transaction {
  final String kodeTransaksi;
  final String kodePenumpang;
  final String namaPenumpang;
  final String jenisPenumpang; // 'VIP' or 'GOLD' or 'REGULAR'
  final String platNomor;
  final String supir;
  final double biayaAwal;
  final double biayaPerKilometer;
  final int jumlahKilometer;
  late double totalBayar;

  Transaction({
    required this.kodeTransaksi,
    required this.kodePenumpang,
    required this.namaPenumpang,
    required this.jenisPenumpang,
    required this.platNomor,
    required this.supir,
    required this.biayaAwal,
    required this.biayaPerKilometer,
    required this.jumlahKilometer,
  }) {
    totalBayar = _calculateTotalBayar();
  }

  double _calculateTotalBayar() {
    int effectiveKilometer = jumlahKilometer;

    if (jenisPenumpang == "VIP") {
      effectiveKilometer = jumlahKilometer > 5 ? jumlahKilometer - 5 : 0;
    } else if (jenisPenumpang == "GOLD") {
      effectiveKilometer = jumlahKilometer > 2 ? jumlahKilometer - 2 : 0;
    }

    return biayaAwal + (biayaPerKilometer * effectiveKilometer);
  }
}
