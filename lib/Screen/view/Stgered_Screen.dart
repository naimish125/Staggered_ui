import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../provider/Stgered_Provider.dart';

class StScreen extends StatefulWidget {
  const StScreen({Key? key}) : super(key: key);

  @override
  State<StScreen> createState() => _StScreenState();
}

class _StScreenState extends State<StScreen> {
  StProvider? St;
  StProvider? Sf;

  @override
  Widget build(BuildContext context) {
    Sf= Provider.of<StProvider>(context, listen: false);
    St = Provider.of<StProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Staggered Grid View",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: Colors.white54,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              pattern: [
                WovenGridTile(1),
                WovenGridTile(
                  5 / 8,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: Sf!.Images.length,
                  (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 107,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "${Sf!.Images[index]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "${Sf!.Name[index]}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
