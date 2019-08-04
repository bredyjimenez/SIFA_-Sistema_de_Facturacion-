<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suplidores.aspx.cs" Inherits="SIFA_SistemadeFacturacion_.Suplidores" %>

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
                <asp:Label ID="Label5" runat="server" Text="MANTENIMIENTO DE SUPLIDORES"></asp:Label>
                <br />
                <br />
            <asp:Label ID="Label1" runat="server" Text="Nombre de la Compañía: "></asp:Label>
            <asp:TextBox ID="txtNombreBusqueda" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                <asp:Button ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" />
                <br />
                <br />
            </asp:Panel>

            <asp:GridView ID="gvSuplidores" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre_compania" HeaderText="nombre_compania" SortExpression="nombre_compania" />
                    <asp:BoundField DataField="nombre_contacto" HeaderText="nombre_contacto" SortExpression="nombre_contacto" />
                    <asp:BoundField DataField="telefono_compania" HeaderText="telefono_compania" SortExpression="telefono_compania" />
                    <asp:BoundField DataField="telefono_contacto" HeaderText="telefono_contacto" SortExpression="telefono_contacto" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SIFAsistemadefacturacionConnectionString %>" SelectCommand="SELECT * FROM [Suplidor]"></asp:SqlDataSource>

        <asp:Panel ID="pCambio" runat="server" Visible="false">
            <br />
                <br />
            <asp:Label ID="Label2" runat="server" Text="Código: "></asp:Label>
            <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Nombre de la Compañía: "></asp:Label>
            <asp:TextBox ID="txtNombreCompania" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Nombre del Contacto: "></asp:Label>
            <asp:TextBox ID="txtNombreContacto" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="Teléfono de la Compañía: "></asp:Label>
            <asp:TextBox ID="txtTelefonoCompania" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="Teléfono de la Contacto: "></asp:Label>
            <asp:TextBox ID="txtTelefonoContacto" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Email: "></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />
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
            <asp:SqlDataSource ID="SqlDataSourceSuplidores" runat="server" ConnectionString="<%$ ConnectionStrings:SIFAsistemadefacturacionConnectionString %>" DeleteCommand="DELETE FROM Suplidor WHERE (id = @id)" InsertCommand="INSERT INTO Suplidor(nombre_compania, nombre_contacto, telefono_compania, telefono_contacto, email) VALUES (@nombre_compania, @nombre_contacto, @telefono_compania, @telefono_contacto, @email)" ProviderName="<%$ ConnectionStrings:SIFAsistemadefacturacionConnectionString.ProviderName %>" SelectCommand="SELECT id, nombre_compania, nombre_contacto, telefono_compania, telefono_contacto, email FROM Suplidor WHERE (id = @id)" UpdateCommand="UPDATE Suplidor SET nombre_compania = @nombre_compania, nombre_contacto = @nombre_contacto, telefono_compania = @telefono_compania, telefono_contacto = @telefono_contacto, email = @email WHERE (id = @id)">
                <DeleteParameters>
                    <asp:Parameter Name="id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre_compania" />
                    <asp:Parameter Name="nombre_contacto" />
                    <asp:Parameter Name="telefono_compania" />
                    <asp:Parameter Name="telefono_contacto" />
                    <asp:Parameter Name="email" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre_compania" />
                    <asp:Parameter Name="nombre_contacto" />
                    <asp:Parameter Name="telefono_compania" />
                    <asp:Parameter Name="telefono_contacto" />
                    <asp:Parameter Name="email" />
                    <asp:Parameter Name="id" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
