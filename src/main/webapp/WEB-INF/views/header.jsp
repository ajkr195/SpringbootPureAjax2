<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SpringBootPureAJAX</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<link rel="stylesheet" src="css/main.css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">


<style type="text/css">
.fade2 {
	transform: scale(0.9);
	opacity: 0;
	transition: all .2s linear;
	display: block !important;
}

.fade2.show {
	opacity: 1;
	transform: scale(1);
}

.btn-super-large {
	width: 200px;
	height: 200px;
}

.btn-space {
	margin-right: 5px;
}

.logo-icon {
	transform: scale(10.0, 10.0);
	-ms-transform: scale(10.0, 10.0); /* IE 9 */
	-moz-transform: scale(10.0, 10.0); /* Firefox */
	-webkit-transform: scale(10.0, 10.0); /* Safari and Chrome */
	-o-transform: scale(10.0, 10.0); /* Opera */
}

.jumbotron {
	border-style: solid;
	margin-bottom: 0px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	background-color: transparent !important;
}

body {
	padding-top: 20px;
}

.footer {
	position: fixed;
	bottom: 0;
	width: 100%;
	/* Set the fixed height of the footer here */
	height: 20px; */
	line-height: 20px;
	background-color: #f5f5f5;
}

.control-label {
	padding-top: 4px;
}

.dropdown-menu>a:hover {
	background-color: #33BEFF;
	text-decoration: none;
}

/* .table-hover tbody tr:hover td, .table-hover tbody tr:hover th { */
/* 	background-color: #33BEFF; */
/* 	/* 	background-color: #F3F694 */ */
/* } */
</style>