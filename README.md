# Contextual Cards

* Contextual Card is a server driven UI based app. In this project every piece of UI is driven by server thus it holds the flexibility to adapt the accordoing to the JSON provided. 

# 📲 Steps to run 
* Clone or download the Zip file
* Open ```Fampay-Assignment.xcodeproj``` file 
* Run the project (Make sure your Mac is connected to Internet) 
* Yup, you are ready to use it ✌🏻

## 📸 SnapShots



## 🗞 Information

These are the few things followed in the project:
* The app is following [MVVC(Model View ViewModel)](https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project) Architecture
* All the HTTPRequest made is done through [Asynchronous](https://www.raywenderlich.com/25013447-async-await-in-swiftui) calls
* All the Image/Card is Server fetched, thus we are using [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage) in it
* The app uses UserDefaults to store data
* Custom fonts are used in the project

## 🧰 Outsourced Component

* We are using scroll view in the app and since scroll view doesnt support inbuit [refreshable](https://developer.apple.com/documentation/swiftui/label/refreshable(action:)) thus we used a [custom scroll view](https://stackoverflow.com/a/65100922/13105622)

## ⚖️ License
The project is available under MIT [License](https://github.com/gokulnair2001/Fampay-Assignment/blob/main/License)
