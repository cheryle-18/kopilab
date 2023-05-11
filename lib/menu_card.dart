import 'package:flutter/material.dart';
import 'package:kopilab/detail_screen.dart';
import 'models/menu.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  const MenuCard({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailScreen(menu: menu);
        }));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Center(
                  child: Image.asset(menu.imageUrl)
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menu.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 10
                      ),
                      Text(
                        menu.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey
                        ),
                      ),
                      const SizedBox(
                          height: 10
                      ),
                      Text(
                        "Rp ${menu.price}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ]
                  ),
                )
              )
            ]
          )
        ),
      )
    );
  }
}
