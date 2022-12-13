Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

<p align="center">
<img alt="logo" src="https://user-images.githubusercontent.com/89933924/207356452-7a0e3de7-6592-42ac-8c51-d4323bfad547.png"/></p>


# [TapeMix](http://demo.tapemix.fun)

## Make collaborative Spotify playlists with your friends easily

The objective of this final project for my Web Development bootcamp with Le Wagon was to make an app that would help a user select a range of playlists from their Spotify account and allow their friends to vote yes or no to any of the songs. 

## objectives of the project

To consider designing any kind of music playlist app without integrating the main music streaming services would be foolish endeavour.  After researching Spotify's documentation about their API and the endpoints available, I felt it would be possible to utilise the API in order to build this app.  

I initially planned to use an existing gem "rspotify" to handle the OAuth procedure and subsequent calls.  However, I eventually decided that it was possible and more beneficial to my learning that I establish authorization with only the use of the 'rest-client' gem.  

### User Flow outline

|Sign up|Authorization|View your Spotify playlists|
|---|---|---|
|<img alt="make an account and authorize with spotify" src="https://user-images.githubusercontent.com/89933924/207325749-801587cc-bfdb-4922-9d3d-3bd84f044a88.png" height="400" width="auto"/>|<img alt="user gives TapeMix authorization to view and change their playlists" src="https://user-images.githubusercontent.com/89933924/207327017-9431900a-a911-4341-900d-120036ae29ea.png" height="400" width="auto"/>|<img alt="user screen for their spotify playlists" src="https://user-images.githubusercontent.com/89933924/207325397-f712432e-556a-43cb-96bf-985a88b33ddc.png" height="400" width="auto"/><img src="https://user-images.githubusercontent.com/89933924/207357505-ad495dce-c587-4deb-85b7-7e3ceaeb3205.png" height="400" width="auto"/>|
|Sign-in via Devise. |Spotify auth screen explaining TapeMix scopes | Spotify playlists displayed.  User can select one, two or more, to combine and send to their friends/voters.

|Make a selection|Keep up to date with voting|Playlist in Spotify|
|---|---|---|
|<img alt="Voters can access the screen without logging in and vote quickly and easily" src="https://user-images.githubusercontent.com/89933924/207326066-bddd689b-00ea-41bb-8ac0-d63f2ec25407.png" height="400" width="auto"/>|<img alt="the user can observe the progress of voting through an Js AJAX logic using JSON response" src="https://user-images.githubusercontent.com/89933924/207326182-63ababdf-907f-416e-9cf7-816c74673b7f.png" height="400" width="auto"/>|<img alt="After confirming the tape, the new playlist is made in Spotify ready to play" src="https://user-images.githubusercontent.com/89933924/207326493-b323950f-aa97-4bd9-b61c-16eb1cbb6c82.png" height="400" width="auto"/>|
|Voters can vote on the songs via a Tinder-style interface|User can observe progress of the voting; and can confirm anytime they want|After confirmation, the tape is immediately sent to Spotify as a playlist, ready to play|

