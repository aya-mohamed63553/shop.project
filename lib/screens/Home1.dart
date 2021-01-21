import 'package:flutter/material.dart';
import 'package:project/models/getShopsModel1.dart';
import 'package:project/provider/getShopsProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GetShops model;
  Future aya() async {
    await Provider.of<GetShopProvider>(context, listen: false)
        .getShops()
        .then((value) => model = value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isInit = true;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      await aya();
      setState(() {
        isInit = false;
      });
    }
    // await aya();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المتاجر'),
      ),
      body: isInit
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: model.data.length,
              itemBuilder: (context, i) => Card(
                      child: ListTile(
                    leading: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.network(
                              model.data[i].photo,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    title: Text(
                      model.data[i].name,
                    ),
                    subtitle: Text(model.data[i].city),
                    trailing: Text(model.data[i].department),
                  ))),
    );
  }
}
