using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Synerscope.BO;
using Synerscope.BLL;

namespace Synerscope
{
    public partial class Synerscope : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int PersoonID;
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnPersoonToevoegen_Click(object sender, EventArgs e)
        {
            //Construeren
            SynerscopeBO synerscopeBO = new SynerscopeBO();
            SynerscopeBLL synerscopeBLL = new SynerscopeBLL();

            //Initialiseren
            synerscopeBO.Voornaam = txtVoornaam.Text;
            synerscopeBO.Achternaam = txtAchternaam.Text;

            if (synerscopeBLL.Create(synerscopeBO) == 0)
            {
                //MessageBox.Show("Fout opgetreden bij het wegschrijven van de data");
            }
            else
            {
                txtVoornaam.Text = "";
                txtAchternaam.Text = "";
            }
        }

        protected void btnHobbyToevoegenAanPersoon_Click(object sender, EventArgs e)
        {
            //Construeren
            SynerscopeBO synerscopeBO = new SynerscopeBO();
            SynerscopeBLL synerscopeBLL = new SynerscopeBLL();

            //Initialiseren
            synerscopeBO.PersoonID = Convert.ToInt32(ddlPersoon.SelectedValue);
            synerscopeBO.HobbyID = Convert.ToInt32(ddlHobby.SelectedValue);

            if (synerscopeBLL.CreateHobbyAanPersoon(synerscopeBO) == 0)
            {
                //MessageBox.Show("Fout opgetreden bij het wegschrijven van de data");
            }
        }
    }
}