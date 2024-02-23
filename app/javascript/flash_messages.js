document.addEventListener('turbo:before-fetch-response', function(event){
    const json = JSON.parse(event.detail.fetchResponse.header("X-Flash-Messages"))
    let keys = ["notice", "alert"]

    keys.forEach(key => {
        let value = json[key]
        let element = document.getElementById(key)
        if (value) {
            element.innerHTML = decodeURI(value)
            element.classList.add(key)
        } else {
            element.innerHTML = ""
            element.classList.remove(key)
        }
    })
})