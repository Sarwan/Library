<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cpLogin.aspx.cs" Inherits="CPanel_cpLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>كىرىش</title>
    <link href="../Common/login.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://www.modernizr.com/downloads/modernizr-latest.js"></script>
    <script src="../Scripts/placeholder.js" type="text/javascript"></script>
</head>
<body>
    <form id="slicklogin" runat="server">
          <label for="username">نامى:</label><asp:TextBox ID="txtUserName" runat="server" class="placeholder" placeholder="نامىڭىز"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvName" runat="server" 
              ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUserName">*</asp:RequiredFieldValidator>
        <label for="password">پارول</label><asp:TextBox ID="txtPass" runat="server" 
              class="placeholder" placeholder="پارولىڭىز" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator
            ID="rfvPass" runat="server" ErrorMessage="RequiredFieldValidator" 
              ControlToValidate="txtPass">*</asp:RequiredFieldValidator>
        <asp:Button ID="btnLogin" Text="كىرىش" runat="server" onclick="btnLogin_Click" />
        
    </form>
</body>
</html>
