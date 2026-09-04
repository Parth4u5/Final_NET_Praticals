<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="LeaveApply.aspx.cs"
    Inherits="Practical_5.LeaveApply" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Leave Application</title>

    <style>

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: darkslateblue;
            margin: 0;
            padding: 40px;
        }

        .form-container {
            max-width: 550px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 25px;
            border-bottom: 2px solid #4a90e2;
            padding-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table td {
            padding: 12px 8px;
            vertical-align: top;
        }

        table td.label-cell {
            font-weight: 600;
            color: #34495e;
            width: 35%;
            padding-top: 16px;
        }

        input[type="text"],
        textarea,
        select {
            width: 90%;
            padding: 8px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        textarea:focus,
        select:focus {
            border-color: #4a90e2;
            outline: none;
            box-shadow: 0 0 4px rgba(74, 144, 226, 0.4);
        }

        textarea {
            resize: vertical;
        }

        .btn-row {
            text-align: center;
            padding-top: 20px;
        }

        .aspNetButton {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        .aspNetButton:hover {
            background-color: #357abd;
        }

        .msg-label {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #c0392b;
            font-weight: 600;
        }

        .checkbox-cell {
            display: flex;
            align-items: center;
            gap: 8px;
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="form-container">

            <h1>LEAVE APPLICATION</h1>

            <table>

                <!-- Employee Name -->

                <tr>

                    <td class="label-cell">
                        Employee Name:
                    </td>

                    <td>

                        <asp:TextBox
                            ID="txtemp"
                            runat="server">
                        </asp:TextBox>

                    </td>

                </tr>

                <!-- Leave Date -->

                <tr>

                    <td class="label-cell">
                        Leave Date:
                    </td>

                    <td>

                        <asp:Label
                            ID="lblLeaveDate"
                            runat="server">
                        </asp:Label>

                    </td>

                </tr>

                <!-- Leave Type -->

                <tr>

                    <td class="label-cell">
                        Leave Type:
                    </td>

                    <td>

                        <asp:DropDownList
                            ID="DropDownList1"
                            runat="server"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">

                            <asp:ListItem Value="Medical">
                                Medical
                            </asp:ListItem>

                            <asp:ListItem Value="Personal">
                                Personal
                            </asp:ListItem>

                            <asp:ListItem Value="Emergency">
                                Emergency
                            </asp:ListItem>

                        </asp:DropDownList>

                    </td>

                </tr>

                <!-- Reason -->

                <tr>

                    <td class="label-cell">
                        Reason:
                    </td>

                    <td>

                        <asp:TextBox
                            ID="txtReason"
                            runat="server"
                            TextMode="MultiLine"
                            Rows="4"
                            Columns="20">
                        </asp:TextBox>

                    </td>

                </tr>

                <!-- Remember Me -->

                <tr>

                    <td class="label-cell">
                        Remember My Name:
                    </td>

                    <td class="checkbox-cell">

                        <asp:CheckBox
                            ID="CheckBox1"
                            runat="server"
                            Text="Remember Me" />

                    </td>

                </tr>

                <!-- Submit -->

                <tr>

                    <td colspan="2" class="btn-row">

                        <asp:Button
                            ID="btnSubmit"
                            runat="server"
                            Text="Submit Leave"
                            CssClass="aspNetButton"
                            OnClick="btnSubmit_Click" />

                    </td>

                </tr>

                <!-- Message -->

                <tr>

                    <td colspan="2">

                        <asp:Label
                            ID="lblmsg"
                            runat="server"
                            CssClass="msg-label">
                        </asp:Label>

                    </td>

                </tr>

            </table>

        </div>

    </form>

</body>

</html>

