import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostTile(),
    );
  }
}

class PostTile extends StatefulWidget {
  PostTile({Key? key}) : super(key: key);

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  //  local ve garbage collector olayı
  bool _iconpressedlike = false; // add like
  bool _iconpressedbasket = false; // add a basket list
  bool _iconpressedcomment = false; // open comment
  final _dummyAvatar =
      'https://i1.wp.com/butwhythopodcast.com/wp-content/uploads/2020/09/maxresdefault-28.jpg?fit=100%600&ssl=1';
  final _dummyImage =
      'https://i1.wp.com/butwhythopodcast.com/wp-content/uploads/2020/09/maxresdefault-28.jpg?fit=100%620&ssl=1';

  @override
  Widget build(BuildContext context) {
    return _postView(context);
    //);
  }

  Widget _postAuthorRow(BuildContext context) {
    const double avatarDiameter = 24;
    return GestureDetector(
      // to do -> go to profile ...
      // onTap: () => BlocProvider.of<HomeNavigatorCubit>(context).showProfile(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 4),
                child: CachedNetworkImage(
                  imageUrl: _dummyAvatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _postCommentsAndLikeButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              // onTap: () =>
              //     BlocProvider.of<HomeNavigatorCubit>(context).showComments(),
              child: Text(
                'Add Comment',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
            GestureDetector(
              // onTap: () =>
              //     BlocProvider.of<HomeNavigatorCubit>(context).showComments(),

              child: Text(
                'Add Like',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
            GestureDetector(
              // onTap: () =>
              //     BlocProvider.of<HomeNavigatorCubit>(context).showComments(),

              child: Text(
                'Add Basket',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              // onTap: () =>
              //     BlocProvider.of<HomeNavigatorCubit>(context).showComments(),
              icon: Icon(Icons.comment),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite),
              color: _iconpressedlike ? Colors.red : Colors.black,
              onPressed: () {
                setState(() {
                  _iconpressedlike = !_iconpressedlike;
                  // print(_iconpressedlike);
                });
              },
            ),
            IconButton(
              // onTap: () =>
              //     BlocProvider.of<HomeNavigatorCubit>(context).showComments(),
              // to do add basket
              icon: Icon(Icons.sell),
              color: _iconpressedbasket ? Colors.green : Colors.black,
              onPressed: () {
                setState(() {
                  _iconpressedbasket = !_iconpressedbasket;
                  // print(_iconpressedlike);
                });
              },
            ),
          ],
        ),
      ],
    );

    //);
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text('Welcome To My Selling store. Description'),
    );
  }

  Widget _postImage() {
    return AspectRatio(
      aspectRatio: 5,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: _dummyImage,
      ),
    );
  }

  Widget _postView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(context),
        _postImage(),
        _postCaption(),
        _postCommentsAndLikeButton(context),
      ],
    );
  }
}
