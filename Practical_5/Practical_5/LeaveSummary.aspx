```aspx
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="LeaveSummary.aspx.cs"
    Inherits="Practical_5.LeaveSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Leave Summary</title>

    <style>

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: darkslateblue;
            margin: 0;
            padding: 40px;
        }

        .summary-container {
            max-width: 550px;
            margin: 0 auto;
            background-color: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            border-bottom: 2px solid #4a90e2;
            padding-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        .label {
            font-weight: bold;
            width: 40%;
            color: #34495e;
        }

        .value {
            color: #2c3e50;
        }

        .success {
            text-align: center;
            color: #27ae60;
            font-weight: bold;
            margin-bottom: 20px;
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="summary-container">

            <h1>LEAVE SUMMARY</h1>

            <div class="success">
                Leave Application Submitted Successfully
            </div>

            <table>

                <tr>
                    <td class="label">
                        Employee Name
                    </td>

                    <td class="value">
                        <asp:Label
                            ID="lblEmpName"
                            runat="server">
                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="label">
                        Leave Date
                    </td>

                    <td class="value">
                        <asp:Label
                            ID="lblLeaveDate"
                            runat="server">
                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="label">
                        Leave Type
                    </td>

                    <td class="value">
                        <asp:Label
                            ID="lblLeaveType"
                            runat="server">
                        </asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="label">
                        Reason
                    </td>

                    <td class="value">
                        <asp:Label
                            ID="lblReason"
                            runat="server">
                        </asp:Label>
                    </td>
                </tr>

            </table>

        </div>

    </form>

</body>

</html>
```
