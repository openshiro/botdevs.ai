// Entry point for the build script in your package.json
import "./controllers"
import "./src/clipboard"
import "./src/turbo_native/bridge"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()
import "trix"
import "@rails/actiontext"
import "./custom/trix_customization"
