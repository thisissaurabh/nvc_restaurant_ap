
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/widgets/custom_snackbar.dart';

class AuthController extends GetxController implements GetxService {

  bool _isLoading = false;
  bool _notification = true;

  XFile? _pickedFile;

  XFile? _pickedLogo;
  XFile? _pickedCover;

  int? _selectedZoneIndex = 0;

  List<int>? _zoneIds;

  String? _pickAddress = '';
  bool _loading = false;
  bool _inZone = false;
  int _zoneID = 0;
  int _activeSubscriptionIndex = 0;
  String _businessPlanStatus = 'business';
  int _paymentIndex = 0;
  String? _subscribedType;
  bool isFirstTime = true;
  bool _showSubscriptionAlertDialog = true;
  bool? _isActivePackage;
  String _renewStatus = 'packages';
  int _refundPaymentIndex = 0;
  String? _expiredToken;
  List<int?>? _cuisineIds;
  List<int>? _selectedCuisines;
  String? _storeAddress;
  double _storeStatus = 0.4;
  String _storeMinTime = '--';
  String _storeMaxTime = '--';
  String _storeTimeUnit = 'minute';
  bool _showPassView = false;
  bool _lengthCheck = false;
  bool _numberCheck = false;
  bool _uppercaseCheck = false;
  bool _lowercaseCheck = false;
  bool _spatialCheck = false;
  String? _digitalPaymentName;
  // List<TextEditingController> _textControllerList = [];
  // List<FocusNode> _focusList = [];
  // FilePickerResult? otherFile;
  // File? _file;
  // List<FilePickerResult> listOfDocuments = [];
  // PlatformFile? objFile;
  // PlatformFile? _pickedImageFile;
  // PlatformFile? _pickedPdfFile;
  // PlatformFile? _pickedDocumentFile;
  // List<MultipartDocument> documents = [];
  List<dynamic>? _additionalList;

  bool get isLoading => _isLoading;
  bool get notification => _notification;
  XFile? get pickedFile => _pickedFile;

  XFile? get pickedLogo => _pickedLogo;
  XFile? get pickedCover => _pickedCover;
  int? get selectedZoneIndex => _selectedZoneIndex;
  List<int>? get zoneIds => _zoneIds;
  String? get pickAddress => _pickAddress;
  bool get loading => _loading;
  int get activeSubscriptionIndex => _activeSubscriptionIndex;
  String get businessPlanStatus => _businessPlanStatus;
  int get paymentIndex => _paymentIndex;

  bool get showSubscriptionAlertDialog => _showSubscriptionAlertDialog;
  bool? get isActivePackage => _isActivePackage;
  String get renewStatus => _renewStatus;
  int get refundPaymentIndex => _refundPaymentIndex;
  List<int?>? get cuisineIds => _cuisineIds;
  List<int>? get selectedCuisines => _selectedCuisines;
  String ? get storeAddress => _storeAddress;
  double get storeStatus => _storeStatus;
  String get storeMinTime => _storeMinTime;
  String get storeMaxTime => _storeMaxTime;
  String get storeTimeUnit => _storeTimeUnit;
  bool get showPassView => _showPassView;
  bool get lengthCheck => _lengthCheck;
  bool get numberCheck => _numberCheck;
  bool get uppercaseCheck => _uppercaseCheck;
  bool get lowercaseCheck => _lowercaseCheck;
  bool get spatialCheck => _spatialCheck;
  String? get digitalPaymentName => _digitalPaymentName;

  // List<TextEditingController> get textControllerList => _textControllerList;
  // List<FocusNode> get focusList => _focusList;
  // FilePickerResult? get otherFiles => otherFile;
  // File? get file => _file;
  // List<FilePickerResult> get listOfDocument => listOfDocuments;
  // PlatformFile? get objFiles => objFile;
  // PlatformFile? get pickedImageFile => _pickedImageFile;
  // PlatformFile? get pickedPdfFile => _pickedPdfFile;
  // PlatformFile? get pickedDocumentFile => _pickedDocumentFile;
  // List<MultipartDocument> get document => documents;
  List<dynamic>? get additionalList => _additionalList;

  String camelToSentence(String text) {
    print('=======sss======1==== > $text');
    var result = text.replaceAll('_', " ");
    var finalResult = result[0].toUpperCase() + result.substring(1);
    return finalResult;
  }



  void setAdditionalDate(int index, String date) {
    _additionalList![index] = date;
    update();
  }

  void setAdditionalCheckData(int index, int i, String date) {
    if(_additionalList![index][i] == date){
      _additionalList![index][i] = 0;
    } else {
      _additionalList![index][i] = date;
    }
    update();
  }

