The application is a cross-platform that runs on both iOS and Android platforms. 

## Screens
The application comprises two main screens:

1. **Main Screen:** This is the first screen users see when they launch the application. It is responsible for fetching the brokers' data from a network source, handling loading and error states, and displaying a list of brokers. 

2. **Broker Info Screen:** This screen is accessed by selecting a broker from the list displayed in the Main Screen. It shows the detailed information of the selected broker.

## Dependencies

1. **http:** Used to manage all the network requests within the application.

2. **provider:** A state management solution that is used to handle simple state management needs for this application.

## Getting Started

To run this project locally, do the following:

1. Clone the repo from the command line:
    ```sh
    git clone https://github.com/fx-test.git
    ```
    
2. Navigate to the project's root directory:
    ```sh
    cd fx-test
    ```

3. Install the dependencies:
    ```sh
    flutter pub get
    ```
    
4. To run the project, execute:
    ```sh
    flutter run
    ```
