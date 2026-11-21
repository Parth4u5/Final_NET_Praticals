using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Practical9
{
    public partial class Default : Page
    {
        // Shared setting is declared in Web.config instead of being hard-coded on each page.
        private static readonly string DbConnection =
            ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;

            RenderSummary();
            RenderStudentGrid();
        }

        private void RenderSummary()
        {
            using (var connection = new SqlConnection(DbConnection))
            {
                connection.Open();
                using (var command = new SqlCommand("SELECT COUNT(*) FROM Students", connection))
                {
                    lblTotal.Text = command.ExecuteScalar().ToString();

                    command.CommandText = "SELECT COUNT(*) FROM Students WHERE IsPlaced = 1";
                    lblPlaced.Text = command.ExecuteScalar().ToString();

                    command.CommandText = "SELECT COUNT(*) FROM Students WHERE IsPlaced = 0";
                    lblUnplaced.Text = command.ExecuteScalar().ToString();

                    command.CommandText = "SELECT MAX(PackageLPA) FROM Placements";
                    object topPackage = command.ExecuteScalar();
                    decimal highest = topPackage == DBNull.Value ? 0 : Convert.ToDecimal(topPackage);
                    lblHighestPackage.Text = highest.ToString("N2");
                }

                int total = Convert.ToInt32(lblTotal.Text);
                int placed = Convert.ToInt32(lblPlaced.Text);
                decimal percentage = total == 0 ? 0 : (decimal)placed * 100 / total;
                lblPercentage.Text = percentage.ToString("N2") + "%";
            }
        }

        private void RenderStudentGrid()
        {
            using (var connection = new SqlConnection(DbConnection))
            using (var adapter = new SqlDataAdapter("SELECT * FROM Students", connection))
            {
                var records = new DataTable();
                adapter.Fill(records);
                gvPlacements.DataSource = records;
                gvPlacements.DataBind();
            }
        }
    }
}
