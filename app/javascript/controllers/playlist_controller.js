import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="playlist"
export default class extends Controller {

  static targets = ["name", "form", "playlistIds"]

  connect() {
    this.playlistIds = []
  }

  addPlaylist(event) {
    this.playlistIds.push(event.currentTarget.dataset.songId)
  }

  createTapeMix(event) {
    event.preventDefault()
    console.log(`sending playlists ${this.playlistIds} with name ${this.nameTarget.value}`)
    const url = this.formTarget.action
    console.log(url)
    const csrf = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    this.playlistIdsTarget.value = this.playlistIds.toString()

    fetch(url,{
      method: "POST",
      headers: {
        //'Content-Type': 'application/json'
        //'X-CSRF-TOKEN': csrf
      },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then(data => console.log(data))
  }
}
