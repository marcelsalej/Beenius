# Beenius excercise

This is an excercise project for job interview at company Beenius
## Features
The application should consist of four separate screens, described in details in the following sections. All of them should contain a Toolbar informing the user about his current position in the application and should contain a back button.

* **Users screen**
The screen should be a simple vertically scrolling list of users available on the system. Each individual row should contain at least the username and name of the user. The rows should be clickable and should open the Albums screen for the selected user.

* **Albums screen**
The albums screen is again a simple vertically scrolling list, this time containing all the albums that are available for the selected user. The row should include the album title on
the left and a random image from that album in a small thumbnail aligned to the right. The rows are clickable and open the screen containing the photos belonging to the album.

* **Photos screen**
This time the screen should be a grid of photos from the selected album. Depending on the size of the device there should be at least two columns. Each cell must contain a thumbnail preview of the image and a title overlayed on the bottom of the thumbnail that is styled so it's clearly readable no matter the image. When a cell is clicked a full-screen photo screen should be shown.

* **Photo screen**
The photo screen should contain a full-screen image, overlayed by the Toolbar on the top and a details view on the bottom, both of which can be shown or hidden by tapping on the image. The details view should contain the title of the image, title of the album and the name of the user that created it.

## Project specifics (Tech)

* **Clean swift**
Architecture is used for the implementation of this excercise (more about architecture on [Clean Swift website](https://clean-swift.com))
* **No storyboard/Xib's**
For elements layouting,  [SnapKit](http://snapkit.io) is used
* **Image async loading**
Implemented via  [Alamofire image](https://github.com/Alamofire/AlamofireImage)
* **Unit/UI tests**
 Written for most crucial parts of implementation (datasource, requests, UI testing of tables/(collection views)
* **Lint checking** 
Provided via [SwiftLint](https://github.com/realm/SwiftLint). **Swiftlint.yml** is located at root of the project
* **Network requests** 
Implemented via  [Alamofire](https://github.com/Alamofire/Alamofire)

For testing, please pull **master** or **develop** (Branches are in the same position), release branch is **master**, **develop** branch is used for developing new features.

**Important** If project doesn't compile, please reinstall pods via command  `pod install`
**Important** Project min deployment version is **iOS 13**. For backwards compatibility, only freshly defined colors(from iOS 13), should be changed (please check branch **feat/min-deployment-support**) 