# chat_app_demo

Chat App Demo Project 

The project mainly has four modules. 

1. Login 
    - buisness_layer
        - authentication_bloc
        - login_bloc
    - data_layer
        - models 
        - providers
        - repositories 
    - ui_layer
        - pages
        - widgets

2. Signup 
    - buisness_layer
        - signup_bloc
    - data_layer
        - models 
        - repositories 
    - ui_layer
        - pages
        - widgets

3. Home 
    - buisness_layer
    - data_layer
        - repositories 
    - ui_layer
        - pages

4. Chat 
    - buisness_layer
        - chat_bloc
    - data_layer
        - models 
        - repositories 
    - ui_layer
        - pages
        - widgets

The user interface (UI) for the project is intentionally minimalistic, with a strong emphasis on the following aspects:

1. The implementation of the BLoC architecture to separate business logic from UI components.
2. The utilization of both the bloc and flutter_bloc packages.
3. The deployment of BlocProvider and MultiBlocProvider.
4. The use of BlocBuilder and BlocListener to construct and monitor state changes.
5. The integration of repositories and providers to manage data layer operations.
6. All state management within the project is maintained until the app is terminated.

Demo Details:

1. Users can log in using one of the following email addresses: progyny1@test.com, progyny2@test.com, ... progyny5@test.com, with the password being 'password'.
2. At present, the sign-up feature does not support adding new users, and hence cannot be tested with a newly created account.
3. Users have the ability to log in and out from any of the accounts ranging from progyny1@test.com to progyny5@test.com. They can send messages to other users, log out, log in with another account, and check for messages, provided they don't do hot restart or restart the application. 
