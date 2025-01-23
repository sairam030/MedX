
# Documentation

Installation Instructions

To install and run , please follow these steps:

1. Ensure that you have Flutter and Dart SDK installed on your system. If not, please refer to the Flutter Installation Guide for instructions.

2. Clone the project repository from GitHub using the following command: 
bash

>* git clone 
    https://github.com/sairam030/MedX

>* Open the project in your preferred IDE or text editor.

>* Run the following command in the terminal to fetch and download the project dependencies:

    flutter pub get

>* Connect your Android device to your development machine or use an emulator.

>* Build and run the application using the following command:arduino

    flutter run

3. This command will automatically compile the Flutter code and launch the application on the connected device or emulator.

# Features and Functionality

The flutter medical-doc application

1. Doctor List Screen 
>* Display the list of doctors available for consultaion.
>* This has the sort feature for sorting based on : 
    
    1. Earliest available: based ono the hours and mins the doctor available,

    2. Highest rating : highest rating first,

    3. Nearest : gets the latitude and logitude of the doctor and compares 
    with the user latitude and logitude (which is banglore by default) and gets the least distance,

    4. Fee: Low to high,
    5. Fee: High to low.
>*  This has the search feature which filters on :
    doctor name & specalization

# System Architecture

The architecture consists of the following key components: 

1. Presentation Layer
>* Responsible for handling the user interface and user interactions. It includes the Doctor List Screen.
2. Data Layer
>* Handles data management, including fetching Doctor's data from assets from local storage which is stored in Json formate.
3. State Management.
>* Utilizes the provide package for state management, allowing for efficient state updates and UI rendering.

#Screen-Shots

<div style="display: flex; justify-content: space-around;">
  <img src="images/IMG-20240330-WA0001.jpg" alt="intro_video" style="width: 200px; height: 400px;">
  <img src="images/IMG-20240330-WA0002.jpg" alt="video_playing_home" style="width: 200px; height: 400px;">
  <img src="images/IMG-20240330-WA0003.jpg" alt="video_playing_player_screen" style="width: 200px; height: 400px;">
  <img src="images/IMG-20240330-WA0004.jpg" alt="emoji_selection_panel" style="width: 200px; height: 400px;">
  <img src="images/IMG-20240330-WA0005.jpg" alt="splash_screen_video" style="width: 200px; height: 400px;">
</div>
