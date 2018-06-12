<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Homepage.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.Homepage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="form-group text-center">
                    <img alt="" class="auto-style1" src="Images/status.png" style="width: 600px; height: 144px;" /><br />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="centerDiv2">
                    <div class="col-lg-12 col-sm-12">
                      
                        <div class="col-lg-8 col-sm-8">
                            <div class="form-group">
                                <label>ค้นหา</label>
                                <input runat="server" type="text" class="form-control" id="txtSearchHp" placeholder="Search.." name="search" />
                            </div>
                        </div>
                        <div class="col-lg-4 col-sm-4">
                            <div class="form-group">
                                <label>ค้นหาจากวันที่</label>
                                <asp:TextBox CssClass="form-control" ID="dtpFromDate" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                <cc1:CalendarExtender ID="CalendarExtender" runat="server" Enabled="True" TargetControlID="dtpFromDate" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12 col-sm-12">
                        <div class="col-lg-10 col-md-10">
                            <div class="form-group text-right absoluteTop">
                                <asp:DropDownList ID="ddlcategory" runat="server">
                                    <asp:ListItem>ค้นหาจาก</asp:ListItem>
                                    <asp:ListItem>ประเภทงาน</asp:ListItem>
                                    <asp:ListItem>หมายเลขเอกสาร</asp:ListItem>
                                    <asp:ListItem>ชื่อผู้สร้าง</asp:ListItem>
                                    <asp:ListItem>ผู้รับงาน</asp:ListItem>
                                    <asp:ListItem>ผู้แก้ไข</asp:ListItem>
                                    <asp:ListItem>วันที่รับงาน</asp:ListItem>
                                    <asp:ListItem>วันที่แก้ไข</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2">
                            <div class="form-group">
                                <button type="button" class="btn btn-info" id="btnSearhHp" runat="server" onserverclick="btnSearhHp_Click">
                                    <span class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <fieldset>
            <legend>
                <asp:Label ID="title1" class="control-label " runat="server"> MyDocument </asp:Label>
            </legend>
        </fieldset>

        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                      <div class="form-group text-right">

                            <button runat="server" id="btnAdd" class="btn btn-success icon-btn" title="btnAdd" onserverclick="btnAdd_Click"><i class="fa fa-plus"></i>Create Job</button>

                        </div>

                    <asp:UpdatePanel ID="UpModal" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="userGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ItJobDocID" Width="890px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowDataBound="userGV_RowDataBound">
                                <AlternatingRowStyle CssClass="altrowstyle" BackColor="#CCCCCC" />
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle CssClass="headerstyle" BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Height="20px" />
                                <RowStyle CssClass="rowstyle" HorizontalAlign="Center" Height="20px" />
                                <Columns>
                                    <asp:TemplateField HeaderText="หมายเลขเอกสาร" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocID" runat="server" Text='<%# Bind("ItJobDocID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ผู้สั่งงาน" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRequest" runat="server" Text='<%# Bind("RequestFrom")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="แผนก" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDivision" runat="server" Text='<%# Bind("DivisionName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ผู้รับงาน" HeaderStyle-CssClass="text-center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblRecipient" runat="server" Text='<%# Bind("Recipient")%>'>-</asp:Label>
                                        </ItemTemplate>

                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ผู้แก้ไข" HeaderStyle-CssClass="text-center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblAssign" runat="server" Text='<%# Bind("Assign")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="text-center" />
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="วันที่สร้างเอกสาร" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate1" runat="server" Text='<%# Bind("CreateDate","{0:dd/MM/yyyy}")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="สถานะ">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" Height="30" runat="server" ImageUrl='<%# Bind("JobStatus")%>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle Height="40px" Width="50px" />
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Height="40px" />
                                <PagerSettings FirstPageText="First " LastPageText="Last " NextPageText="Next " PreviousPageText="Previous " />
                                <PagerStyle BackColor="White" ForeColor="#000099" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </div>



        <fieldset>
            <legend>
                <asp:Label ID="title2" class="control-label " runat="server"> Job IT เอกสารรอรับงาน </asp:Label>
            </legend>
            <br />
        </fieldset>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <asp:GridView ID="JobITGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ItJobDocID" Width="950px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="JobITGV_RowCommand">
                                <AlternatingRowStyle CssClass="altrowstyle" BackColor="#CCCCCC" />
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle CssClass="headerstyle" BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" />
                                <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="First " LastPageText=" Last" NextPageText="Next " PreviousPageText=" Previous " />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Height="20px" />
                                <RowStyle CssClass="rowstyle" HorizontalAlign="Center" Height="20px" />
                                <Columns>
                                    <asp:TemplateField HeaderText="หมายเลขเอกสาร" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocID1" runat="server" Text='<%# Bind("ItJobDocID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ผู้สั่งงาน" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRequest1" runat="server" Text='<%# Bind("RequestFrom")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="วันที่สร้างเอกสาร" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreateDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="หัวข้องาน">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCaseJob" runat="server" Text='<%# Bind("CaseJob")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>
                                        <ItemStyle Width="180px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="สถานะ">
                                        <ItemTemplate>
                                            <asp:Image ID="Image2" Height="30" runat="server" ImageUrl='<%# Bind("JobStatus")%>' />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle Height="40px" Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="รับงาน" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="AssignTo" Text="AssignTo" CommandArgument='<%# Eval("ItJobDocID")%>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:TemplateField>
                                </Columns>
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />

                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#383838" />
                            </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">AssignJob To</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                    <div class=" form-horizontal ">
                                        <div class=" form-group">
                                            <label class="col-sm-3 control-label " for="lbldocID2">หมายเลขเอกสาร</label>
                                            <div class="col-sm-3 control-label">
                                                <asp:Label ID="lbldocID2" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" form-group">
                                            <label class="col-sm-3 control-label" for="lblRequest2">ผู้สั่งงาน</label>
                                            <div class="col-sm-3 control-label">
                                                <asp:Label ID="lblRequest2" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" form-group">
                                            <label class="col-sm-3 control-label" for="lblcreate2">ผู้สร้างเอกสาร</label>
                                            <div class="col-sm-3 control-label">
                                                <asp:Label ID="lblcreate2" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-sm-1 control-label" for="lblBranch">สาขา</label>
                                            <div class="col-sm-1 control-label">
                                                <asp:Label ID="lblBranch" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <label class="col-sm-1 control-label" for="lblDept">แผนก</label>
                                            <div class="col-sm-2 control-label">
                                                <asp:Label ID="lblDept" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" form-group">
                                            <label class="col-sm-3 control-label " for="lblCaseJob">หัวข้อเอกสาร</label>
                                            <div class="col-sm-3 control-label ">
                                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class=" form-group">
                                            <label class="col-sm-3 control-label " for="lblDetail">รายละเอียด</label>
                                            <div class="col-lg-8 text-left">
                                                <asp:Label ID="lblDetail" runat="server" Text="Label"></asp:Label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class=" col-sm-2 control-label" for="ddlPosition">ส่งงานให้</label>
                                            <div class="col-sm-3 control-label">
                                                <asp:DropDownList ID="ddlPosition" runat="server" Width="120px" AppendDataBoundItems="true">
                                                    <asp:ListItem>- กรุณาเลือก -</asp:ListItem>
                                                    <asp:ListItem>Programmer</asp:ListItem>
                                                    <asp:ListItem>ITSupport</asp:ListItem>
                                                    <asp:ListItem>GraphicDesign</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <label class=" col-sm-3 control-label" for="ddlAssign">ผู้รับผิดชอบงาน</label>
                                            <div class="col-sm-3 control-label">
                                                <asp:DropDownList ID="ddlAssign" runat="server" Width="120px" DataTextField = "Name_thai" DataValueField = "UserId" AppendDataBoundItems="true">
                                                    <asp:ListItem>- กรุณาเลือก -</asp:ListItem>
                                                </asp:DropDownList>
                                               <!-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=E01-NB-024\SQLEXPRESS;Initial Catalog=DB_EaglesInternal;User ID=sa;Password=7tFCca6pzt;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblUser] WHERE (Dept = 'IT')"></asp:SqlDataSource>-->
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label" for="txtComment">รายละเอียดเพิ่มเติมจากผู้รับงาน</label>
                                            <div class="col-sm-3 ">
                                                <asp:TextBox ID="txtComment" CssClass="input-sm" runat="server" Width="270px" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>

                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" OnClick="btnSaveChange_Click" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="JobITGV" />
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>

    <script type='text/javascript'>
        function openModal() {
            $('#myModal').modal('show');
        }

    </script>

</asp:Content>
