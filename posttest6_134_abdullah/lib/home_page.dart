import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:posttest6_134_abdullah/DataReview.dart';
import 'package:posttest6_134_abdullah/Game.dart';
import 'package:posttest6_134_abdullah/Navigation.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer :NavigationWid(),
        appBar: AppBar(
          centerTitle: true,
        title: Text('GamView'),
        ),
        body: Center(
              child : Padding(padding: EdgeInsets.all(10),
                child: listReview.isEmpty ?
                  Text("Yah ngak ada review!!" ,style: TextStyle(
                    fontSize: 35,
                    color: Colors.white
                  ))
                  :
                Column(
                  children: [
                    Text("Review Hari Ini", style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                    ),),
                    Expanded(
                      child: listCard(),
                  )
                  ],
                )
                ,
                ) 
              )

          );
  }
}
//Memmbuat Listview Card
  class listCard extends StatelessWidget {
    const listCard({super.key});

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        itemCount: listReview.length,
        itemBuilder: (context, index) => CardBox(context, index),
      );
    }
  }
  //membuat widget CardBox untuk setiap Review
  Widget CardBox(BuildContext context, int index){
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context){
          return GamePage(Idx: index);
        })
      );
    },
    child:
  Card(
          child:
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            color: Color(0xFEBEBE3),),
            child: Padding(
              padding: EdgeInsets.all(13),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 180,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listReview[index].namaGame,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              SizedBox(height: 12),
                              Text(
                              listReview[index].platform,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 12),
                              Text(
                                listReview[index].tahunRilis,
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(height: 12),
                              Text(
                                listReview[index].genre,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15), // Add padding here
                            child: CircleNumber(number:listReview[index].Score),
                          ),
                        
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            )
  );
  }
//membuat CircleUntuk Score
  class CircleNumber extends StatelessWidget {
    final String number;

    CircleNumber({required this.number});
    @override
    Widget build(BuildContext context) {
      return Container(
        width: 80, // Sesuaikan ukuran sesuai kebutuhan
        height: 80, // Sesuaikan ukuran sesuai kebutuhan
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }