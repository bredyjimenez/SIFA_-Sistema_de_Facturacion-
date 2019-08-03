<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="SIFA_SistemadeFacturacion_.Roles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pBusqueda" runat="server" DefaultButton="btnBuscar">
            <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="txtNombreBusqueda" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" />
            </asp:Panel>
        </div>
        <p>
            </p>
        <p>
            <asp:GridView ID="gvRoles" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="3">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="estado" HeaderText="Estado" />
                </Columns>
            </asp:GridView>
        </p>
        <p>
            </p>
        <asp:Panel ID="pCambio" runat="server">
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" />
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Código: "></asp:Label>
            <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Estado: "></asp:Label>
            <asp:TextBox ID="txtEstado" runat="server"></asp:TextBox>
        </asp:Panel>
        <p>
        </p>
    </form>
</body>
</html>
