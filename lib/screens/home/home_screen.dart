import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medapp/constants/constantes.dart';
import 'package:medapp/screens/home/widgets/blog_item.dart';
import 'package:medapp/screens/home/widgets/categorie_widget.dart';
import 'package:medapp/screens/home/widgets/headline_row.dart';
import 'package:medapp/screens/schedule/schedule_screen.dart';
import 'package:medapp/styles/vertical_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(48),
                      bottomLeft: Radius.circular(48))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find your",
                    style: GoogleFonts.montserrat(fontSize: 23),
                  ),
                  Text(
                    "Consultant",
                    style: GoogleFonts.montserrat(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  VerticalSpace.vSpace32,
                  SizedBox(
                    height: 100,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(36),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Search by name",
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: VerticalSpace.vSpace8,
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: HeadlineRow(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScheduleScreen(),
                          ));
                    },
                    title: "Categories")),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: ListView.builder(
                itemCount: Constantes.specialities.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategorieWidget(index: index);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: HeadlineRow(onPressed: () {}, title: "Latest Blog")),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16.0),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return const BlogItem(
                          url: "https://picsum.photos/110/110",
                          title: "Why need to check up?",
                          time: "2 hours ago",
                          notation: 4.5);
                    })),
          )
        ],
      ),
    );
  }
}
