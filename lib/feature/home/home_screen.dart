import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tradaru_test/data/model/product_model.dart';
import 'package:tradaru_test/feature/detail_home/detail_home_page.dart';
import 'package:tradaru_test/feature/home/component/container_filter_component.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/constant.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/utils/route.dart';
import 'package:tradaru_test/widget/loading_widget.dart';

import './home_page.dart';
import './bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _blocHome;
  List<ProductItem> productList = [];
  List<ProductItem> tasGunungItem = [];
  List<ProductItem> tasKantorItem = [];
  int _selectedFilterIndex = 1;

  @override
  void initState() {
    _blocHome = BlocProvider.of<HomeBloc>(context);
    super.initState();
    _blocHome.add(FetchHomeEvent());
  }

  @override
  void dispose() {
    _blocHome.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is HomeStateLoading) {
          LoadingWidget();
        }
        if (state is HomeStateError) {
          Center(
            child: Text(
              state.error
            ),
          );
        }
        if (state is HomeStateLoaded) {
          tasGunungItem = state.data.where((element) => element.category == MOUNT).toList();
          tasKantorItem = state.data.where((element) => element.category == OFFICE).toList();
          productList = tasGunungItem;
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return OrientationBuilder(builder: (context, orientation) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(
                    "Our Product",
                    style: AppTextStyle.extraLargeText.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        ContainerFilterComponent(
                          onTap: (){
                            setState(() {
                              _selectedFilterIndex = 1;
                              productList = tasGunungItem;
                            });
                          },
                          colorContainer: _selectedFilterIndex == 1 ? ResColor.colorPrimary : Colors.white,
                          colorText: _selectedFilterIndex == 1 ? Colors.white : Colors.black,
                          text: 'Tas Gunung',
                          iconContainer: _selectedFilterIndex == 1
                              ? 'assets/images/mountain_selected.png' : 'assets/images/mountain_unselected.png',
                        ),
                        SizedBox(width: 10,),
                        ContainerFilterComponent(
                          onTap: (){
                            setState(() {
                              _selectedFilterIndex = 2;
                              productList = tasKantorItem;
                            });
                          },
                          colorContainer: _selectedFilterIndex == 2 ? ResColor.colorPrimary : Colors.white,
                          colorText: _selectedFilterIndex == 2 ? Colors.white : Colors.black,
                          text: 'Tas Kantor',
                          iconContainer: _selectedFilterIndex == 2
                              ? 'assets/images/work_selected.png' : 'assets/images/work_unselected.png',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: StaggeredGridView.count(
                    crossAxisCount: 4, // I only need two card horizontally
                    padding: const EdgeInsets.all(2.0),
                    children: productList.map<Widget>((item) {
                      var dataProduct = item;

                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(
                                context, Routes.detailHome,
                                arguments: DetailHomeArguments(
                                    idProduct: dataProduct.idProduct
                                )
                            );
                          },
                          child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              color: Colors.white,
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Visibility(
                                          visible: dataProduct.isDiscount ? true : false,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4.0),
                                              color: ResColor.colorPrimary,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Disc. 30%',
                                                style: AppTextStyle.extraSmallText.copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: 10,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                              dataProduct.isFavorite
                                                  ? dataProduct.isFavorite = false
                                                  : dataProduct.isFavorite = true;
                                            });
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: dataProduct.isFavorite
                                                  ? Icon(Icons.favorite, size: 20, color: ResColor.colorPrimary,)
                                                  : Icon(Icons.favorite, size: 20, color: Colors.grey,)
                                          ),
                                        ),
                                      ],
                                    ),
                                    Image.network(
                                      dataProduct.imageProduct,
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      dataProduct.nameProduct,
                                      style: AppTextStyle.mediumText.copyWith(
                                          color: Colors.black
                                      ),
                                    ),
                                    Text(
                                      dataProduct.priceProduct,
                                      style: AppTextStyle.largeText.copyWith(
                                          color: Colors.black
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }).toList(),
                    staggeredTiles: productList
                        .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                        .toList(),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                )
              ],
            );
          });
        },
      ),
    );
  }
}
