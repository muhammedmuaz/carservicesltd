import 'package:flutter/material.dart';
import 'package:services_app/widgets/home_widget.dart';

class CarServicesPostServicesCard extends StatelessWidget {
  const CarServicesPostServicesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          homepageItems(
              "Car For Sale",
              "https://cdn-icons-png.flaticon.com/128/2155/2155790.png",
              const Color(0xffE4DCCF),
              "10",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Car For Hire",
              "https://cdn-icons-png.flaticon.com/128/3393/3393345.png",
              const Color(0xffE4DCCF),
              "11",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Car Share",
              "https://cdn-icons-png.flaticon.com/128/4804/4804618.png",
              const Color(0xffE4DCCF),
              "12",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Chauffeur/Drivers For Hire",
              "https://cdn.iconscout.com/icon/free/png-256/free-driver-1785014-1518720.png",
              const Color(0xffE4DCCF),
              "13",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Tow Services",
              "https://cdn.iconscout.com/icon/premium/png-256-thumb/tow-truck-2980778-2476468.png",
              const Color(0xffE4DCCF),
              "28",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Car/Truck Mechanics",
              "https://tannerautorepairs.com.au/wp-content/uploads/2017/10/repair-service.png",
              const Color(0xffE4DCCF),
              "29",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Car & Truck Parts",
              "https://images.squarespace-cdn.com/content/v1/5420d068e4b09194f76b2af6/1593624596842-MSRYY384NEPB0IDNGF7K/piston2.png",
              const Color(0xffE4DCCF),
              "30",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Farm Equipment Hire",
              "https://cdn.iconscout.com/icon/premium/png-256-thumb/tractor-1977875-1667690.png?f=webp",
              const Color(0xffE4DCCF),
              "23",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Farm Equipment Hire",
              "https://cdn.iconscout.com/icon/premium/png-256-thumb/tractor-1977875-1667690.png?f=webp",
              const Color(0xffE4DCCF),
              "24",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Commercial Vehicles Hire",
              "https://www.bohr.de/media/6f805113-7b1c-4494-ae14-14a046a31512/fuhrpark.png?mw=600",
              const Color(0xffE4DCCF),
              "25",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Commercial Vehicle Sale",
              "https://www.bohr.de/media/6f805113-7b1c-4494-ae14-14a046a31512/fuhrpark.png?mw=600",
              const Color(0xffE4DCCF),
              "20",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Plant Equipment",
              "https://cdn.iconscout.com/icon/premium/png-256-thumb/tractor-1977875-1667690.png?f=webp",
              const Color(0xffE4DCCF),
              "21",
              1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 0.5,
              color: Colors.grey[600],
            ),
          ),
          homepageItems(
              "Other Services",
              "https://d2gfc6j4v8hvtl.cloudfront.net/wp-content/uploads/2018/11/247helpdesk.png",
              const Color(0xffE4DCCF),
              "22",
              1),
        ],
      ),
    );
  }
}
