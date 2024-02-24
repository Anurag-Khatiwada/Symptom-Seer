import 'package:flutter/material.dart';
import 'package:s_seer_final/alldetailspage.dart';
import 'package:s_seer_final/constants.dart';
import 'package:s_seer_final/drawer.dart';

 class AllPage extends StatelessWidget {
   AllPage({super.key, required this.all});
  List all=[];

   @override
   Widget build(BuildContext context) {
     return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Diseases Data"),
        backgroundColor: kPrimaryColor,
      ),
       body: Container(
        color: kBackgroundColor,
         child: Column(
          children: [
              Expanded(
                child: ListView.builder(
                itemCount: all.length,
                itemBuilder: (context,index){
                  return Card(
                    key: ValueKey(all[index]["id"]),
                    margin: EdgeInsets.all(10),
                    color: kPrimaryColor,
                    child: ListTile(
                      leading: Text(all[index]["id"],style: TextStyle(fontWeight: FontWeight.bold)),
                      title: Text(all[index]["name"],style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(all[index]["description"],overflow: TextOverflow.ellipsis,),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> AllDetailpage(num: index, name: all[index]["name"],symptoms: all[index]["symptoms"],description: all[index]["description"],  prevention: all[index]["prevention"],remedies:all[index]["remedies"])));
                      },
                    ),
                  );
                } ),
              ),
            ],
         ),
       ),
     );
   }
 }
