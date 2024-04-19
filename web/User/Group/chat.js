
function sendChat() {
    var msg = document.getElementById("msg").value;
    $.ajax({
        url: "AjaxChat.jsp",
        type: "POST",
        data: {chat: msg},
        success: function(result) {
            document.getElementById("msg").value = "";
            $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
            reloadSection();
        }
    });


}




reloadSection();

$(document).ready(function() {
    setInterval(function() {
        reloadSection();
    }, 1000);
});

function reloadSection() {
    $("#conversation").load('Load.jsp');
    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
}














   