import 'package:flutter/material.dart';
import 'package:foo_delivery/controllers/auth_controller.dart';
import 'package:foo_delivery/controllers/location_controller.dart';
import 'package:foo_delivery/controllers/user_controller.dart';
import 'package:foo_delivery/model/adress_model.dart';
import 'package:foo_delivery/routes/router_helper.dart';
import 'package:foo_delivery/utils/colors.dart';
import 'package:foo_delivery/utils/dimensions.dart';
import 'package:foo_delivery/widgets/app_icon.dart';
import 'package:foo_delivery/widgets/app_text_filed.dart';
import 'package:foo_delivery/widgets/big_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumer = TextEditingController();
  late bool _isLogged;
  bool isLod = false;

  CameraPosition _cameraPosition = const CameraPosition(target: LatLng(45.51563, -122.677433), zoom: 17);
  late LatLng _initialPostion = LatLng(45.51563, -122.677433);

  @override
  void initState() {
    super.initState();
    _isLogged = Get.find<AuthController>().userLoggedIn();
    if (_isLogged && Get.find<UserController>().userModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    if (Get.find<LocationController>().addressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
          target: LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        double.parse(Get.find<LocationController>().getAddress["longitude"]),
      ));
      _initialPostion = LatLng(
        double.parse(Get.find<LocationController>().getAddress["latitude"]),
        double.parse(Get.find<LocationController>().getAddress["longitude"]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address Page"),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(
        builder: (userController) {
          // if (userController.userModel != null && _contactPersonName.text.isEmpty) {
          //   _contactPersonName.text = '${userController.userModel.name}';
          //   _contactPersonNumer.text = '${userController.userModel.phone}';
          //   if (Get.find<LocationController>().addressList.isNotEmpty) {
          //     _addressController.text = Get.find<LocationController>().getUseraddress().address;
          //   }
          // }
          return GetBuilder<LocationController>(
            builder: (locationController) {
              // _addressController.text = '${locationController.placemark.name ?? ''}'
              //     '${locationController.placemark.locality ?? ''}'
              //     '${locationController.placemark.postalCode ?? ''}'
              //     '${locationController.placemark.country ?? ''}';
              // print("address in my view is" + _addressController.text);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 5, right: 5, top: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: AppColors.mainColor,
                          ),
                        ),
                        child: isLod
                            ? Stack(
                                children: [
                                  GoogleMap(
                                    initialCameraPosition: CameraPosition(target: _initialPostion, zoom: 17),
                                    zoomControlsEnabled: false,
                                    compassEnabled: false,
                                    indoorViewEnabled: true,
                                    mapToolbarEnabled: false,
                                    myLocationButtonEnabled: true,
                                    onCameraIdle: () {
                                      locationController.updatePosition(_cameraPosition, true);
                                    },
                                    onCameraMove: ((position) => _cameraPosition = position),
                                    onMapCreated: (GoogleMapController controller) {
                                      locationController.setMapController(controller);
                                    },
                                  ),
                                ],
                              )
                            : Image(image: AssetImage("assets/images/image_loc.png"), fit: BoxFit.cover)),
                    // 3 box
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.width20, top: Dimensions.height20),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: locationController.addressTypeList.length,
                          // itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                locationController.setAddressTypeIndex(index);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height10),
                                margin: EdgeInsets.only(right: Dimensions.width10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(Dimensions.radius20 / 4),
                                  color: Theme.of(context).cardColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[200]!,
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  index == 0
                                      ? Icons.home_filled
                                      : index == 1
                                          ? Icons.work
                                          : Icons.location_on,
                                  color: locationController.addressTypeIndex == index ? AppColors.mainColor : Theme.of(context).disabledColor,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height20),
                    Padding(padding: EdgeInsets.only(left: Dimensions.width20), child: BigText(text: "Delivery Address")),
                    SizedBox(height: Dimensions.height10),
                    AppTextFiled(textEditingController: _addressController, hintText: "Your adress", icon: Icons.map),
                    SizedBox(height: Dimensions.height20),
                    Padding(padding: EdgeInsets.only(left: Dimensions.width20), child: BigText(text: "Contact Name")),
                    SizedBox(height: Dimensions.height10),
                    AppTextFiled(textEditingController: _contactPersonName, hintText: "Your name", icon: Icons.map),
                    SizedBox(height: Dimensions.height10),
                    Padding(padding: EdgeInsets.only(left: Dimensions.width20), child: BigText(text: "Your numer")),
                    SizedBox(height: Dimensions.height10),
                    AppTextFiled(textEditingController: _contactPersonNumer, hintText: "Your address", icon: Icons.map),
                    SizedBox(height: Dimensions.height20),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: GetBuilder<LocationController>(
        builder: (locationController) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: Dimensions.height20 * 8,
                padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, right: Dimensions.width20, left: Dimensions.width20),
                decoration: BoxDecoration(
                  color: AppColors.buttomBacgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AddressModel _addressModel = AddressModel(
                          addressType: locationController.addressTypeList[locationController.addressTypeIndex],
                          contactPersonName: _contactPersonName.text,
                          contacktPersonNumer: _contactPersonNumer.text,
                          address: _addressController.text,
                          latitude: locationController.position.latitude.toString(),
                          longitude: locationController.position.longitude.toString(),
                        );
                        locationController.addAddress(_addressModel).then((response) {
                          if (response.isSuccess) {
                            // Get.back();
                            Get.toNamed(RouteHelper.getInitial());
                            Get.snackbar("Addres", "Added Successfully");
                          } else {
                            Get.snackbar("Addres", "Couldn't save address");
                          }
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, right: Dimensions.height20, left: Dimensions.height20),
                        child: BigText(text: "Save Address", color: Colors.white, size: 26),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
