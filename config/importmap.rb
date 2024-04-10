# Pin npm packages by running ./bin/importmap

pin 'application'
pin '@hotwired/turbo-rails', to: 'turbo.min.js'
pin '@hotwired/stimulus', to: '@hotwired--stimulus.js' # @3.2.2
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'
pin 'tailwindcss-stimulus-components' # @5.0.2
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'stimulus-use' # @0.52.2
pin 'el-transition' # @0.0.7
