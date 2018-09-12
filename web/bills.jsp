<%@ page import="org.atomsk.dao.BillsDAO" %>
<%@ page import="org.atomsk.domain.BillsVO" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.atomsk.domain.OrderVO" %><%--
  Created by IntelliJ IDEA.
  User: BIT03-02
  Date: 2018-09-10
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%
    BillsDAO dao = new BillsDAO();
    BillsVO vo = new BillsVO();
    String[] values = request.getParameterValues("cnt");
    System.out.println(Arrays.toString(values));


    //DB에서 주문번호를 채번
    int orderNum = dao.getOrderNum();

    for(String str: values){

        String[] arr = str.split("_");

        if(arr[1].equals("0")){
            continue;
        }

        String mnoStr = arr[0];
        String qtyStr = arr[1];

        OrderVO orderVO = new OrderVO();
        orderVO.setOno(orderNum);
        orderVO.setMno(Integer.parseInt(mnoStr));
        orderVO.setQty(Integer.parseInt(qtyStr));

        System.out.println(orderVO);

    }

%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1><%=orderNum%>번으로 주문되었습니다.</h1>
</body>
</html>
