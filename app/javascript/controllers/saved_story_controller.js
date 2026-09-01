import { Controller } from "@hotwired/stimulus"

const STORAGE_KEY = "appSavedStoryIds"

export default class extends Controller {
  static values = { id: String, savedClass: String, unsavedClass: String }

  connect() {
    this.syncButton()
  }

  toggle(event) {
    event.preventDefault()
    const ids = this.savedIds()
    const idx = ids.indexOf(this.idValue)
    if (idx >= 0) ids.splice(idx, 1)
    else ids.push(this.idValue)
    localStorage.setItem(STORAGE_KEY, JSON.stringify(ids))
    this.syncButton()
  }

  savedIds() {
    try {
      return JSON.parse(localStorage.getItem(STORAGE_KEY) || "[]")
    } catch {
      return []
    }
  }

  syncButton() {
    const saved = this.savedIds().includes(this.idValue)
    this.element.textContent = saved ? "Saved" : "Save"
    this.element.classList.toggle(this.savedClassValue || "btn-primary", saved)
    this.element.classList.toggle(this.unsavedClassValue || "btn-outline-secondary", !saved)
  }
}
