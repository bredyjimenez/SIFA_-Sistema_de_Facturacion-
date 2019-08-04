<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="SIFA_SistemadeFacturacion_.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="menu">
            <ul>
                <li><a href="#">FACTURAS</a></li>
                <li><a href="#">DETALLES F</a></li>
                <li><a href="#">PRODUCTOS</a></li>
            <%--    <li><a href="#">PRODUCTOS</a>
                                    <ul>
                    <li><a href="#">CLIENTES</a></li>
                </ul>
                </li>--%>
                <li><a href="#">CLIENTES</a></li>
                <li><a href="Suplidores.aspx">SUPLIDORES</a></li>
                <li><a href="Nacionalidades.aspx">NACIONALIDADES</a></li>
                <li><a href="#">EMPLEADOS</a></li>
                <li><a href="Roles.aspx">ROLES</a></li>
                <li><a href="#">USUARIOS</a></li>
            </ul>
        </div>
    </form>
</body>
</html>
