import 'dart:io';

import 'package:flutter/material.dart';

class ReadData extends StatelessWidget {
  final String rNama;
  final String rAbsen;
  final String rKelas;
  final File gambar;

  const ReadData({Key key, this.rNama, this.rAbsen, this.rKelas, this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Read Data"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: gambar == null
                    ? Text('No image selected.')
                    : Image.file(
                        gambar,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Text('Nama Siswa : ' +
                rNama +
                ' Nomor absen  : ' +
                rAbsen +
                ' Kelas : ' +
                rKelas),
          ],
        ),
      ),
    );
  }
}
