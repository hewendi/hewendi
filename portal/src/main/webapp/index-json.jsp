<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.alibaba.fastjson.JSON"%>
<%
List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
for(int i=0; i<20; i++){
	Map<String, Object> map1 = new HashMap<String, Object>();
	map1.put("Name", "One"+i);
	map1.put("City", "Two"+i);
	map1.put("Country", "three"+i);	           
	list.add(map1);
}       
String listJson = JSON.toJSONString(list);
out.print("records="+listJson);
out.flush();
%>