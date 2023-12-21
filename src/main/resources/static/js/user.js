
    $(document).ready(function(){
    // Activate tooltip
    $('[data-toggle="tooltip"]').tooltip();

    // Select/Deselect checkboxes
    var checkbox = $('table tbody input[type="checkbox"]');
    $("#selectAll").click(function(){
    if(this.checked){
    checkbox.each(function(){
    this.checked = true;
});
} else{
    checkbox.each(function(){
    this.checked = false;
});
}
});
    checkbox.click(function(){
    if(!this.checked){
    $("#selectAll").prop("checked", false);
}
});
});
    // editUser
    function editUser(userId) {

    $.ajax({
        url: `/listUser/` + userId,
        type: 'GET',
        success: function(response) {
            console.log(response)
            // Xử lý phản hồi từ máy chủ
            // Ví dụ: hiển thị thông tin người dùng trong một modal
            showModal(response);
        },
        error: function(error) {
            console.log(error)
        }
    });
    console.log(userId);


}
    function showModal(userData) {
    console.log(userData)
    // Hiển thị thông tin người dùng trong modal
    var userModal = $('#editEmployeeModal');
    // Hiển thị modal
    userModal.show();
    // Cập nhật các phần tử trong modal với dữ liệu người dùng
    userModal.find('.userName').val(userData.userName)
    userModal.find('.gmail').text(userData.gmail);
    // Các phần tử khác tương ứng với dữ liệu người dùng


}
    // delete
    function deleteUser(userId){
    var href = window.location.href
    var newHref = href + "/delete/" +  userId
    window.location.href = newHref
}