An App is a convenience class we use to have a good api in workspaces to perform some basic actions for the app.

Typically:

"Start all services"
App start.

"Reset configurations (will reload lazily)"
App reset.

"Stop all services"
App stop.

"Clean up the dev db"
App dropDatabase.

"Access RESTapi handler"
App api

"Access the WebSocket handler"
App webSocketAPI


