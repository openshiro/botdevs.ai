import { Controller } from "@hotwired/stimulus"
import hljs from 'highlight.js/lib/core';
import javascript from 'highlight.js/lib/languages/javascript';
import erb from 'highlight.js/lib/languages/erb';
import ruby from 'highlight.js/lib/languages/ruby';
import python from 'highlight.js/lib/languages/python';
import bash from 'highlight.js/lib/languages/bash';

// Connects to data-controller="highlight"
export default class extends Controller {
  connect() {
    hljs.registerLanguage('javascript', javascript);
    hljs.registerLanguage('erb', erb);
    hljs.registerLanguage('ruby', ruby);
    hljs.registerLanguage('python', python);
    hljs.registerLanguage('bash', bash);

    this.element.querySelectorAll('pre').forEach((element) => {
      hljs.highlightElement(element);
    });
  }
}
