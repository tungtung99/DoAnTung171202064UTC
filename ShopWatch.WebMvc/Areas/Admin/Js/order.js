function deleteOrder(id) {
    if (confirm('Some message')) {
        $.ajax({
            url: "/Admin/Orders/Cancelled",
            type: "GET",
            data: {
                id: id,
            },
            success: function (data) {
                localStorage.setItem("swal",
                    swal({
                        title: "Success!",
                        text: "Message sent",
                        type: "success",
                        timer: 1500,
                        showConfirmButton: false
                    })
                );
                window.setTimeout(function () {
                    location.reload();
                }, 1500);
            },
            error: function () {
                swal("Error", "Hủy đơn hàng thất bại :)", "error");
            }
        });
    } else {
    }
}