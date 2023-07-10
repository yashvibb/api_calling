import 'package:api_calling/advance/api_7/service_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class API7UI extends StatelessWidget {
  final List<ServiceClass> services;
  const API7UI({Key? key, required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(18),
    child: ListView.builder(
      itemCount: services.length,
      itemBuilder: (context,y){
              final service = services.elementAt(y);
              return Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.orangeAccent.withOpacity(0.1),
                  border: Border.all(color: Colors.orangeAccent,width: 0.75),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Service : ${service.name}"),
                    Text("Price : ${service.price}"),
                    Text("Service No. : ${service.no}"),
                    if(service.taxId != null)
                      Text("TaxID : ${service.taxId ?? '--'}"),
                    SizedBox(height: 10),
                    Text("Brands"),
                    SizedBox(height: 3),
                    SizedBox(height: 30,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: service.brands.length,
                        itemBuilder: (context,y){
                          final brand = service.brands.elementAt(y);
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orangeAccent.withOpacity(0.1),
                              border: Border.all(
                                color: Colors.orangeAccent,
                                width: 0.75
                              ),
                            ),
                            child: Text('Brand'),
                          );
                        }),),
                    SizedBox(height: 10),
                    Text("Model"),
                    SizedBox(height: 3),
                    SizedBox(height: 30,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: service.models.length,
                          itemBuilder: (context,k){
                            final model = service.models.elementAt(k);
                            return Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.orangeAccent.withOpacity(0.1),
                                border: Border.all(
                                    color: Colors.orangeAccent,
                                    width: 0.75
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text('${model.name} : ${model.brandId}'),
                                ],
                              ),
                            );
                          }),),
                  ],
                ),
              );
    },),);
  }
}
