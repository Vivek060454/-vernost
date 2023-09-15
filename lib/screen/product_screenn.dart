import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_bloc_event.dart';
import '../bloc/product_bloc_state.dart';


class Home extends StatefulWidget {
  const Home({super.key, });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(getdataEvent());


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("List of Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              BlocBuilder <ProfileBloc,ProductState>(
                  builder:(context,state){
                    if(state is ProductLoading){
                      Center(child: CircularProgressIndicator());
                    }
                    if(state is ProductSuccess){

                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [

                          SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            for(var i=0; i<state.model.length; i++)...[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,8,13,0),
                                child:   Container(

                                  height: 150,

                                  width: 280,

                                  decoration: BoxDecoration(

                                    color: Colors.white,

                                    borderRadius:  BorderRadius.circular(13),

                                    border: Border.all(color: Colors.grey,),

                                    boxShadow: [

                                      BoxShadow(

                                          color: Colors.grey,



                                          offset: Offset(0,- 3)),

                                      BoxShadow(

                                          color: Color.fromRGBO(0, 0, 100, 0),

                                          offset: Offset(3, 3),

                                          blurRadius: 2,

                                          spreadRadius: 5)

                                    ],

                                  ),

                                  child:   Padding(

                                    padding: const EdgeInsets.all(8.0),

                                    child: Column(

                                      children: [

                                        Row(

                                            children:[

                                              Container(

                                                  decoration: BoxDecoration(

                                                    // color: Colors.black,

                                                    borderRadius: BorderRadius.all(Radius.circular(20.0)),

                                                  ),

                                                  child: Image.network(state.model[i].image,width: 50,height: 50,)),

                                              SizedBox(

                                                width: 155,

                                              ),

                                              Icon(Icons.favorite,color: Colors.red,)

                                            ]

                                        ),

                                        Text(state.model[i].title,maxLines:1, overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                                        SizedBox(

                                          height: 10,

                                        ),

                                        Text(state.model[i].description,maxLines:1, overflow: TextOverflow.ellipsis,  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),

                                        SizedBox(

                                          height: 5,

                                        ),

                                        Row(

                                          children: [

                                            Text(state.model[i].category.toString(),maxLines:1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,color: Colors.red),),

                                          ],

                                        ),



                                      ],

                                    ),

                                  ),





                                ),
                              ),
                            ]
                            ])),
                            Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Row(
                                children: [
                                  Text('Product list',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                ],
                              ),
                            ),
                            for(var index=0; index<state.model.length; index++)...[
                              Padding(
                                padding: const EdgeInsets.only(top: 8,bottom: 8),
                                child: Container(
                                  decoration: BoxDecoration(

                                    color: Colors.white,

                                    borderRadius:  BorderRadius.circular(13),

                                    border: Border.all(color: Colors.grey,),

                                    boxShadow: [

                                      BoxShadow(

                                          color: Colors.grey,



                                          offset: Offset(0,- 1)),

                                      BoxShadow(

                                          color: Color.fromRGBO(0, 0, 100, 0),

                                          offset: Offset(3, 3),

                                          blurRadius: 1,

                                          spreadRadius: 2)

                                    ],

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minWidth: 50,
                                              minHeight: 260,
                                              maxWidth: 55,
                                              maxHeight: 264
                                          ),
                                          child: Image.network(state.model[index].image,width: 50,height: 50,)),

                                      title: Text(state.model[index].title,maxLines:1, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
                                      subtitle: Text(state.model[index].description,maxLines:2, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,color: Colors.black54),),
                                      // trailing: Text(state.model[index].category.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),

                                    ),
                                  ),
                                ),
                              ),

                            ]
                          ],
                        ),
                      );
                      // return Text(
                      // model.item[0].name
                      // );
                    }
                    if(state is ProductError){
                      return Text(state.msg);                    }
                    return Center(child: CircularProgressIndicator());

                  }


              ),



            ],
          ),
        ),
      ),

    );

  }
}