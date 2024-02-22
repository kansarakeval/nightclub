import 'package:flutter/material.dart';

class SettingScreeen extends StatefulWidget {
  const SettingScreeen({super.key});

  @override
  State<SettingScreeen> createState() => _SettingScreeenState();
}

class _SettingScreeenState extends State<SettingScreeen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.30,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.blue.shade800,
              ),
              child: Column(

                children: [
                  Align(alignment: Alignment.centerRight,child: IconButton(onPressed: (){}, icon: Icon(Icons.clear,color: Colors.white,))),
                  ClipRRect( borderRadius: BorderRadius.circular(10),child: Image.asset("assets/img/keval.png",height: 120,)),
                  const SizedBox(height: 10,),
                  const Text("Keval Kansara",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  const SizedBox(height: 2,),
                  const Text("M.In.Flutter",style: TextStyle(fontSize: 18,color: Colors.white),),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard_customize_outlined)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.event)),
                    title: Text("Events",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.interests_outlined)),
                    title: Text("Interests",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.manage_search)),
                    title: Text("Search Event",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.location_on_outlined)),
                    title: Text("Search City",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.qr_code_outlined)),
                    title: Text("Tickets",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.reviews_outlined)),
                    title: Text("Reviews",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                  ListTile(
                    leading: IconButton(onPressed: () {},icon: Icon(Icons.dashboard)),
                    title: Text("Dashboard",style: TextStyle(fontSize: 18),),
                    trailing: IconButton(onPressed: (){},icon: Icon(Icons.navigate_next),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
