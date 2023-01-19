# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "push", to: "https://cdnjs.cloudflare.com/ajax/libs/push.js/1.0.12/push.min.js", preload: true
pin "axios", to: "https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js", preload: true
pin "dayjs", to: "https://cdn.jsdelivr.net/npm/dayjs@1/dayjs.min.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
