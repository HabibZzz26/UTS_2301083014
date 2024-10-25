import 'package:flutter/material.dart';
import 'transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Taxi(),
    );
  }
}

class Taxi extends StatefulWidget {
  @override
  _TaxiState createState() => _TaxiState();
}

class _TaxiState extends State<Taxi> {
  final _formKey = GlobalKey<FormState>();
  final _kodeTransaksiController = TextEditingController();
  final _kodePenumpangController = TextEditingController();
  final _namaPenumpangController = TextEditingController();
  final _jenisPenumpangController = TextEditingController();
  final _platNomorController = TextEditingController();
  final _supirController = TextEditingController();
  final _biayaAwalController = TextEditingController();
  final _biayaPerKilometerController = TextEditingController();
  final _jumlahKilometerController = TextEditingController();

  double? totalBayar;

  void _calculateTotalBayar() {
    if (_formKey.currentState!.validate()) {
      final transaction = Transaction(
        kodeTransaksi: _kodeTransaksiController.text,
        kodePenumpang: _kodePenumpangController.text,
        namaPenumpang: _namaPenumpangController.text,
        jenisPenumpang: _jenisPenumpangController.text,
        platNomor: _platNomorController.text,
        supir: _supirController.text,
        biayaAwal: double.parse(_biayaAwalController.text),
        biayaPerKilometer: double.parse(_biayaPerKilometerController.text),
        jumlahKilometer: int.parse(_jumlahKilometerController.text),
      );

      setState(() {
        totalBayar = transaction.totalBayar;
      });
    }
  }

  @override
  void dispose() {
    _kodeTransaksiController.dispose();
    _kodePenumpangController.dispose();
    _namaPenumpangController.dispose();
    _jenisPenumpangController.dispose();
    _platNomorController.dispose();
    _supirController.dispose();
    _biayaAwalController.dispose();
    _biayaPerKilometerController.dispose();
    _jumlahKilometerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Taxi')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _kodeTransaksiController,
                decoration: InputDecoration(labelText: 'Kode Transaksi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Kode Transaksi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kodePenumpangController,
                decoration: InputDecoration(labelText: 'Kode Penumpang'),
              ),
              TextFormField(
                controller: _namaPenumpangController,
                decoration: InputDecoration(labelText: 'Nama Penumpang'),
              ),
              TextFormField(
                controller: _jenisPenumpangController,
                decoration: InputDecoration(labelText: 'Jenis Penumpang (VIP/GOLD/REGULAR)'),
              ),
              TextFormField(
                controller: _platNomorController,
                decoration: InputDecoration(labelText: 'Plat Nomor'),
              ),
              TextFormField(
                controller: _supirController,
                decoration: InputDecoration(labelText: 'Supir'),
              ),
              TextFormField(
                controller: _biayaAwalController,
                decoration: InputDecoration(labelText: 'Biaya Awal'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _biayaPerKilometerController,
                decoration: InputDecoration(labelText: 'Biaya Per Kilometer'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _jumlahKilometerController,
                decoration: InputDecoration(labelText: 'Jumlah Kilometer'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateTotalBayar,
                child: Text('Calculate Total Bayar'),
              ),
              if (totalBayar != null)
                Text(
                  'Total Bayar: Rp. $totalBayar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
