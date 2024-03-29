import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:pet_paradise/authentication_module/module/app_user.dart';
import 'package:pet_paradise/blogs_module/module/blog_module.dart';
import 'package:pet_paradise/blogs_module/pages/blogger_dashboard.dart';
import 'package:pet_paradise/blogs_module/pages/bloog_reading_page.dart';
import 'package:pet_paradise/custom_widgets/custom_widgets.dart';
import 'package:pet_paradise/utils/colors.dart';
import 'package:pet_paradise/utils/size_config.dart';
import '../../firebase_services/firebase_helper.dart';
import '../../utils/responsive_controller.dart';

class BlogSelectionPage extends StatefulWidget {
  late final GeneralAppUser _appUser;
  late final List<Blog> _blogsList;
  late final Query _query;
  final TextEditingController searchController = TextEditingController();

  BlogSelectionPage({Key? key, required appUser}) : super(key: key) {
    this._appUser = appUser;
    _blogsList = List.empty(growable: true);
  }

  @override
  State<BlogSelectionPage> createState() => _BlogSelectionPageState();
}

class _BlogSelectionPageState extends State<BlogSelectionPage> {
  String searchValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._query = FirebaseHelper.BLOGS_REF;
  }

  @override
  Widget build(BuildContext context) {
    print("Build with ${widget._blogsList.length} blogs");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: transparentAppBar(context: context),
      backgroundColor: Colors.white,
      body: Responsive(
        mobile: mobile(context),
        tablet: tabletUI(),
        web: webUI(),
      ),
    );
  }

  ///mobile
  Widget mobile(context) {
    return Stack(
      children: [
        backgroundWidget(),
        Column(
          children: [
            Container(
              height: 200,
              child: leftAndRightPadding(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Blogs",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      clickAbleText(
                          text: "Your Blogs are here",
                          fontWeight: FontWeight.bold,
                          textSize: 14,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BloggerDashboard(
                                    appUser: widget._appUser)));
                          },
                          enable: true),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 55,
                    child: TextField(
                      controller: widget.searchController,
                      decoration: InputDecoration(
                        hintText: "Search by blog title",
                        label: Text("Search by blog title"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          searchValue = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: FirebaseAnimatedList(
              query: widget._query,
              itemBuilder: (context, dataSnapshot, animation, index) {
                print(index);
                var jsonValue = dataSnapshot.value;
                Blog blog = Blog.fromJson(jsonValue);
                print("Blog Reads : ${blog.numberOfReads}");
                if (searchValue.isEmpty) {
                  return readBlog(
                      context: context, child: blogCard(blog), blog: blog);
                } else if (searchValue.isNotEmpty &&
                    blog.blogTitle.toLowerCase() == searchValue.toLowerCase()) {
                  return readBlog(
                      context: context, child: blogCard(blog), blog: blog);
                } else {
                  return Center(
                    child: Text("No Data Found"),
                  );
                }
              }),
        )
      ],
    );
  }

  ///blog card
  Widget blogCard(Blog blog) {
    return Padding(
      padding: EdgeInsets.only(
          left: MyAppSize.width! * 0.05,
          right: MyAppSize.width! * 0.05,
          bottom: 10),
      child: Card(
        color: MyColors.LIGHT_GREEN,
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [MyColors.GREEN40, MyColors.GRADIENT_YELLOW],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(blog.blogImgURL),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(blog.blogTitle,overflow: TextOverflow.ellipsis,maxLines: 3,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "${blog.numberOfReads} Reads",
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///read a blog
  Widget readBlog(
      {required context, required Blog blog, required Widget child}) {
    return GestureDetector(
      onTap: () {
        increaseNumberOfReads(blog);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogReadingPage(blog: blog)));
      },
      child: child,
    );
  }

  void increaseNumberOfReads(Blog blog) async {
    var ref = FirebaseHelper.BLOGS_REF.child(blog.blogId);
     if(blog.writerId != widget._appUser.uid){
       print("previous reads : ${blog.blogTitle}");
       var numOfReads = blog.numberOfReads;
       ref.update({"numberOfReads" : numOfReads}).whenComplete(() {
         print("Number of reads increased");
       });

     }

  }
}
