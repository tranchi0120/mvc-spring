let toasty = document.querySelector('#successMessage');
let add = document.querySelector('.add');


add.addEventListener(onclick(), showSuccessMessage)

function showSuccessMessage() {
    console.log('click')
    toasty.style.display = 'block';
    return false;
}


