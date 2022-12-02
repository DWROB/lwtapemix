import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="playlist"
export default class extends Controller {

  static targets = ["name", "form", "playlistIds", "playlistcard"]

  connect() {
    this.playlistIds = [];
  }

  addPlaylist(event) {
    const playlistId = event.currentTarget.dataset.playlistId
    const playlistIndex = this.playlistIds.indexOf(playlistId);
    console.log(playlistIndex)

    if (playlistIndex > -1) {
      event.currentTarget.firstElementChild.classList.remove("yellowb")
      this.playlistIds.splice(playlistIndex, 1)
    } else {
      event.currentTarget.firstElementChild.classList.add("yellowb")
      this.playlistIds.push(playlistId)
    }

    console.log(this.playlistIds)
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
      .then(response => window.location.href = response.url)

  }
}
