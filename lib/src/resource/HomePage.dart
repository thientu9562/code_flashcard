

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}): super(key: key);

  @override
  _MyHomePage createState() => _MyHomePage();

}
class _MyHomePage extends State<MyHomePage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      body: ListView(
        children: 
          [Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                //card 1
                Card(
                  color: Color(0xffe5ebe7),
                  child: Container(                   
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Row(                     
                      children: <Widget>[                    
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Container(
                              width: 100,
                              height: 100,       
                              //tạo viền cho hình                  
                              decoration: BoxDecoration(                               
                                borderRadius: BorderRadius.circular(50),
                                 border: Border.all(color: Colors.white, width: 2),
                              ),
                              //làm ảnh thành hình tròn
                              child: ClipRRect( 
                                borderRadius: BorderRadius.circular(100), 
                                child: Image.asset("assets/images/economics.png", 
                                          fit: BoxFit.fill, 
                                 ) 
                              ), 
                          ),
                        ),                                                        
                        Text("Economic", 
                              style: TextStyle(
                                color: Colors.blue, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                  ),
                  ),
                  //card 2
                Card(
                  color: Color(0xffe5ebe7),
                  child: Container(                   
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Row(                     
                      children: <Widget>[                    
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Container(
                              width: 100,
                              height: 100,       
                              //tạo viền cho hình                  
                              decoration: BoxDecoration(                               
                                borderRadius: BorderRadius.circular(50),
                                 border: Border.all(color: Colors.white, width: 2),
                              ),
                              //làm ảnh thành hình tròn
                              child: ClipRRect( 
                                borderRadius: BorderRadius.circular(100), 
                                child: Image.asset("assets/images/marketing.png", 
                                          fit: BoxFit.fill, 
                                 ) 
                              ), 
                          ),
                        ),                                                        
                        Text("Marketing", 
                              style: TextStyle(
                                color: Colors.blue, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                  ),
                  ),
                  //card 3
                Card(
                  color: Color(0xffe5ebe7),
                  child: Container(                   
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Row(                     
                      children: <Widget>[                    
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Container(
                              width: 100,
                              height: 100,       
                              //tạo viền cho hình                  
                              decoration: BoxDecoration(                               
                                borderRadius: BorderRadius.circular(50),
                                 border: Border.all(color: Colors.white, width: 2),
                              ),
                              //làm ảnh thành hình tròn
                              child: ClipRRect( 
                                borderRadius: BorderRadius.circular(100), 
                                child: Image.asset("assets/images/contract.png", 
                                          fit: BoxFit.fill, 
                                 ) 
                              ), 
                          ),
                        ),                                                        
                        Text("Contract", 
                              style: TextStyle(
                                color: Colors.blue, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                  ),
                  ),
                  //card 4
                Card(
                  color: Color(0xffe5ebe7),
                  child: Container(                   
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Row(                     
                      children: <Widget>[                    
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Container(
                              width: 100,
                              height: 100,       
                              //tạo viền cho hình                  
                              decoration: BoxDecoration(                               
                                borderRadius: BorderRadius.circular(50),
                                 border: Border.all(color: Colors.white, width: 2),
                              ),
                              //làm ảnh thành hình tròn
                              child: ClipRRect( 
                                borderRadius: BorderRadius.circular(100), 
                                child: Image.asset("assets/images/negotiations.png", 
                                          fit: BoxFit.fill, 
                                 ) 
                              ), 
                          ),
                        ),                                                        
                        Text("Negotiation", 
                              style: TextStyle(
                                color: Colors.blue, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                  ),
                  ),
                  //card 5
                Card(
                  color: Color(0xffe5ebe7),
                  child: Container(                   
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Row(                     
                      children: <Widget>[                    
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Container(
                              width: 100,
                              height: 100,       
                              //tạo viền cho hình                  
                              decoration: BoxDecoration(                               
                                borderRadius: BorderRadius.circular(50),
                                 border: Border.all(color: Colors.white, width: 2),
                              ),
                              //làm ảnh thành hình tròn
                              child: ClipRRect( 
                                borderRadius: BorderRadius.circular(100), 
                                child: Image.asset("assets/images/business_planning.png", 
                                          fit: BoxFit.fill, 
                                 ) 
                              ), 
                          ),
                        ),                                                        
                        Text("Business Planning", 
                              style: TextStyle(
                                color: Colors.blue, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                  ),
                  ),
                  //card 6
                Card(
                  color: Color(0xffe5ebe7),
                  child: Container(                   
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Row(                     
                      children: <Widget>[                    
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Container(
                              width: 100,
                              height: 100,       
                              //tạo viền cho hình                  
                              decoration: BoxDecoration(                               
                                borderRadius: BorderRadius.circular(50),
                                 border: Border.all(color: Colors.white, width: 2),
                              ),
                              //làm ảnh thành hình tròn
                              child: ClipRRect( 
                                borderRadius: BorderRadius.circular(100), 
                                child: Image.asset("assets/images/contract.png", 
                                          fit: BoxFit.fill, 
                                 ) 
                              ), 
                          ),
                        ),                                                        
                        Text("Commerce", 
                              style: TextStyle(
                                color: Colors.blue, 
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                        ),
                      ],
                      ),
                  ),
                  ),
              ],
            )
          ),
        ],
      )
    );
  }
}




