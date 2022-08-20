import 'package:bootickets/screens/Place.dart';
import 'package:bootickets/screens/hotel_screen.dart';
import 'package:bootickets/screens/search_screen.dart';
import 'package:bootickets/screens/ticket_view.dart';
import 'package:bootickets/utils/app_info_list.dart';
import 'package:bootickets/utils/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Gap(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text("Travel Agency", style: Styles.headlineStyle3,),
                         const Gap(5),
                         Text("Al-Mutairi travels", style: Styles.headlineStyle1),

                      ],
                    ),
                   Container(
                     height: 50,
                     width: 50,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       image: const DecorationImage(
                         fit: BoxFit.fitHeight,
                         image: AssetImage(
                           "assets/images/mutairi.jpg"
                         )
                       )
                     ),
                   )
                  ],
                ),
                const Gap(25),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_search_regular, color: Color(0xFFBFC205)),
                      Text("Search", style: Styles.headlineStyle4,)
                    ],
                  ),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcomming Flights", style: Styles.headlineStyle2,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()),);
                        print("You Are Tapped");
                      },
                      child: Text("View All", style: Styles.textStyle.copyWith(color: Styles.primaryColor),),
                    )
                  ],
                )
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: ticketList.map((singleTicket) => TicketView(ticket: singleTicket,)).toList(),
            ),
          ),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Place To Visit", style: Styles.headlineStyle2,),
                InkWell(
                    onTap: (){
                      print("You Are Tapped");
                    },

                    child: Text("View All", style: Styles.textStyle.copyWith(color: Styles.primaryColor),)
                )
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
            child: Row(
           children: placelList.map((singlePlace) => Place(place: singlePlace)).toList(),
            ),),
          const Gap(15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hotel Bookings", style: Styles.headlineStyle2,),
              ],
            ),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: hotelList.map((singleHotel) => HotelScreen(hotel: singleHotel)).toList(),
            ),),
        ],
      ),
    );
  }
}
