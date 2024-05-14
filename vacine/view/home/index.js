var i = 0;
var images = ['../../img/1.jpeg', '../../img/2.jpg', '../../img/3.jpg', '../../img/1.jpg'];
var time = 3000;

function changeImg() {
    document.querySelector('#slide img').src = images[i];

    if (i < images.length - 1) {
        i++;
    } else {
        i = 0;
    }

    setTimeout(changeImg, time);
}


changeImg();




