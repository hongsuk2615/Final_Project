/* 일반함수 */
let label = document.querySelector('.label');
let options = document.querySelectorAll('.optionItem');
// 클릭한 옵션의 텍스트를 라벨 안에 넣음
let handleSelect = function (item) {
    label.innerHTML = item.textContent;
    label.value = item.value;
    label.parentNode.classList.remove('active');
}
// 옵션 클릭시 클릭한 옵션을 넘김
options.forEach(function (option) {
    option.addEventListener('click', function () { handleSelect(option) })
})
// 라벨을 클릭시 옵션 목록이 열림/닫힘
label.addEventListener('click', function () {
    if (label.parentNode.classList.contains('active')) {
        label.parentNode.classList.remove('active');
        document.querySelector('.optionList').style.display = 'none';
    } else {
        label.parentNode.classList.add('active');
        document.querySelector('.optionList').style.display = 'block';
    }
});