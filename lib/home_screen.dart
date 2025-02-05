import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizz_app/app_routes.dart';
import 'package:quizz_app/available_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final Set<String> _selectedChips = {"Java", "Web development"};

  // List of chip labels
  final List<String> _chipLabels = [
    "Java Script",
    "C#",
    "C++",
    "Python",
    "Java",
    "Swift",
    "Web development",
    "Android",
    "IOS",
    "Game Development",
    "Artificial Intelligence",
    "Kotlin",
    "React Native",
    "React JS",
  ];
  @override
  Widget build(BuildContext context) { 
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 0,
        ),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height:10,),
          //  Image.asset("assets/images/remainder_app_logo.png", 
          //     // height: 30,
          //     // width: 30,
          //     fit:BoxFit.cover, ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:11.0,left:20),
                child: Text("Stumbl",style: TextStyle(color:Colors.black,fontSize:25,fontFamily:"Nunito",fontWeight:FontWeight.bold),),
              ),
              Image.asset("assets/images/logo_remainder_app.png", 
              height: 30,
              width: 30,
              fit:BoxFit.cover, filterQuality: FilterQuality.high),
              Padding(
                padding: const EdgeInsets.only(top:11.0,left:5),
                child: Text("Board",style: TextStyle(color:Colors.black,fontSize:25,fontFamily:"Nunito",fontWeight:FontWeight.bold),),
              ),
            ],
          ),
         Divider(
          indent:20,
          endIndent: 15,
          height: 10,
          color: Colors.black,
          thickness: 1,
         ),
          Container(
            height: 40,
            width: double.infinity,
            // color: Colors.amber,
            margin: EdgeInsets.symmetric(horizontal:20,vertical:20),
            child: TextField(
              cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color:Colors.black,fontFamily:"Nunito",fontWeight:FontWeight.w500),
                  suffixIcon: const Icon(Icons.search,color: Colors.black,),
                  contentPadding: EdgeInsets.only(left:20,right:20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black,width:2)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.black,width:2)
                  ),
                ),
              ),
          ),
            const SizedBox(height:5),
            // Adaptive Chips
            Container(
              // color: Colors.blueGrey,
              child: Expanded(
                // flex: 1,s
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 5.0,
                  alignment: WrapAlignment.center,
                  children: _chipLabels.map((label) {
                    final isSelected = _selectedChips.contains(label);
                    return FilterChip(
                      // labelPadding: EdgeInsets.only(left:5,right:5),
                      // padding: EdgeInsets.only(left:10,right:10),
                      label:  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontFamily: "Nunito",
                          fontSize: 13,
                        ),
                      ),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                      if (!isSelected) ...[
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 16,
                        ),
                      ]
                    ],
                  ),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                      backgroundColor: Colors.white,
                      selectedColor: Colors.black,
                      selected: isSelected,
                      onSelected: (bool value) {
                        setState(() {
                          if (value) {
                            _selectedChips.add(label);
                          } else {
                            _selectedChips.remove(label);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
       
           
        ],
       ),
       bottomNavigationBar:  GestureDetector(
        onTap: () => Navigator.pushNamed(context,AppRoutes.ROUTE_AVAILABLE_TASK), 
         child: Container(
                height: 55,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal:20, vertical:40),
                padding: EdgeInsets.symmetric(horizontal:20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Save Topics",
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Nunito",
                          fontSize: 14,
                        ),
                      ),
                      Icon(FontAwesomeIcons.arrowRightLong,size:16,color: Colors.white,)
                  ],
                ),
              ),
       ),
      ),
    );
  }
}