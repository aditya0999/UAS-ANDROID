import 'package:flutter/material.dart';

class EditList extends StatefulWidget {
  final String oldNama;
  final String oldabsen;
  final String oldkelas;

  const EditList({Key key, this.oldNama, this.oldabsen, this.oldkelas})
      : super(key: key);

  @override
  _EditListState createState() => _EditListState();
}

class _EditListState extends State<EditList> {
  TextEditingController txtNama;
  TextEditingController absentxt;

  String _sekolah;
  String odl;
  void oldData() {
    txtNama = TextEditingController(text: widget.oldNama);
    absentxt = TextEditingController(text: widget.oldabsen);

    odl = widget.oldkelas;
  }

  List _kelas = [
    "Rekaya Perangkat Lunak",
    "I A",
    "I B",
    "II A",
    "II B",
    "III A",
    "III B",
    "IV A",
    "IV B",
    " V A",
    " V B ",
    " VI A",
    " VI B"
  ];

  void simpanData() {
    Navigator.pop(context, {
      'nama': txtNama.text,
      'Absen': absentxt.text,
      'Kelas': _sekolah == null ? odl : _sekolah
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oldData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absensi"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
          Radius.circular(15),
        )),
        child: Column(
          children: [
            TextField(
              controller: absentxt,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                  hintText: "Absen Siswa",
                  labelText: "Nomer Absen",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0))),
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
                  hint: Text((odl == null) ? 'Pilih' : '$odl'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    simpanData();
                  },
                  child: Text('Simpan'),
                ),
                RaisedButton(
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
