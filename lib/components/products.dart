////Recent product component display on home page
import 'package:flutter/material.dart';
import '../pages/product_details.dart';

//Recent Products
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    //array of map
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Black dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 120,
      "price": 100,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 120,
      "price": 85,
    },
  ];

//display RecentProducts
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:const EdgeInsets.all(4.0),
            child:Single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          ));
        });
  }
}

//Single recent product
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  //constuctor called above
  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

//displauuy recent single product
  @override 
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //here we are passig the values of the product to the pruduct ddetails page saved in pages folder
                  builder: (context) => new ProductDetails( product_detail_name : prod_name,
                                                             product_detail_new_price:  prod_price,
                                                             product_detail_old_price:  prod_old_price,
                                                             product_detail_picture: prod_picture                       
                                                          )
                       )
                  ),   
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child:Row(
                      children: <Widget>[
                        Expanded(
                         child:Text(prod_name,style:TextStyle(fontWeight:FontWeight.bold,fontSize:16.0))
                        ),
                        Text("${prod_price}",style:TextStyle(fontWeight: FontWeight.bold,color:Colors.red))
                      ],)
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
