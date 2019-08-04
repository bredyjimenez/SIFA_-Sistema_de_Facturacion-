<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nacionalidades.aspx.cs" Inherits="SIFA_SistemadeFacturacion_.Nacionalidades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="pBusqueda" runat="server" DefaultButton="btnBuscar">
                <br />
                <asp:Label ID="Label5" runat="server" Text="MANTENIMIENTO DE NACIONALIDADES"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Label1" runat="server" Text="Nombre: "></asp:Label>
            <asp:TextBox ID="txtNombreBusqueda" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
                <br />
                <br />
            </asp:Panel>

            <asp:GridView ID="gvNacionalidades" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
                    <asp:CheckBoxField DataField="estado" HeaderText="estado" SortExpression="estado" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SIFAsistemadefacturacionConnectionString %>" SelectCommand="SELECT * FROM [Nacionalidades]"></asp:SqlDataSource>

            <asp:Panel ID="pCambio" runat="server">
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
            <br />
            <br />
            <br />
            <asp:Button ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
            <asp:Button ID="btnModificar" runat="server" OnClick="btnModificar_Click" Text="Modificar" />
            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
            <br />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Retornar</asp:HyperLink>
        </asp:Panel>
        </div>
        <p>
            &nbsp;</p>
        <asp:SqlDataSource ID="SqlDataSouerceNacionalidad" runat="server" ConnectionString="<%$ ConnectionStrings:SIFAsistemadefacturacionConnectionString %>" DeleteCommand="DELETE FROM Nacionalidades WHERE (id = @id)" InsertCommand="INSERT INTO Nacionalidades(nombre, estado) VALUES (@nombre, @estado)" ProviderName="<%$ ConnectionStrings:SIFAsistemadefacturacionConnectionString.ProviderName %>" SelectCommand="SELECT id, nombre, estado FROM Nacionalidades WHERE (id = @id)" UpdateCommand="UPDATE Nacionalidades SET nombre = @nombre, estado = @estado WHERE (id = @id)">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="estado" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="id" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="estado" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
