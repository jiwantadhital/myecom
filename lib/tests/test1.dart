import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  @override
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Collapsing Toolbar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.network(
                        "https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg",
                        fit: BoxFit.cover,
                      )),
                      bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight: Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(icon: Icon(Icons.info), text: "Tab 1"),
                        Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                        Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 3"),
                      ],
                    ),
                      ],
                    ),
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(top: 10),
                ),
                preferredSize: Size.fromHeight(20),
                ),
                ),
                // SliverPersistentHeader(
                //   delegate: _SliverAppBarDelegate(
                //     TabBar(
                //       labelColor: Colors.black87,
                //       unselectedLabelColor: Colors.grey,
                //       tabs: [
                //         Tab(icon: Icon(Icons.info), text: "Tab 1"),
                //         Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                //         Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 3"),
                //       ],
                //     ),
                //   ),
                //   pinned: true,
                // ),
              ];
            },
            body: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: TabBarView(children: [
                Text("H"),
                Text("H"),
                Text("H"),
              ]),
            )
          ),
        ),
      );
    }
}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
    _SliverAppBarDelegate(this._tabBar);

    final TabBar _tabBar;

    @override
    double get minExtent => _tabBar.preferredSize.height;
    @override
    double get maxExtent => _tabBar.preferredSize.height;

    @override
    Widget build(
        BuildContext context, double shrinkOffset, bool overlapsContent) {
      return  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        child: _tabBar,
      );
    }

    @override
    bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
      return false;
    }
  }
