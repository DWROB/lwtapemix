import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="votes"
export default class extends Controller {

  static values = { songid: Number }
  static targets = ["song"]

  upvote() {
    console.log("upvote!")
    this.songTarget.classList.remove("active")
    const nextSong = document.getElementById(`song-${this.songidValue + 1}`)
    nextSong.classList.add("active")
  }

  downvote() {
    console.log("downvote!")
    this.songTarget.classList.remove("active")
    const nextSong = document.getElementById(`song-${this.songidValue  + 1}`)
    nextSong.classList.add("active")
  }
}
