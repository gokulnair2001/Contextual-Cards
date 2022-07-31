# Contextual Cards

* Contextual Card is a server driven UI based app. In this project every piece of UI is driven by server thus it holds the flexibility to adapt according to the JSON provided. The view acts as a plug and play system. 

# 📲 Steps to run 
* Clone or download the Zip file
* Open ```Fampay-Assignment.xcodeproj``` file 
* Run the project (Make sure your Mac is connected to Internet) 
* Yes, you are ready to use it ✌🏻

## 📸 SnapShots

| Home | Home |
| -- | -- |
| ![1](https://user-images.githubusercontent.com/56252259/182021572-59d38e6a-c165-427f-afd4-da6ab1f008b7.png) | ![2](https://user-images.githubusercontent.com/56252259/182021596-c1ac45f9-bc66-4a17-b621-870f4ce2901d.png) |

| Toast | Action Card |
| -- | -- |
| ![3](https://user-images.githubusercontent.com/56252259/182021618-91dacf6d-b2d5-47d4-b07c-e91453cfc67a.png) | ![4](https://user-images.githubusercontent.com/56252259/182021625-bd93369b-6d59-4691-9417-a03beb3d8a01.png) |


## 🗞 Information

Few things kept in mind during the implementation :
* The app is following [MVVC(Model View ViewModel)](https://www.hackingwithswift.com/books/ios-swiftui/introducing-mvvm-into-your-swiftui-project) Architecture
* All the HTTPRequests are done through [Asynchronous](https://www.raywenderlich.com/25013447-async-await-in-swiftui) calls
* All the Image/Card is Server fetched, thus we are using [AsyncImage](https://developer.apple.com/documentation/swiftui/asyncimage) in it
* The app uses UserDefaults to store data
* Custom fonts are used in the project

## 🧰 Outsourced Component

* Since scroll view doesnt support inbuit [refreshable](https://developer.apple.com/documentation/swiftui/label/refreshable(action:)) thus we have used a [custom scroll view](https://stackoverflow.com/a/65100922/13105622) refreshable

## 👀 Note
Few additional features added from my side:
1. Toast view, which appears on dismissing a Card
2. Custom Refreshable added
3. Network Warning added

## 💻 OS Version
The current project is built on Xcode 13.4.1 with iOS 15.5+ support

## ⚖️ License
The project is available under MIT [License](https://github.com/gokulnair2001/Fampay-Assignment/blob/main/License)
