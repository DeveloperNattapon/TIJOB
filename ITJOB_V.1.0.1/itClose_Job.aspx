<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="itClose_Job.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.itClose_Job" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="centerDiv">
                    <div class="col-lg-12">
                        <div class="tab-content">
                            <div class="row">
                                <div class="col-lg-12">

                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ผู้สั่งงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtRequest" runat="server"> </asp:TextBox>
                                        </div>

                                        <div class="form-group">
                                            <label>IP ของผู้สั่งงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtUserIP" runat="server"> </asp:TextBox>

                                        </div>

                                        <div class="form-group">
                                            <label>เบอร์โทรติดต่อกลับ</label>
                                            <asp:TextBox CssClass="form-control" ID="txtUserTel" runat="server"> </asp:TextBox>

                                        </div>

                                        <div class="form-group">
                                            <label>สาขา</label>
                                            <asp:DropDownList ID="txtBranch" CssClass="form-control" runat="server">

                                                <asp:ListItem>SPM</asp:ListItem>
                                                <asp:ListItem>PTN</asp:ListItem>
                                                <asp:ListItem>LKB</asp:ListItem>
                                                <asp:ListItem>SBIA</asp:ListItem>
                                                <asp:ListItem>CKT</asp:ListItem>

                                            </asp:DropDownList>

                                        </div>

                                        <div class="form-group">
                                            <label>หัวข้องาน</label>
                                       
                                               <asp:DropDownList ID="dlCaseJob" runat="server" CssClass="form-control"  AppendDataBoundItems="true">

                                                <asp:ListItem> </asp:ListItem>

                                            </asp:DropDownList>
                                            <!--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=E01-NB-024\SQLEXPRESS;Initial Catalog=DB_EaglesInternal;User ID=sa;Password=7tFCca6pzt;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblCaseJob]"></asp:SqlDataSource>-->
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleSelect1">แผนก</label>
                                            <asp:DropDownList ID="txtDivision" runat="server" CssClass="form-control">
                                                <asp:ListItem> </asp:ListItem>
                                                <asp:ListItem>การบัญชี</asp:ListItem>
                                                <asp:ListItem>ทรัพยากรบุคคล</asp:ListItem>
                                                <asp:ListItem>เทคโนโลยีสารสนเทศ</asp:ListItem>
                                                <asp:ListItem>การขาย</asp:ListItem>

                                            </asp:DropDownList>

                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">รายละเอียดงาน</label>
                                            <div>
                                                <asp:TextBox ID="txtDetail" CssClass="input-sm form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <!------ ส่วนที่สอง --------->
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ผู้รับงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtRecipient" runat="server"> </asp:TextBox>
                                        </div>

                                        <div class="form-group">
                                            <label>ผู้รับผิดชอบงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtAssign" runat="server"> </asp:TextBox>

                                        </div>

                                        <div class="form-group">
                                            <label>วันที่รับงาน</label>

                                            <asp:TextBox CssClass="form-control" ID="dtpCreatedate" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtender" runat="server" Enabled="True" TargetControlID="dtpCreatedate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>


                                        <div class="form-group">
                                            <label>วันที่ปิดงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="dtpClosedate" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="dtpClosedate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleSelect1">ตำแหน่ง</label>
                                            <asp:DropDownList ID="ddlPosition" runat="server" CssClass="form-control">
                                                <asp:ListItem>Programmer</asp:ListItem>
                                                <asp:ListItem>ITSupport</asp:ListItem>
                                                <asp:ListItem>GraphicDesign</asp:ListItem>

                                            </asp:DropDownList>

                                        </div>
                                        <div class="form-group">
                                            <label class="control-label">รายละเอียดการแก้ไขงาน</label>
                                            <div>
                                                <asp:TextBox ID="txtRepair" CssClass="input-sm form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave_close" CssClass="btn btn-primary" runat="server" Text="Save" />
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>

