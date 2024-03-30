
# Documentation

Installation Instructions

To install and run the Flutter Non-Linear Video Session System, please follow these steps:

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
    [Earliest available,Highest rating,Nearest,Fee: Low to high,Fee: High to low]
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

![intro_video](images/IMG-20240330-WA0001.jpg) &nbsp; ![video_playing_home](images/IMG-20240330-WA0002.jpg) &nbsp; ![video_playing_player_screen](images/IMG-20240330-WA0003.jpg) &nbsp; ![emoji_selection_panel](images/IMG-20240330-WA0004.jpg) &nbsp; ![splash_screen_video](images/IMG-20240330-WA0005.jpg)
