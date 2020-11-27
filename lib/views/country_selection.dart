import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/models/country_model.dart';
import 'home.dart';



class CountrySelection extends StatefulWidget {
  final bool falseloading;
  CountrySelection({this.falseloading});
  @override
  _CountrySelectionState createState() => _CountrySelectionState();
}

class _CountrySelectionState extends State<CountrySelection> {




  List<CountryModel> country = List<CountryModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    country = getCountry();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                  onPressed: (){
                    setState(() {

                    });
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.outbond_outlined),
                )
            )

        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Daily')  ,
            Text('News',style: TextStyle(color: Colors.blue),),
          ],
        ),
      ),
      body:
      SingleChildScrollView(
        child: Center(
          child: ListView.builder(

            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: country.length,
            itemBuilder: (context, index){
              return CountryTile(
                imageUrl: country[index].imageAssetUrl,
                countryName: country[index].countryName,
                countryCode: country[index].countryCode,
              );

            },

          ),
        ),
      ),
    );

  }
}

class CountryTile extends StatelessWidget {

  final imageUrl, countryName, countryCode;
  CountryTile({this.imageUrl, this.countryName, this.countryCode});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Home(
            countryCode: countryCode,
            countryImg: imageUrl,


          ),
        ));

      },
      child: Center(

        child: Container(
          padding: EdgeInsets.all(10),
          //margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,width: 400, height: 200,fit: BoxFit.cover,)
              ),
              Container(
                width: 400,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black38,
                ),
                child: Text(countryName, style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

