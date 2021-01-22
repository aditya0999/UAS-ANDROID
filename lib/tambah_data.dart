import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController txtNama = TextEditingController();
  TextEditingController absentxt = TextEditingController();
  String _sekolah;
  List _kelas = [
    " I A",
    " I B",
    "II A",
    " II B",
    " III A",
    " III B ",
    " IV A ",
    " IV B ",
    " V A ",
    " V B ",
    " VI A ",
    " VI B "
  ];
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void simpanData() {
    Navigator.pop(context, {
      'nama': txtNama.text,
      'Absen': absentxt.text,
      'Kelas': _sekolah != null ? _sekolah : 'Kelas Kosong'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Absen Siswa"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: absentxt,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "Absen Siswa",
                  labelText: "nomor",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  )),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            TextField(
              controller: txtNama,
              decoration: new InputDecoration(
                  hintText: "Nama Lengkap",
                  labelText: "Nama",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
            ),
            new Padding(padding: new EdgeInsets.only(top: 15.0)),
            Row(
              children: <Widget>[
                new Text(
                  "Kelas   : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                DropdownButton(
                  items: _kelas.map((value) {
                    return DropdownMenuItem(
                      child: Text(value),
                      value: value,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _sekolah = value;
                    });
                  },
                  value: _sekolah,
                  hint: Text('Pilih'),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Foto Kartu Pelajar : ",
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                ),
                FlatButton(
                  onPressed: getImage,
                  child: _image == null
                      ? Text('Pilih File')
                      : Text('Berhasil Diupload'),
                )
              ],
            ),
            new Padding(padding: new EdgeInsets.only(top: 35.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  child: Text("Simpan"),
                  onPressed: () {
                    simpanData();
                  },
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Batal'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
