# Swift : CloseByRestaurant

Used Swift frameworks | 
------------ | 
[CoreLocation](https://developer.apple.com/documentation/corelocation/) | 
[UserNotifications](https://developer.apple.com/documentation/usernotifications) | 

## Description:
The goal of this App is to entice people to visit the restaurant when they are nearby. The idea is to use the location of the user to know if they nearby and maybe going to another restaurant to remind them to come to our restaurant instead by giving them sale or discounts to seduce them to come to our restaurant.


## Installation/Setup:
1. Download zip or [clone](https://github.com/ametekohy/mad-dia1.git) from the latest release of this repository.
2. Open the project in [Xcode](https://developer.apple.com/xcode/)
3. Build and Run the project in the Xcode simulator


## Functionality:
- The user can allow receiving notifications from the CloseByRestaurant App.
- The user can allow giving their location to the CloseByRestaurant App.
- The user will receive a notification after 5 seconds when the user enters the 100 meter radius of the restaurant.
- The user will receive a notification after 5 seconds when the user exits the 100 meter radius of the restaurant.

## Testing the functionality:
The functionality of the CloseByRestaurant App is to receive a notification of a sale from the restaurant when you enter the radius of the restaurant to seduce the customer to coming by the restaurant. We also put another notification when the customer leaves the radius.

1. When running the simulator and running the CloseByRestaurant App, accept the permission to allow.
   <img src="https://github.com/ametekohy/mad-dia1/blob/master/images/locationPermission.png" width="300">
2. To test when u go within range of the location, close the app. In the simulator you can change the location to a custom location by: Debug > Location > Custom location and enter lat and long. Currently we using the "Ruitenberglaan 26", the HAN in Arnhem as a testlocation.

latitude | longtitude
------------ | ------------ 
51.9878277 | 5.9480078 | 
  <img src="https://github.com/ametekohy/mad-dia1/blob/master/images/alwaysAllowLocation.png" width="300">
  <img src="https://github.com/ametekohy/mad-dia1/blob/master/images/customLocation.png" width="300">

When you set the custom location you should receive a notification of a sale after 5 seconds.
  <img src="https://github.com/ametekohy/mad-dia1/blob/master/images/notificationSale.png" width="300">

3. If you change the location to something else, leaving the 100 meter radius from the restaurant, you should receive a notification of a discount after 5 seconds. 
  <img src="https://github.com/ametekohy/mad-dia1/blob/master/images/notificationDiscount.png" width="300">


## Conclusion
This App is ofcourse not something we should strive for and annoy users with. But as we can see now is that the privacy is handled well in Apps now a days. You can allow once or allow only when in use. Its good that people's privacy are in their own hands now. U can't easily be such an annoying restaurant as we tried to be. hihi.
