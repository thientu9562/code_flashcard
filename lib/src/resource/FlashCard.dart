import 'package:flashcard/icons/app_icon.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
class FlashCard extends StatefulWidget {
  const FlashCard({Key? key}): super(key: key);
  @override
  _FlashCard createState() => _FlashCard();

}
class _FlashCard extends State<FlashCard> {

  _renderCard (context) {
     return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0, bottom: 5.0),
      // color: Colors.blue,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status){
          print(status);
        }, 
        front: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(3,6), blurRadius: 6)],           
            color: Color(0xFFa1bcff),
            borderRadius: BorderRadius.circular(10)
           ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                // alignment: Alignment.centerRight,
                margin: EdgeInsets.fromLTRB(300, 20, 0, 40),
                child: Image.asset("assets/images/heart.png", ),
                ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/economics.png")
                  )
                ),
              ),
              Text("Economic (n)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
              Text("Flashcard with the economic!", style: TextStyle(fontSize: 12),)
            ],
          ),
        ), 
        back: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, offset: Offset(3,6), blurRadius: 6)],
            color: Color(0xFFa1bcff),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [                           
              Text("ˌekəˈnämik", style: TextStyle(fontSize: 15),),
              Text("Thuộc về kinh tế", style: TextStyle(fontSize: 15),)
            ],
          ),
        ), 
      ),
    );
  }


  


  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text("Learn English with Flashcards"),
        
        leading: InkWell(
          onTap: () {
            _key.currentState!.openDrawer();
          },
          child: Icon(Icons.menu, size: 27,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              height: size.height * 1/10,
              child: Text("'Genius is 1% talent and 99% percent hard work' - Albert Einstein",
                   style: TextStyle(fontSize: 14),)
            ),
            Container(
             height: size.height *2/3,              
             child: PageView.builder(
               itemCount: 5,
               itemBuilder: (context, index) {
                 return Stack(
                   fit: StackFit.expand,
                   children: [ 
                     _renderCard(context)                                     
                   ],
                 );
               }
               ),
            )
          ],
        ),
      ),
    );
  }
}