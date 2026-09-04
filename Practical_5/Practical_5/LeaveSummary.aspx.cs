using System;

namespace Practical_5
{
    public partial class LeaveSummary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve values from Session

                if (Session["EmpName"] != null)
                {
                    lblEmpName.Text =
                        Session["EmpName"].ToString();
                }

                if (Session["Leave_Date"] != null)
                {
                    DateTime leaveDate =
                        (DateTime)Session["Leave_Date"];

                    lblLeaveDate.Text =
                        leaveDate.ToString("dd-MM-yyyy");
                }

                if (Session["LeaveType"] != null)
                {
                    lblLeaveType.Text =
                        Session["LeaveType"].ToString();
                }

                if (Session["Reason"] != null)
                {
                    lblReason.Text =
                        Session["Reason"].ToString();
                }
            }
        }
    }
}

