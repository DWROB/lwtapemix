Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.


# TapeMix 

## Make collaborative Spotify playlists with your friends easily

### User Flow outline

|Sign up|Authorization|View your Spotify playlists|
|---|---|---|
|<img alit="make an account and authorize with spotify" src="https://user-images.githubusercontent.com/89933924/207325749-801587cc-bfdb-4922-9d3d-3bd84f044a88.png" height="400" width="auto"/>|<img alt="user gives TapeMix authorization to view and change their playlists" src="https://user-images.githubusercontent.com/89933924/207327017-9431900a-a911-4341-900d-120036ae29ea.png" height="400" width="auto"/>|<img alt="user screen for their spotify playlists" src="https://user-images.githubusercontent.com/89933924/207325397-f712432e-556a-43cb-96bf-985a88b33ddc.png" height="400" width="auto"/>|
|Sign-in via Devise. |Spotify auth screen explaining TapeMix scopes | Spotify playlists displayed.  User can select one, two or more, to combine and send to their friends/voters.




|Make a selection|Keep up to date with voting|Playlist in Spotify|
|---|---|---|
|<img alt="Voters can access the screen without logging in and vote quickly and easily" src="https://user-images.githubusercontent.com/89933924/207326066-bddd689b-00ea-41bb-8ac0-d63f2ec25407.png" height="400" width="auto"/>|<img alt="the user can observe the progress of voting through an Js AJAX logic using JSON response" src="https://user-images.githubusercontent.com/89933924/207326182-63ababdf-907f-416e-9cf7-816c74673b7f.png" height="400" width="auto"/>|<img alt="After confirming the tape, the new playlist is made in Spotify ready to play" src="https://user-images.githubusercontent.com/89933924/207326493-b323950f-aa97-4bd9-b61c-16eb1cbb6c82.png" height="400" width="auto"/>|
|Voters can vote on the songs via a Tinder-style interface|User can observe progress of the voting; and can confirm anytime they want|After confirmation, the tape is immediately sent to Spotify as a playlist, ready to play|

