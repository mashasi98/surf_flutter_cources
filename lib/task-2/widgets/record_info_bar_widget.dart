import 'package:flutter/material.dart';

class VinilInfoBarWidget extends StatelessWidget {
  const VinilInfoBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: const Color(0xffc89365),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.only(left: 10, top: 20),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff63492f),
                    blurRadius: 20.0,
                    offset: Offset(6.0, 6.0),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage('assets/images/p2.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: const Text("Vanilla \n Vinilla",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )))
          ],
        ),

    );
  }
}
