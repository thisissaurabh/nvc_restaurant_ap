
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nvc_restaurant_app/view/widgets/customized_image_asset_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import 'widget/product_view.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2 , initialIndex: 0, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Theme.of(context).cardColor,

          floatingActionButton: FloatingActionButton(
            heroTag: 'nothing',
            onPressed: () {

            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add_circle_outline, color: Theme.of(context).cardColor, size: 30),
          ) ,

          body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: _scrollController,
            slivers: [

              SliverAppBar(
                expandedHeight: 230, toolbarHeight: 50,
                pinned: true, floating: false,
                backgroundColor: Theme.of(context).primaryColor,
                actions: [IconButton(
                  icon: Container(
                    height: 50, width: 50, alignment: Alignment.center,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(Dimensions.radiusSmall)),
                    child: Image.asset(Images.edit),
                  ),
                  onPressed: () {},
                )],
                flexibleSpace: const FlexibleSpaceBar(
                  background: CustomImageAssetWidget(image: 'assets/images/storedemo.png',),
                ),
              ),

              SliverToBoxAdapter(child: Center(child: Container(
                width: 1170,
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                color: Theme.of(context).cardColor,
                child: Column(children: [
                  Row(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                      child: const CustomImageAssetWidget(
                        height: 40,
                        width: 40,
                        radius: 5,
                        fit: BoxFit.cover,
                        image: 'assets/images/storedemo.png',),
                    ),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(
                        "restaurant.name!", style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "restaurant.address", maxLines: 1, overflow: TextOverflow.ellipsis,
                        style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                      ),
                      RatingBar.builder(
                        itemSize: Dimensions.paddingSizeDefault,
                        initialRating: 3,
                        minRating: 1,
                        unratedColor: Theme.of(context).disabledColor,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) =>const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {

                        },
                      ),
                    ])),
                  ]),
                  const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                ]),
              ))),

              SliverPersistentHeader(
                pinned: true,
                delegate: SliverDelegate(child: Center(child: Container(
                  width: 1170,
                  decoration: BoxDecoration(color: Theme.of(context).cardColor),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorWeight: 3,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    unselectedLabelStyle: poppinsRegular.copyWith(color: Theme.of(context).disabledColor, fontSize: Dimensions.fontSizeSmall),
                    labelStyle: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor),
                    tabs:  [
                      Tab(text: 'all_foods'.tr),
                      Tab(text: 'reviews'.tr),
                    ]
                  ),
                ))),
              ),

              SliverToBoxAdapter(child: AnimatedBuilder(
                animation: _tabController!.animation!,
                builder: (context, child) {
                  if (_tabController!.index == 0) {
                    return ProductView();
                  } else {
                    return ListView.builder(
                      itemCount: 20,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      itemBuilder: (context, index) {
                        return ProductView();
                      },
                    );
                  }
                },
              )),
            ],
          ),
        );

  }
}

class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 || oldDelegate.minExtent != 50 || child != oldDelegate.child;
  }
}