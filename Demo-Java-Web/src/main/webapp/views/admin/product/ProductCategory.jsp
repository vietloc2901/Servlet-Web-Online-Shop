<%@include file="../../../common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh mục sản phẩm</title>
</head>
<body>
<br/>
<h2>Danh mục sản phẩm</h2>

<p>
    <a href="<c:url value='/admin-productcategory?type=add'/>" class="btn btn-primary ">
        <i class="fa fa-plus-square" aria-hidden="true"></i>
        Thêm mới
    </a>
</p>
<select class="btn btn-primary" id="base-product-category">
    <option value="0">Hiển thị trên trang chủ</option>
    <option value="-1">Tất cả danh mục</option>
</select>
<hr/>
<table class="table" id="replace-table">
    <thead class="thead-dark">
    <tr>
        <th></th>
        <th>
            Tên danh mục sản phẩm
        </th>
        <th>
            Người tạo
        </th>
        <th>Chi tiết</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    </thead>
    <c:forEach var="item" items="${model.getListResult()}">
        <tr id="row-${item.getID()}">
            <td>
                <img src="${item.getImage()}" style="width :150px"  alt=""/>
            </td>
            <td class="font-weight-bold">
                    ${item.getName()}
            </td>
            <td class="font-weight-bold">
                    ${item.getCreatedBy()}
            </td>
            <td class="font-weight-bold">
                <a href="<c:url value='/admin-productcategory?type=detail&ID=${item.getID()}'/> ">
                    <i class="fa-lg fa fa-info-circle" aria-hidden="true"></i>
                </a>
            </td>
            <td class="font-weight-bold">
                <a href="<c:url value='/admin-productcategory?type=edit&ID=${item.getID()}'/> ">
                    <i class="fa-lg fa fa-adjust" aria-hidden="true"></i>
                </a>
            </td>
            <td class="font-weight-bold">
                <a href="#" class="delete" id="${item.getID()}">
                    <i class="fa-lg fa fa-trash" aria-hidden="true"></i>
                </a>
            </td>
        </tr>
    </c:forEach>

</table>
<script>
    $('.delete').click(function (e){
        e.preventDefault();
        let id = parseInt($(this).attr("id"));
        let data = {"id" : id};
        if(confirm("Bạn có chắc chắn muốn xóa?")){
            $.ajax({
                url: '/api-productcategory-delete',
                type: 'delete',
                data: JSON.stringify(data),
                success: function (respone) {
                    if(respone.isDelete){
                        $('#row-'+id).remove();
                    }else{
                        alert("Có lỗi gì đó ! Vui lòng thử lại sau");
                    }
                },
                error: function (respone) {
                    console.log(respone);
                }
            })
        }else{}
    })
</script>
</body>
</html>
