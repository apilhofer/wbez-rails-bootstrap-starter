import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "subtitle"]
  static values = { hiddenClass: String }

  connect() {
    const state = sessionStorage.getItem("appAudioState")
    if (!state) return
    const parsed = JSON.parse(state)
    this.element.hidden = false
    if (this.hasTitleTarget) this.titleTarget.textContent = parsed.title || "Now playing"
    if (this.hasSubtitleTarget) this.subtitleTarget.textContent = parsed.subtitle || ""
  }

  toggle() {
    this.element.hidden = !this.element.hidden
  }
}
