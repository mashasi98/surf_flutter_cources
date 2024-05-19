import 'package:flutter/material.dart';

class VinilInfoBarWidget extends StatelessWidget {
  const VinilInfoBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: const Color(0xffc89365),
      height: MediaQuery.of(context).size.height * 0.13 ,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 90,
              width: 90,
              margin: const EdgeInsets.only(left: 10, top: 40),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage('assets/images/logo3.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.only( top :40),
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
