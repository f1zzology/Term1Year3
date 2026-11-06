import 'package:flutter/material.dart';

// /// EX 5 — Your welcome page (prepare for test)
// ///
// /// Goal: build a welcome page of your own choice combining everything:
// ///   Scaffold, Row, Column, Center, Expanded, SingleChildScrollView,
// ///   Container, SizedBox, Padding, Text, TextStyle, BoxDecoration, EdgeInsets
// ///
// /// Suggested layout from the sheet:
// ///   header bar  → 3 black/orange title bars
// ///   body        → 2 hobby cards (Soccer, Flutter)
// ///   footer      → 3 white circles (use BoxShape.circle)
class Exercise5 extends StatelessWidget {
  const Exercise5({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           Container(
  //           height : 100 ,
  //           color: Colors.green,
  //           child: const Center(
  //           child:  Text("welcome", style: TextStyle(color: Colors.white,fontSize: 24),
  //           ),
  //           ),
  //           ),
  //          Padding(padding: const EdgeInsets.all(16),
  //          child: Container(
  //           height: 50,
  //           padding: const EdgeInsets.symmetric(horizontal: 16),
  //           alignment: Alignment.centerLeft,
  //             decoration: BoxDecoration(
  //               color: Colors.black,
  //               borderRadius: BorderRadius.circular(16),
  //             ),
  //               child: const Text(
  //               'My hobbies',
  //               style: TextStyle(color: Colors.white, fontSize: 16),

  //             ),
  //          )
  //          ,),

  //          Padding(padding: EdgeInsets.symmetric(horizontal: 16),
  //          child: Row(
  //           children: [
  //             Expanded(child: Container(
  //               height: 120,
  //               decoration: BoxDecoration(
  //                 color: Colors.orange[200],
  //                 borderRadius: BorderRadius.circular(16),
  //               ),
  //               child: Center(
  //                 child: Text("Soccer", style: TextStyle(color: Colors.white,),),
  //               ),
  //             ),
  //             ),
  //              const SizedBox(width: 16),
  //               Expanded(
  //                 child: Container(
  //                   height: 120,
  //                   decoration: BoxDecoration(
  //                     color: Colors.deepOrange[800],
  //                     borderRadius: BorderRadius.circular(16),
  //                   ),
  //                   child: const Center(
  //                     child: Text('Flutter',
  //                         style: TextStyle(color: Colors.white)),
  //                   ),
  //                 ),
  //               ),
  //           ],
  //          ),),

  //         ],
  //       ),

  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // HEADER
          Container(
            height: 80,
            color: Colors.deepOrange[300],
            child: const Center(
              child: Text(
                'Welcome !',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          // "MY HOBBIES" BAR
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'My hobbies',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

          // HOBBY CARDS
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Soccer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[800],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text(
                        'Flutter',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // EMPTY SPACE (pushes footer to the bottom)
          const Expanded(child: SizedBox()),

          // FOOTER
          Container(
            height: 70,
            color: Colors.deepOrange[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                (_) => Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
