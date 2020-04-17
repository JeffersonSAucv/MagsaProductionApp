import 'package:flutter/material.dart';
import 'package:getflutter/components/shimmer/gf_shimmer.dart';

class Loaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final shimer = GFShimmer(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 46,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 8,
                  color: Colors.white,
                ),
                const SizedBox(height: 6),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: 8,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    )
  );


  return Container(
    height: double.infinity,
    child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[


            shimer,

            shimer,
  
            shimer,
  
            shimer,
  
            shimer,
  
            shimer,


          ],
      ),
  );
  }

  
}