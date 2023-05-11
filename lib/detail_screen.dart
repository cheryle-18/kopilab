import 'package:flutter/material.dart';
import 'models/menu.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = '/detail';
  final Menu menu;
  const DetailScreen({Key? key, required this.menu}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: Image.network(widget.menu.imageUrl2,fit: BoxFit.cover),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 350),
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                      color: Color(0xFFFAFAFA),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.menu.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5
                          ),
                          Text(
                            widget.menu.category,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black
                            ),
                          ),
                          const SizedBox(
                            height: 15
                          ),
                          const Text(
                            "Description:",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            ),
                          ),
                          Text(
                            widget.menu.description,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            ),
                          ),
                          const SizedBox(
                            height: 15
                          ),
                          const SizedBox(
                            height: 10
                          ),
                          Row(
                            children: [
                              Text(
                                "Rp ${widget.menu.price}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              if(qty > 0) {
                                                qty--;
                                              }
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.brown,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), bottomLeft: Radius.circular(5.0)),
                                            ),
                                          ),
                                          child: const Text(
                                              '-',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                              )
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        height: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                left: BorderSide(width: 0.5, color: Colors.brown),
                                                right: BorderSide(width: 0.5, color: Colors.brown),
                                              ),
                                              color: Colors.white
                                          ),
                                          child: Center(
                                            child: Text(
                                              qty.toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              qty++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.brown,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(5.0), bottomRight: Radius.circular(5.0)),
                                            ),
                                          ),
                                          child: const Text(
                                              '+',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                    const SizedBox(
                                        width: 10
                                    ),
                                    SizedBox(
                                      width: 120,
                                      height: 30,
                                      child: ElevatedButton(
                                          onPressed: (){
                                            if(qty>0){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(content: Text("${qty.toString()} ${widget.menu.name} added to cart"))
                                              );
                                              Navigator.pop(context);
                                            }
                                            else{
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text("Please add quantity"))
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.brown
                                          ),
                                          child: const Text(
                                              "Add to Cart",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white
                                              )
                                          )
                                      ),
                                    )
                                  ]
                                ),
                              )
                            ]
                          )
                        ]
                      ),
                    )
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }
}