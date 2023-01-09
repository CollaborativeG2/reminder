import { Application } from "@hotwired/stimulus"
import "push"
import "axios"
import "dayjs"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

const push = () => {
    return axios.get(`notifications`)
        .then((response) => {
            response.data.forEach(value => {
                const formatRemindAt = dayjs(value.remind_at).format("YYYY-MM-DD HH:mm")
                Push.create("リマインド", {
                    body: formatRemindAt + "\n" + value.remind_item.description,
                    onClick: function () {
                        window.focus();
                        this.close();
                    }
                })
            })
        })
}

setInterval(push, 10000)
