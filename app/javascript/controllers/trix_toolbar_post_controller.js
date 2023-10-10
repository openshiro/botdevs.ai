import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    connect() {
        // HTML for our buttons
        const h2ButtonHTML = '<button type="button" class="trix-button" data-trix-attribute="heading" title="Subheading">H2</button>'
        const h3ButtonHTML = '<button type="button" class="trix-button" data-trix-attribute="subHeading" title="Subheading">H3</button>'
        // Only apply event listeners once to the toolbars
        const once = {
            once: true
        }

        addEventListener("trix-initialize", function(event) {
            const sibling1 = event.target.toolbarElement.querySelector(".trix-button--icon-heading-1")
            sibling1.insertAdjacentHTML("afterend", h2ButtonHTML)
            const sibling2 = event.target.toolbarElement.querySelector("[data-trix-attribute='heading']")
            sibling2.insertAdjacentHTML("afterend", h3ButtonHTML)
        }, once)
    }
}
