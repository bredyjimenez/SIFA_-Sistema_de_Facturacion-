using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; // importar

namespace SIFA_SistemadeFacturacion_
{
    public partial class Roles : System.Web.UI.Page
    {
        //Metodo limpiar
        protected void Limpiar2(Panel p)
        {
            foreach (var c in p.Controls)
            {
                if (c is TextBox)
                {
                    (c as TextBox).Text = "";
                }
                /*else if (c is DropDownList)
                {
                    (c as DropDownList).SelectedIndex = 0;
                }*/
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectParameters["id"].DefaultValue = txtNombreBusqueda.Text;
            SqlDataSource2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                txtCodigo.Text = registros["id"].ToString();
                txtNombre.Text = registros["nombre"].ToString();
                txtEstado.Text = registros["estado"].ToString();
                txtNombreBusqueda.Text = "";
                pCambio.Visible = true;
            }
            else
            {
                Response.Write("<script>alert('Error al buscar')</script>");
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar2(pCambio);
            pCambio.Visible = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SqlDataSource2.InsertParameters[0].DefaultValue = txtNombre.Text;
            SqlDataSource2.InsertParameters[1].DefaultValue = txtEstado.Text;
            SqlDataSource2.Insert();
            Response.Write("<script>alert('Se guardo correctamente')</script>");
            Limpiar2(pCambio);
            gvRoles.DataBind();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            SqlDataSource2.UpdateParameters["nombre"].DefaultValue = txtNombre.Text;
            SqlDataSource2.UpdateParameters["estado"].DefaultValue = txtEstado.Text;
            int cant;
            cant = SqlDataSource2.Update();
            if (cant == 1)
            {
                Response.Write("<script>alert('Se modifico el rol')</script>");
                gvRoles.DataBind();

            }
            else
                Response.Write("<script>alert('No existe el codigo')</script>");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            SqlDataSource2.DeleteParameters["id"].DefaultValue = txtCodigo.Text;
            int cant;
            cant = SqlDataSource2.Delete();
            if (cant == 1)
                Response.Write("<script>alert('Se elimino el Rol')</script>");
            else
                Response.Write("<script>alert('No existe el Rol')</script>");
        }
    }
}