
window.addEventListener('load', function() {
    console.log('successfully')

    var image = []

    image[0] = 'images/prin.jpg'
    image[1] = 'images/fondo1.jpg'
    image[2] = 'images/fondo4.jpg'
    image[3] = 'images/pos4.jpg'

    var index = 0
    const time = 1500

    function change(){
        document.Slider.src= image[index]

        if(index < 2) {
            index++
        } else {
            index = 0
        }
    }

    this.setInterval(change, time)

   
})
