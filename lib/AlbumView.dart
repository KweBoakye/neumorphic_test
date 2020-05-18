




import 'package:flutter/material.dart';

class AlbumView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        //crossAxisAlignment: CrossAxisAlignment.end,
        //mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          SizedBox(height: 40),
          titleWidget(),
          SizedBox(height: 60,),
          buttonAndAlbumArtRow(),
          SizedBox(height: 30,),
          Expanded(child: songList())
        ],
      ),
    );
  }
  
  final List<Song> songs = [
    Song("Ain't No Time","Future"),
    Song("In Her Mouth","Future"),
    Song("Maybach","Future"),
    Song("Xanny Family","Future"),
    Song("Lil Haiti Baby","Future"),
    Song("Photo Copied","Future"),
    Song("Seven Rings","Future"),
    Song("Lie to Me","Future"),
    Song("Program","Future"),
    Song("Low Life ","Future,  The Weeknd" ) ,
    Song("Fly Shit Only","Future")  ];


  Widget titleWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('EVOL'),
        SizedBox(width: 10,),
        Text('FUTURE')
      ],
    );
  }

    Widget buttonAndAlbumArtRow(){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(

            decoration: BoxDecoration(
              color: Colors.black54,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.grey,), onPressed: () {},
            ),
          ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(

              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 4.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/albumart.jpg'),
              )
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black54,
              shape: BoxShape.circle
            ),
            child: IconButton(icon: Icon(Icons.more_horiz, color: Colors.grey), onPressed: () {},
            ),
          ),
        ],
      );
    }

    Widget songItem(String songTitle, String artist) {
      return Row(

        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(songTitle),
              SizedBox(height: 4,),
              Text(artist)
            ],
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle
              ),
              child: IconButton(icon: Icon(Icons.play_arrow,
                color:Colors.grey ,), onPressed: () {},))
        ],
      );
    }

    Widget songList(){
      return ListView.builder(
        shrinkWrap: true,
        itemCount: songs.length,
          itemBuilder: (BuildContext context, int index) {
          return Container(

              child: songItem(songs[index].songTitle, songs[index].artist));
          });
    }
    
}

class Song{
  const Song(this.songTitle, this.artist);
  final String songTitle;
  final String artist;
}


extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount);
  }
}

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double bevel;
  final Offset blurOffset;

  NeumorphicContainer({
    Key key,
    this.child,
    this.bevel = 10.0,
    // We can't initiailize it with default background here, unless we
    // know it aforehead and don't bother with dynamic themes.
    this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}



