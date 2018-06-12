<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ITDept.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.ITDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style type="text/css">
        .auto-style1 {
            width: 700px;
            height: 481px;
        }
        #form1 {
            text-align: center;
        }
        .noborders td {
        border:0;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:Table id="MyTable" runat="server" CssClass="noborders" cellspacing="0" cellpadding="5" border="1" Width="1167px" Height="1380px" BorderStyle="None">
            <asp:TableRow runat="server">
                <asp:TableCell colspan="2"  runat="server">
                    <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardjirasak.png"  />
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                   <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardsithikorn.png"  />
                </asp:TableCell><asp:TableCell runat="server">
                    <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardkrairueg.png"  />
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                   <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardjarawee.png"  />
                </asp:TableCell><asp:TableCell runat="server">
                    <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardchanchai.png"  />
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow runat="server">
                <asp:TableCell runat="server">
                   <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardnutjaree.png"  />
                </asp:TableCell><asp:TableCell runat="server">
                    <img alt="" class="auto-style1" style="height:300px;width:450px;" src="Images/cardsarawut.png"  />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>

        <br />
        <br />
        <br />
        <br />

    </form></asp:Content>