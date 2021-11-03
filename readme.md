# storefy flutter application

## File architecture ( important only ) :

- `lib\services\authServices.dart`
  > This file contains all functionality associated with authentication like `login` - `reset password` - `verify token` - `store tokens and information of the user` - etc.
- `lib\services\dio.dart`

  > This file contains configuration for [dio](https://pub.dev/packages/dio) package.

  > **`dio`** is a powerful Http client for Dart, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading and more.

- `lib\routes.dart`
  > This file contains all routes of the application.
- `lib\constants.dart`
  > This file contains all constants of the application like colors and error messages and more.

## Libraries associated with application :

- **dio** : for handling http requests and responses.
- **flutter_svg** : which allows painting and displaying Scalable Vector Graphics(svg).
- **Provider** : is a state management of our application.
- **flutter_secure_storage** : for handling and storing tokens and user information.
- **url_launcher** : Flutter plugin for launching a URL. Supports web, phone, SMS, and email schemes.

## Code Details :

- `lib\services\dio.dart`
  ![Screenshot of  dio.dart file](https://user-images.githubusercontent.com/57900722/139923175-2c45e139-d1ed-40d6-8372-c246d6d9531d.jpg)

<br>

> - when use your android phone in development mode,You face some issues when you want to connect to your laravel backend.

> - you need to connect your phone and your mobile in same network.

> - launch laravel server with host mode.

> - you can read more for more : [stackoverflow](https://stackoverflow.com/questions/30675025/access-to-laravel-5-app-locally-from-an-external-device)

<br>

- `lib\main.dart`
  ![screenshot of main file code](https://user-images.githubusercontent.com/57900722/139924235-828c15fb-25f7-4831-b523-33c2e15d7547.jpg)

<br>

> - add provider (state management) in your application **(red arrow)** .

> - read the documentation : [read now](https://pub.dev/packages/provider)

<br>

- `lib\screens\sign_in\components\sign_form.dart`
  ![Screenshot 2021-11-02 194254](https://user-images.githubusercontent.com/57900722/139927432-fe585f7a-c512-4e49-9643-d678f86d1b76.jpg)

    <br>

  ![Screenshot 2021-11-02 194721](https://user-images.githubusercontent.com/57900722/139927437-4c5c6f73-10fe-4a8f-b49d-19d1e7a760b8.jpg)

<br>

- `lib\screens\forget_password\components\sign_form.dart`

  ![Screenshot 2021-11-02 195412](https://user-images.githubusercontent.com/57900722/139927443-fa6b0cfb-4795-4695-81c3-7b7b1fe05bec.jpg)

<br>

- `lib\screens\splash\components\body.dart`

  ![Screenshot 2021-11-03 101004](https://user-images.githubusercontent.com/57900722/140034020-bff3a8a1-3847-414f-a1ef-5ad91de63892.jpg)

<br>

**_NOTE : read comments in screenshot_**

<br>

## Application screenshot :

<br>

` login :`

    if information is not valid 👇🏼:

![Screenshot_20211103-101714](https://user-images.githubusercontent.com/57900722/140038133-09a6ee26-ea37-4776-b806-1ff4e9b6d2d4.jpg)

    if information is valid :

![Screenshot_20211103-103209](https://user-images.githubusercontent.com/57900722/140038140-21a55fd7-0e86-4bb1-8d34-20f4d5d1153e.jpg)

<br>

` forget password :`

    if email is not valid 👇🏼:

![Screenshot_20211103-103918](https://user-images.githubusercontent.com/57900722/140038129-59679766-74ea-4975-beba-a4c33e6262fb.jpg)

    if email is  valid 👇🏼:

![Screenshot_20211103-101730](https://user-images.githubusercontent.com/57900722/140038137-76a62424-6649-40f1-9c14-e97c96cf22db.jpg)

<br>

` logout :`

![Screenshot_20211103-103220](https://user-images.githubusercontent.com/57900722/140038148-b74b7814-5e82-4dd6-8539-0eacf9c84052.jpg)

- when click on `log Out`

  > delete local storage token.

  > redirect to start screen.

<br>

` login automatically :`

> happens when we close application and token is valid.
> <br>

![Screenshot_20211103-103235](https://user-images.githubusercontent.com/57900722/140038161-28054983-7922-4b13-b304-e19fab3c48b7.jpg)
