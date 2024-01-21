# 1.	Introduction
  ### Purpose
The "OnPaper" Flutter app is designed to serve as a personal diary for users, allowing them to record their daily experiences and activities using their mobile devices easily and intuitively.
  ### Target Audience
•	Students: High school and university students tracking their studies, tasks, and exams.

•	Teachers and Professors: Easy tracking of students' progress, note-taking, lesson planning, etc.

•	Parents: Monitoring their children's school activities, communicating with teachers, and tracking homework.
  ### Features
•	Personal Diary: Users can create and store personal diaries where they can input their daily experiences.

•	Text Entries: Users can input textual entries to express their daily experiences and thoughts.
# 2.	Getting Started
  ### Prerequisites
•	Flutter SDK installed.

•	Firebase project set up with the necessary configurations.
  ### Installation
•	Clone the project repository:

git clone https://github.com/lulata/FINKI-MIS/tree/main/dom2

•	Change to the project directory:

cd dom2

•	Install dependencies:

flutter pub get
  ### Firebase Setup
1.	Create a Firebase project: Firebase Console.
2.	Add Android and/or iOS app to your project and download the configuration files.
3.	Update the google-services.json (for Android) and GoogleService-Info.plist (for iOS) in the respective platform folders.
4.	Set up Firebase Authentication and Firestore as needed.
# 3.	Dependencies
cupertino_icons: ^1.0.2
   
firebase_core: ^2.24.2
   
firebase_auth: ^4.15.3

cloud_firestore: ^4.14.0

sensors: ^2.0.3

geolocator: ^10.1.0

permission_handler: ^11.0.0

google_maps_flutter: ^2.5.3
# 4.	Usage
  ### Running the App
•	Use the following command to run the app:

flutter run
# 5.	Firebase Integration
  ### Authentication
Implement authentication providers such as email/password, Google Sign-In, etc., using the ‘firebase_auth’ package.
  ### Firestore Database
Utilize the ‘cloud_firestore’ package to store and retrieve data from the Firestore database.
  ### Authentication State Persistence
Ability to specify whether a signed in user should be indefinitely persisted until explicit sign out, cleared when the window is closed or cleared on page reload. It  persist a user's session even after the user closes the browser.

# 6.	Screens and Functionality
  ### Home Screen
•	Displays a list of diary entries retrieved from the Firestore database.

•	Allows users to input new diary entries.
# 7.	Custom UI Elements & Design Templates
  ### MVC Architecture
The "OnPaper" Flutter app follows the Model-View-Controller (MVC) architectural pattern. This separation of concerns enhances maintainability and scalability. Key components include:

•	Model (Data Layer): Manages data and business logic. For example, the diary entry model defines the structure of each entry.

•	View (Presentation Layer): Handles UI elements and user interaction. Custom UI widgets, such as a stylized entry form, are part of the view.

•	Controller (Application Logic): Manages the flow of data between the model and view. Controllers, like the DiaryController, handle user input and update the model accordingly.
  ### Singleton Components
•	Certain components in the app are implemented as singletons, ensuring a single instance is shared throughout the application.

# 8.	Sensors and Location Services
•	Sensors: Accelerometer, UserAccelerometer and Gyroscope.

•	Location Services

