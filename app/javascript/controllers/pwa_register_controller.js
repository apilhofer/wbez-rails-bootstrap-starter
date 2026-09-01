import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    if (!("serviceWorker" in navigator)) return

    navigator.serviceWorker.register("/service-worker.js").catch(() => {})
  }
}
