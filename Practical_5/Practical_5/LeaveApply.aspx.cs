using System;

namespace Practical_5
{
    public partial class LeaveApply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve Employee ID/Name from Cookie
                if (Request.Cookies["EmpID"] != null)
                {
                    txtemp.Text = Request.Cookies["EmpID"].Value;
                }

                // Retrieve selected leave date from Session
                if (Session["Leave_Date"] != null)
                {
                    DateTime selectedDate =
                        (DateTime)Session["Leave_Date"];

                    lblLeaveDate.Text =
                        selectedDate.ToString("dd-MM-yyyy");
                }
                else
                {
                    lblLeaveDate.Text = "No date selected";
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(
            object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string empName = txtemp.Text.Trim();
            string leaveType = DropDownList1.SelectedValue;
            string reason = txtReason.Text.Trim();

            // Validate employee name
            if (string.IsNullOrEmpty(empName))
            {
                lblmsg.Text = "Please enter Employee Name.";
                return;
            }

            // Validate reason
            if (string.IsNullOrEmpty(reason))
            {
                lblmsg.Text = "Please enter the reason for leave.";
                return;
            }

            // Validate date
            if (Session["Leave_Date"] == null)
            {
                lblmsg.Text = "Please select a leave date first.";
                return;
            }

            // Validate checkbox
            if (!CheckBox1.Checked)
            {
                lblmsg.Text =
                    "Please accept the terms and conditions.<br />" +
                    "Employee Name: " + Server.HtmlEncode(empName) + "<br />" +
                    "Leave Type: " + Server.HtmlEncode(leaveType) + "<br />" +
                    "Reason: " + Server.HtmlEncode(reason);

                return;
            }

            // Store leave information in Session
            Session["EmpName"] = empName;
            Session["LeaveType"] = leaveType;
            Session["Reason"] = reason;

            // Store employee name/ID in Cookie
            Response.Cookies["EmpID"].Value = empName;
            Response.Cookies["EmpID"].Expires =
                DateTime.Now.AddDays(1);

            // Go to Leave Summary page
            Response.Redirect("LeaveSummary.aspx");
        }
    }
}

