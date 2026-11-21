using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Practical9
{
    public partial class Companies : Page
    {
        private static readonly string DbConnection =
            ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            RenderPlacementTable();
            RenderPlacementList();
        }

        private void RenderPlacementTable()
        {
            using (var connection = new SqlConnection(DbConnection))
            using (var adapter = new SqlDataAdapter("SELECT * FROM Placements", connection))
            {
                var records = new DataTable();
                adapter.Fill(records);
                rptCompanies.DataSource = records;
                rptCompanies.DataBind();
            }
        }

        private void RenderPlacementList()
        {
            using (var connection = new SqlConnection(DbConnection))
            using (var adapter = new SqlDataAdapter("SELECT * FROM Placements", connection))
            {
                var records = new DataTable();
                adapter.Fill(records);
                dlPlacements.DataSource = records;
                dlPlacements.DataBind();
            }
        }
    }
}
