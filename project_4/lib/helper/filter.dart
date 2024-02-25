import 'package:flutter/material.dart';

class fillter extends StatelessWidget {
  
  const fillter({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(
              height: 300,  width: 500,
              child: Card(  elevation: 5,  shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(15.0), ),
                clipBehavior: Clip.antiAlias, child: Stack( fit: StackFit.expand,
                  children: [  Image.asset( 'images/drone.png', fit: BoxFit.fill, ),
                    Positioned(   bottom: 10,left: 10, right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [  const Text( 'DJI .Jul 10, 2023', style: TextStyle(
                              color: Color(0xffb8b8b8),  fontSize: 12,
                              fontWeight: FontWeight.bold, ), ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(   'A month with DJI Mini 3 Pro',  style: TextStyle(
                                  color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),),
                              Image.asset('images/arrwo.png'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider( color: Color(0xff888888),
              thickness: 0.5,  height: 20, indent: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Stories",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFffffff),
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF888888),
                  ),
                ),
              ],
            ), ],
        );}}
