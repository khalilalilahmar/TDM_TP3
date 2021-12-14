import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatefulWidget {
  final String img;
  final String descr;
  final String livraison;
  final String price;
  final String Warranty;
  final String link;

  const ProductDetailScreen(
      {@required this.img,
      @required this.descr,
      @required this.livraison,
      @required this.price,
      @required this.Warranty,
      @required this.link});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState(price);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool garantie = true;
  String t;

  _ProductDetailScreenState(String price) {
    this.t = price;
  }

  String calc(String price) {
    var price1 = double.parse(price);
    price1 = price1 * 0.8;
    return price1.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  widget.img,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Divider(
              color: Colors.black87,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Price : ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18,color:Colors.deepOrangeAccent),
                    ),
                    garantie ? Text(widget.price) : Text(calc(widget.price))
                  ],
                ),
                Row(
                  children: [
                    Text("With Warranty ?  ",style: TextStyle(fontSize: 18,color:Colors.deepOrangeAccent),),
                    Checkbox(
                      value: garantie,
                      onChanged: (value) {
                        setState(() {
                          garantie = !garantie;
                          print(garantie);
                        });
                      },
                    )
                  ],
                )
              ],
            ),
            Text("Description",style: TextStyle(fontSize: 18,color:Colors.deepOrangeAccent),),
            Text(widget.descr),
            Text("Livraison",style: TextStyle(fontSize: 18,color:Colors.deepOrangeAccent),),
            Text(widget.livraison),
            Text("Warranty",style: TextStyle(fontSize: 18,color:Colors.deepOrangeAccent),),
            Text(widget.Warranty),
            Text("Link : ",style: TextStyle(fontSize: 18,color:Colors.deepOrangeAccent),),
            InkWell(
              onTap: () {
                launch(widget.link);
              },
              child: Text(widget.link,style: TextStyle(fontSize: 16,color:Colors.blue,decoration: TextDecoration.underline),)
            )
          ],
        ),
      )),
    );
  }
}
