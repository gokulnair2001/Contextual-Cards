# Contextual Cards

* Contextual Card is a server driven UI based app. In this project every piece of UI is driven by server thus it holds the flexibility to adapt the accordoing to the JSON provided. The view acts as a plug and play system.

# 📲 Steps to run 
* Clone or download the Zip file
* Open ```Fampay-Assignment.xcodeproj``` file 
* Run the project (Make sure your Mac is connected to Internet) 
* Yup, you are ready to use it ✌🏻

## 📸 SnapShots

| Home | Home | Home |
| -- | -- | -- | 
| ![1](https://user-images.githubusercontent.com/56252259/182019769-5492c9a1-f9d7-4430-824c-8c11b2744f62.png) | ![2](https://user-images.githubusercontent.com/56252259/182019789-87002310-a064-48f6-96a3-ee3cd598ad3f.png) | ![3](https://user-images.githubusercontent.com/56252259/182019798-82945e8b-a3e6-46b8-9991-bc710f75eafe.png) |

| Toast | Action Card | PlaceHolder |
| -- | -- | -- | 
| ![4](https://user-images.githubusercontent.com/56252259/182019818-231f1686-47ce-4534-95d9-0c42b890e4cc.png) | ![5](https://user-images.githubusercontent.com/56252259/182019849-675c19b1-644b-4394-a373-27b59fcfa4ea.png) | ![6](https://user-images.githubusercontent.com/56252259/182019865-cc546ddd-fc35-4493-ad8f-7be16d4297b6.png) |



## 🗞 Information

These are the few things followed in the project:
* The app is following [MVVC(Model View ViewModel)](https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project) Architecture
* All the HTTPRequest made is done through [Asynchronous](https://www.raywenderlich.com/25013447-async-await-in-swiftui) calls
* All the Image/Card is Server fetched, thus we are using [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage) in it
* The app uses UserDefaults to store data
* Custom fonts are used in the project

## 🧰 Outsourced Component

* Since scroll view doesnt support inbuit [refreshable](https://developer.apple.com/documentation/swiftui/label/refreshable(action:)) thus we have used a [custom scroll view](https://stackoverflow.com/a/65100922/13105622) refreshable

## ⚖️ License
The project is available under MIT [License](https://github.com/gokulnair2001/Fampay-Assignment/blob/main/License)
