import 'package:flutter/material.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_page_model.dart';
import 'package:moscow_city_hack_web/pages/catalog_page/catalog_screen/grid/catalog_page_grid_company_card.dart';
import 'package:provider/provider.dart';
import 'catalog_page_grid_card.dart';

class CatalogPageGrid extends StatelessWidget {
  const CatalogPageGrid({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Consumer<CatalogPageModel>(
              builder: (context, model, child) {
                if (model.superSearch == false) {
                  switch (model.connection.proccessState) {
                    case -1:
                      return Center(child: Text('Введите что-нибудь в поиск', style: TextStyle(fontSize: 18),),);
                    case 1:
                      return Center(child: CircularProgressIndicator());
                    case 2:
                      return GridView.builder(
                          controller: ScrollController(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.528
                          ),
                          itemCount: model.connection.data.length,

                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: CatalogPageGridCard(
                                item: model.connection.data[index],),
                            );
                          }
                      );
                  }
                } else {
                  switch (model.connection.proccessState) {
                    case -1:
                      return Center(child: Text('Введите что-нибудь в поиск', style: TextStyle(fontSize: 18),));
                    case 1:
                      return Center(child: CircularProgressIndicator());
                    case 2:
                      return GridView.builder(
                          controller: ScrollController(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 0,
                              childAspectRatio: 0.528
                          ),
                          itemCount: model.connection.data.length,

                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: CatalogPageGridCompanyCard(
                                item: model.connection.company[index],),
                            );
                          }
                      );
                  }
                }
                return SizedBox();
              },
            )
          )
        ),
        SizedBox(width: 60,)
      ],
    );
  }
}