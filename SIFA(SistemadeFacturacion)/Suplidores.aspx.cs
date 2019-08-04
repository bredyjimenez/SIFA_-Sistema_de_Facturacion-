using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // importar

namespace SIFA_SistemadeFacturacion_
{
    public partial class Suplidores : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar(pCambio);
            pCambio.Visible = true;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            SqlDataSourceSuplidores.SelectParameters["id"].DefaultValue = txtNombreBusqueda.Text;
            SqlDataSourceSuplidores.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceSuplidores.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                txtCodigo.Text = registros["id"].ToString();
                txtNombreCompania.Text = registros["nombre_compania"].ToString();
                txtNombreContacto.Text = registros["nombre_contacto"].ToString();
                txtTelefonoCompania.Text = registros["telefono_compania"].ToString();
                txtTelefonoContacto.Text = registros["telefono_contacto"].ToString();
                txtEmail.Text = registros["email"].ToString();
                txtNombreBusqueda.Text = "";
                pCambio.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error al buscar')</script>");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSourceSuplidores.InsertParameters[0].DefaultValue = txtNombreCompania.Text;
            SqlDataSourceSuplidores.InsertParameters[1].DefaultValue = txtNombreContacto.Text;
            SqlDataSourceSuplidores.InsertParameters[2].DefaultValue = txtTelefonoCompania.Text;
            SqlDataSourceSuplidores.InsertParameters[3].DefaultValue = txtTelefonoContacto.Text;
            SqlDataSourceSuplidores.InsertParameters[4].DefaultValue = txtEmail.Text;
            SqlDataSourceSuplidores.Insert();
            Response.Write("<script>alert('Se guardo correctamente')</script>");
            Limpiar(pCambio);
            gvSuplidores.DataBind();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            SqlDataSourceSuplidores.UpdateParameters["nombre_compania"].DefaultValue = txtNombreCompania.Text;
            SqlDataSourceSuplidores.UpdateParameters["nombre_contacto"].DefaultValue = txtNombreContacto.Text;
            SqlDataSourceSuplidores.UpdateParameters["telefono_compania"].DefaultValue = txtTelefonoCompania.Text;
            SqlDataSourceSuplidores.UpdateParameters["telefono_contacto"].DefaultValue = txtTelefonoContacto.Text;
            SqlDataSourceSuplidores.UpdateParameters["email"].DefaultValue = txtEmail.Text;
            SqlDataSourceSuplidores.UpdateParameters["id"].DefaultValue = txtCodigo.Text;
            int cant;
            cant = SqlDataSourceSuplidores.Update();
            if (cant == 1)
            {
                Response.Write("<script>alert('Se modifico el Suplidor')</script>");
                gvSuplidores.DataBind();
            }
            else
                Response.Write("<script>alert('No existe el codigo')</script>");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            SqlDataSourceSuplidores.DeleteParameters["id"].DefaultValue = txtCodigo.Text;
            int cant;
            cant = SqlDataSourceSuplidores.Delete();
            if (cant == 1)
            {
                Response.Write("<script>alert('Se elimino el Suplidor')</script>");
                gvSuplidores.DataBind();
                Limpiar(pCambio);
            }
            else
                Response.Write("<script>alert('No existe la Nacionalidad')</script>");
        }

        //Metodo limpiar
        protected void Limpiar(Panel p)
        {
            foreach (var c in p.Controls)
            {
                if (c is TextBox)
                {
                    (c as TextBox).Text = "";
                }
            }
        }
    }
}