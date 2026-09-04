using System;

namespace Practical_5
{
    public partial class calenderV2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            // Get the selected date
            DateTime selectedDate = Calendar1.SelectedDate;

            // Display selected date
            lblselectedDate.Text =
                "Selected Date: " + selectedDate.ToString("dd-MM-yyyy");

            // Store selected date in Session
            Session["Leave_Date"] = selectedDate;
        }

        protected void btnApplyLeave_Click(object sender, EventArgs e)
        {
            // Make sure a date has been selected
            if (Session["Leave_Date"] == null)
            {
                lblselectedDate.Text = "Please select a date first.";
                return;
            }

            // Go to Leave Application page
            Response.Redirect("LeaveApply.aspx");
        }
    }
}

