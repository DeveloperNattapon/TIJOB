<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="ITJOB_V._1._0._1.Login" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>IT Help Desk</title>

    <!-- Le styles -->
    <link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="Content/css/signin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            width: 700px;
            height: 200px;
            text-align: center;
            float: none;
        }
        .auto-style2 {
            width: 700px;
            height: 50px;
        }
    </style>
</head>
<body>

    <div class="container">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <img alt="" class="auto-style1" src="Images/headit.jpg" /><br />
        <form class="form-signin" runat="server">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <h2 class="form-signin-heading">Please sign in</h2>
            <label for="inputUser" class="sr-only">User ID</label>
            <input type="text" id="txtUserName" runat="server" class="form-control" placeholder="User ID" required="required" autofocus="autofocus" autocomplete="off" />
            <br />
            <label for="txtUserPass" class="sr-only">Password</label>
            <input type="password" id="txtUserPass" runat="server" class="form-control" placeholder="Password" required="required" />
            <asp:Label ID="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />
            <br />
            <br />
            <asp:Button CssClass="btn btn-lg btn-primary btn-block" ID="Button1" runat="server" Text="Sign in" OnClick="Button1_Click" />
            <br />
            <br />
        </form>
         <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <img alt="" class="auto-style2" src="Images/footer.jpg" /></p>
    </div>
    <!-- /container -->
    <script src="Scripts/jquery-3.1.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
   
</body>
</html>