  void removeAdditionalFile(int index, int subIndex) {
    _additionalList![index].removeAt(subIndex);
    update();
  }

  void changeDigitalPaymentName(String? name, {bool canUpdate = true}){
    _digitalPaymentName = name;
    if(canUpdate) {
      update();
    }
  }


  void initializeRenew(){
    _renewStatus = 'packages';
    _isActivePackage = true;
  }

  void setRefundPaymentIndex(int index){
    _refundPaymentIndex = index;
    update();
  }

  void activePackage(bool status){
    _isActivePackage = status;
    update();
  }

  void renewChangePackage(String statusPackage){
    _renewStatus = statusPackage;
    update();
  }

  void closeAlertDialog(){
    if(_showSubscriptionAlertDialog) {
      _showSubscriptionAlertDialog = !_showSubscriptionAlertDialog;
      update();
    }
  }

  void showAlert({bool isUpdate = false}){
    _showSubscriptionAlertDialog = !_showSubscriptionAlertDialog;
    if(isUpdate){
      update();
    }
  }
















  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void pickImageForReg(bool isLogo, bool isRemove) async {
    if(isRemove) {
      _pickedLogo = null;
      _pickedCover = null;
    }else {
      if (isLogo) {
        XFile? pickLogo = await ImagePicker().pickImage(source: ImageSource.gallery);
        //_pickedLogo = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(pickLogo != null) {
          pickLogo.length().then((value) {
            if (value > 2000000) {
              showCustomSnackBar('please_upload_lower_size_file'.tr);
            } else {
              _pickedLogo = pickLogo;
            }
          });
        }
      } else {
        XFile? pickCover = await ImagePicker().pickImage(source: ImageSource.gallery);
        //_pickedCover = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(pickCover != null) {
          pickCover.length().then((value) {
            if (value > 2000000) {
              showCustomSnackBar('please_upload_lower_size_file'.tr);
            } else {
              _pickedCover = pickCover;
            }
          });
        }
      }
      update();
    }
  }






  String _verificationCode = '';

  String get verificationCode => _verificationCode;

  void updateVerificationCode(String query) {
    _verificationCode = query;
    update();
  }


  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }










  void initData() {
    _pickedFile = null;
  }




















  void showHidePass({bool isUpdate = true}){
    _showPassView = ! _showPassView;
    if(isUpdate) {
      update();
    }
  }

  void minTimeChange(String time){
    _storeMinTime = time;
    update();
  }

  void maxTimeChange(String time){
    _storeMaxTime = time;
    update();
  }

  void timeUnitChange(String unit){
    _storeTimeUnit = unit;
    update();
  }

  void validPassCheck(String pass, {bool isUpdate = true}) {
    _lengthCheck = false;
    _numberCheck = false;
    _uppercaseCheck = false;
    _lowercaseCheck = false;
    _spatialCheck = false;

    if(pass.length > 7){
      _lengthCheck = true;
    }
    if(pass.contains(RegExp(r'[a-z]'))){
      _lowercaseCheck = true;
    }
    if(pass.contains(RegExp(r'[A-Z]'))){
      _uppercaseCheck = true;
    }
    if(pass.contains(RegExp(r'[ .!@#$&*~^%]'))){
      _spatialCheck = true;
    }
    if(pass.contains(RegExp(r'[\d+]'))){
      _numberCheck = true;
    }
    if(isUpdate) {
      update();
    }
  }

// void pickOtherFile(bool isRemove, bool isImage, bool isPdf) async {
//   if (isRemove) {
//     _pickedImageFile = null;
//     _pickedPdfFile = null;
//     _pickedDocumentFile = null;
//   } else {
//     otherFile = (await FilePicker.platform.pickFiles(withReadStream: true));
//     if (otherFile != null) {
//       if (isImage) {
//         _pickedImageFile = otherFile!.files.single;
//       } else if (isPdf) {
//         _pickedPdfFile = otherFile!.files.single;
//       } else {
//         _pickedDocumentFile = otherFile!.files.single;
//       }
//     }
//     update();
//   }
// }
//
// void removeFile(int index) async {
//   listOfDocuments.removeAt(index);
//   documents.removeAt(index);
//   update();
// }
//
// void clearFile() async {
//   listOfDocuments.clear();
//   documents.clear();
// }

/*Future<void> addPost(
      String title
      ) async {
    _isLoading = true;
    update();
    Response response = await storeRepo.addPost(documents, title);
    {
      if(response.statusCode == 200) {
        Get.back();
        showCustomSnackBar("post_added_successfully".tr, isError: false);

      }else {
        ApiChecker.checkApi(response);
      }
      _isLoading = false;
      update();
    }
  }*/

}
