<%@ page import="Beans.ShoppingCart" %>
<%@ page import="Beans.CartItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/10/2023
  Time: 9:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ hàng</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<body>
<%
ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("cart");
if(shoppingCart==null){
    response.sendRedirect("ProductController");
}
    List<CartItem> cartItems = shoppingCart.getCartItemList();
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance();
%>
<div class="container">
    <h3>Giỏ hàng của tôi</h3>
    <a href="productsList.jsp">Tiếp tục mua hàng</a>
</div>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Tên</th>
            <th scope="col">Giá</th>
            <th scope="col">Hình ảnh</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Thành tiền</th>
            <th scope="col">Chức năng</th>
        </tr>
        </thead>
        <tbody>
        <%
            int count = 0;
            for (CartItem cartItem : cartItems){
        %>
        <tr>
            <td>
                <%=count++%>
            </td>
            <td><%=cartItem.getProduct().getName()%></td>
            <td><%=cartItem.getProduct().getPrice()%></td>
            <td><img src="<%=cartItem.getProduct().getThumb()%>" alt=""> </td>
            <td><%=cartItem.getQuanlity()%></td>
            <td><%=numberFormat.format(cartItem.getTotalPrice())%></td>
            <td>

                <form action="ShopingCartCL">
                    <input type="number" name="quanlity">
                    <input type="hidden" name="action" value="put">
                    <input type="hidden" name="id" value="<%=cartItem.getProduct().getId()%>">
                    <button type="submit" class="btn btn-success btn-sm">Cập nhật</button>
                </form>

                <form action="ShopingCartCL">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%=cartItem.getProduct().getId()%>">
                    <button type="submit" class="btn btn-danger btn-sm">Xoá</button>
                </form>


            </td>
        </tr>

        <% }%>
        </tbody>
    </table>
</div>
</body>
</html>
