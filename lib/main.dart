import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";


void main() {
  runApp(
    MaterialApp(
      home: ClassStateful("Najman"),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ClassStateful extends StatefulWidget {
  final String title;

  ClassStateful(this.title);

  @override
  _ClassStatefulState createState() => _ClassStatefulState();
}

class _ClassStatefulState extends State<ClassStateful> {
  int numer = 1;
  int numer2 = 1;
  int numer3 = 1;
  String photo =
      "https://cdn.discordapp.com/attachments/789821109821505546/819624770630320158/marcin.jpg";
  var primary = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: TextButton(
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      child: CircleAvatar(
                          radius: 60, backgroundImage: NetworkImage(photo)),
                      onPressed: () {
                        setState(() {
                          if (numer2 == 0)
                          {
                            photo =
                            "https://img.wprost.pl/img/marcin-najman-czekajacy-na-krzysztofa-stanowskiego/be/21/ca1e0be24e8eb2bc1c4c8ca42380.jpeg";
                            numer2++;
                          }
                          else
                          {
                            photo =
                            "https://cdn.discordapp.com/attachments/789821109821505546/819624770630320158/marcin.jpg";
                            numer2=0;
                          }
                        });
                      }),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Marcin Najman",
                        style: TextStyle(fontSize: 22, color: Colors.black),
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Text(
                      "Marcin Krzysztof Najman – polski pięściarz, zawodnik mieszanych sztuk walki i kick-bokser, promotor "
                          "boksu, a także osobowość medialna. Dwukrotny wicemistrz Polski juniorów w kick-boxingu. "
                          "W 2020 zainteresowanie w internecie wzbudził konflikt Najmana z dziennikarzem Krzysztofem Stanowskim.",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Moja ocena:",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            child: StarsRow(numer),
                            onPressed: () {
                              setState(() {
                                if (numer == 3) {
                                  numer = 0;
                                }
                                numer++;
                              });
                              ;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  white_box(
                      Icons.child_care, "13.03.1979", Icons.directions_run, "21.12.2020   12:00"),
                  white_box(Icons.star_border_rounded, "Mandarynki", Icons.favorite,
                      "Stanowski"),
                  white_box(
                      Icons.arrow_upward, "1,82 m", Icons.pregnant_woman, "112 kg"),
                ],
              )),
          onPressed: () {
            setState(() {
              if (numer3 == 0) {
                primary = Colors.pink;
                numer3++;
              } else {
                primary = Colors.blue;
                numer3 = 0;
              }
            });
          }),
    );
  }
}

class StarsRow extends StatefulWidget {
  final int rating;

  const StarsRow(
      this.rating, {
        Key key,
      }) : super(key: key);

  @override
  _StarsState createState() => _StarsState();
}

class _StarsState extends State<StarsRow> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (int i = 0; i < 3; i++) {
      if (i < widget.rating) {
        stars.add(Icon(
          Icons.star,
          color: Colors.black,
        ));
      } else {
        stars.add(Icon(
          Icons.star_border,
          color: Colors.black,
        ));
      }
    }
    return Row(children: stars);
  }
}

class white_box extends StatefulWidget {
  final IconData icon;
  final String text;
  final IconData icon2;
  final String text2;

  const white_box(
      this.icon,
      this.text,
      this.icon2,
      this.text2, {
        Key key,
      }) : super(key: key);
  @override
  _white_boxState createState() => _white_boxState(
    this.icon,
    this.text,
  );
}

class _white_boxState extends State<white_box> {
  var curenticon;
  var curenttext;
  var numer1 = 1;

  _white_boxState(this.curenticon, this.curenttext);
  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return TextButton(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              curenticon,
              color: Colors.black,
            ),
            Expanded(
              child: Text(
                (curenttext),
                style: TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {
        setState(() {
          if (numer1 == 0) {
            curenticon = widget.icon;
            curenttext = widget.text;
            numer1++;
          } else {
            curenticon = widget.icon2;
            curenttext = widget.text2;
            numer1 = 0;
          }
        });
      },
    );
  }
}