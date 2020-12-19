import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradaru_test/data/model/product_model.dart';
import 'package:tradaru_test/feature/home/bloc/bloc.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/constant.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/widget/image_widget.dart';
import 'package:tradaru_test/widget/loading_widget.dart';

import 'detail_home_page.dart';

class DetailHomeScreen extends StatefulWidget {
  final DetailHomeArguments data;

  DetailHomeScreen({Key key, this.data}) : super(key: key);

  @override
  _DetailHomeScreenState createState() => _DetailHomeScreenState();
}

class _DetailHomeScreenState extends State<DetailHomeScreen> {
  HomeBloc _blocDetailHome;
  ProductItem productItem = ProductItem();

  @override
  void initState() {
    _blocDetailHome = BlocProvider.of<HomeBloc>(context);
    super.initState();
    _blocDetailHome.add(GetDetailHomeEvent(id: widget.data.idProduct));
  }

  @override
  void dispose() {
    _blocDetailHome.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        if (state is DetailHomeStateLoaded) {
          productItem = state.data;
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) {
          return OrientationBuilder(builder: (context, orientation) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 75),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18)
                          ),
                          child: imageWidget(
                            assetDefault: 'assets/images/error_image.png',
                            imageUrl: productItem.imageProduct,
                            height: 300,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                productItem.nameProduct ?? "-",
                                style: AppTextStyle.largeText.copyWith(
                                  color: ResColor.colorPrimary,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width: 10,),
                              Visibility(
                                visible: productItem.isDiscount??false ? true : false,
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
                                    productItem.isFavorite
                                        ? productItem.isFavorite = false
                                        : productItem.isFavorite = true;
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: productItem.isFavorite??false
                                        ? Icon(Icons.favorite, size: 25, color: ResColor.colorPrimary,)
                                        : Icon(Icons.favorite, size: 25, color: Colors.grey,)
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                "Sold : ${productItem.sold}",
                                style: AppTextStyle.mediumText.copyWith(
                                    color: ResColor.colorDarkGrey,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                height: 15,
                                width: 1,
                                color: ResColor.colorDarkGrey,
                              ),
                              SizedBox(width: 5,),
                              Icon(
                                Icons.star_half,
                                size: 20,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                productItem.rating??'0',
                                style: AppTextStyle.mediumText.copyWith(
                                  color: ResColor.colorDarkGrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          height: 0.5,
                          width: double.infinity - 8,
                          color: ResColor.colorDarkGrey,
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Description',
                                style: AppTextStyle.largeText.copyWith(
                                  color: ResColor.colorDarkGrey,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                LOREM,
                                style: AppTextStyle.smallText.copyWith(
                                  color: ResColor.colorDarkGrey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: ResColor.colorPrimary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18)
                      )
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: productItem.isDiscount??false ? true : false,
                                child: Text(
                                  productItem.priceProduct??'Rp. 0',
                                  style: AppTextStyle.smallText.copyWith(
                                    color: Colors.white,
                                    decoration: TextDecoration.lineThrough
                                  ),
                                ),
                              ),
                              Text(
                                productItem.isDiscount??false
                                    ? productItem.discounPrice??'Rp. 0'
                                    : productItem.priceProduct??'Rp. 0',
                                style: productItem.isDiscount??false
                                    ? AppTextStyle.largeText.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ) : AppTextStyle.extraLargeText.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ) ,
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: (){},
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                            decoration: BoxDecoration(
                              color: ResColor.colorPrimary,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.white,
                                width: 2
                              )
                            ),
                            child: Text(
                              'Add to Basket',
                              style: AppTextStyle.mediumText.copyWith(
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
