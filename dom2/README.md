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

•	Privacy and Security: The app provides options for privacy and data protection.

•	Organization: Entries can be organized using tags for easy searching and retrieval.

•	Analytics and Statistics: Basic statistics like word count and entry count are available.
# 2.	Getting Started
  ### Prerequisites
•	Flutter SDK installed.

•	Firebase project set up with the necessary configurations.
  ### Installation
•	Clone the project repository:

git clone https://github.com/your-username/on_paper_app.git

•	Change to the project directory:

cd on_paper_app

•	Install dependencies:

flutter pub get
  ### Firebase Setup
1.	Create a Firebase project: Firebase Console.
2.	Add Android and/or iOS app to your project and download the configuration files.
3.	Update the google-services.json (for Android) and GoogleService-Info.plist (for iOS) in the respective platform folders.
4.	Set up Firebase Authentication and Firestore as needed.
# 3.	Dependencies ( treba izmena spored nasiot proekt)
  ### Flutter Packages
•	provider: ^6.3.4: For state management.

•	shared_preferences: ^2.0.12: For local data persistence.

•	sqflite: ^2.0.0+3: For SQLite database operations.

  ### Firebase Packages
•	firebase_core: ^2.7.0: For initializing Firebase.

•	firebase_auth: ^4.4.0: For user authentication.

•	cloud_firestore: ^3.4.2: For Firestore database.
# 4.	Usage
  ### Running the App
•	Use the following command to run the app:

flutter run
# 5.	Firebase Integration
  ### Authentication
Implement authentication providers such as email/password, Google Sign-In, etc., using the ‘firebase_auth’ package.
  ### Firestore Database
Utilize the ‘cloud_firestore’ package to store and retrieve data from the Firestore database.
# 6.	Screens and Functionality
  ### Home Screen
•	Displays a list of diary entries retrieved from the Firestore database.

•	Allows users to input new diary entries.
# 7.	State Management (ova da se proveri kako ke se cuva)
  ### Provider Package
The ‘provider’ package is used for managing the app's state.
# 8.	Web Service Integration:
Add a section explaining how the app integrates with a web service. Include details on the purpose of the web service, any API endpoints used, and how data is exchanged between the app and the web service.
# 9.	Custom UI Elements & Design Templates:
•	Document the custom UI elements used in your app. Provide explanations for the purpose and functionality of each custom UI component.

•	Detail the three design templates applied in your app. Include screenshots or descriptions of how each template is implemented and where they are used within the app.
# 10.	Sensor, Camera, or Location Services:
•	If your app utilizes sensors, camera functionalities, or location services, document how these features are integrated. Provide information on the purpose of each sensor or service and how users can interact with them.
