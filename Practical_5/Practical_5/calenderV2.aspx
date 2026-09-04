<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="calenderV2.aspx.cs"
    Inherits="Practical_5.calenderV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Select Leave Date</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: darkslateblue;
            margin: 0;
            padding: 40px;
        }

        .container {
            width: 400px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }

        h1 {
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 25px;
        }

        .calendar {
            margin: 0 auto;
        }

        .selected-date {
            display: block;
            margin: 20px 0;
            font-weight: bold;
            color: #2c3e50;
        }

        .btn {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 15px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #357abd;
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="container">

            <h1>Select Leave Date</h1>

            <asp:Calendar
                ID="Calendar1"
                runat="server"
                CssClass="calendar"
                BackColor="White"
                BorderColor="Black"
                BorderStyle="Solid"
                CellSpacing="1"
                Font-Names="Verdana"
                Font-Size="9pt"
                ForeColor="Black"
                Height="250px"
                NextPrevFormat="ShortMonth"
                OnSelectionChanged="Calendar1_SelectionChanged"
                Width="330px">

                <DayHeaderStyle
                    Font-Bold="True"
                    Font-Size="8pt"
                    ForeColor="#333333"
                    Height="8pt" />

                <DayStyle BackColor="#CCCCCC" />

                <NextPrevStyle
                    Font-Bold="True"
                    Font-Size="8pt"
                    ForeColor="White" />

                <OtherMonthDayStyle
                    ForeColor="#999999" />

                <SelectedDayStyle
                    BackColor="#333399"
                    ForeColor="White" />

                <TitleStyle
                    BackColor="#333399"
                    BorderStyle="Solid"
                    Font-Bold="True"
                    Font-Size="12pt"
                    ForeColor="White"
                    Height="12pt" />

                <TodayDayStyle
                    BackColor="#999999"
                    ForeColor="White" />

            </asp:Calendar>

            <br />

            <asp:Label
                ID="lblselectedDate"
                runat="server"
                CssClass="selected-date">
            </asp:Label>

            <br />

            <asp:Button
                ID="btnApplyLeave"
                runat="server"
                Text="Apply Leave"
                CssClass="btn"
                OnClick="btnApplyLeave_Click" />

        </div>

    </form>

</body>
</html>

