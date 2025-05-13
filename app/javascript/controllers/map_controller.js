import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["map", "latitude", "longitude"]

  connect() {
    if (!this.mapTarget) return;

    const lat = parseFloat(this.latitudeTarget.value) || 39.5;
    const lng = parseFloat(this.longitudeTarget.value) || -98.35;

    this.map = L.map(this.mapTarget).setView([lat, lng], 4);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution: "&copy; OpenStreetMap contributors"
    }).addTo(this.map);

    this.marker = L.marker([lat, lng], { draggable: true }).addTo(this.map);

    this.map.on("click", this.onMapClick.bind(this));
    this.marker.on("dragend", this.onMarkerDragEnd.bind(this));
  }

  onMapClick(e) {
    const { lat, lng } = e.latlng;
    this.updatePosition(lat, lng);
  }

  onMarkerDragEnd(e) {
    const { lat, lng } = e.target.getLatLng();
    this.updatePosition(lat, lng);
  }

  updatePosition(lat, lng) {
    this.marker.setLatLng([lat, lng]);
    this.latitudeTarget.value = lat.toFixed(6);
    this.longitudeTarget.value = lng.toFixed(6);
  }
}
