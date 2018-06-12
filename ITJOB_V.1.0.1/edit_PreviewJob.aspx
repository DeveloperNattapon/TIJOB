<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="edit_PreviewJob.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.edit_PreviewJob" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <div class="container">
            <div class="row">
                <div class="centerDiv">
                    <div class="col-lg-12">

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>เอกสารเลขที่</label>
                                <asp:Label ID="lblDocID" runat="server" Text='<%# Bind("ItJobDocID")%>'></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>วันที่สร้าง</label>
                                <asp:Label ID="labbuild" runat="server"></asp:Label>
                            </div>
                        </div>

                        <div class="tab-content">
                            <div class="row">
                                <div class="col-lg-12">


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
                                        <asp:TextBox CssClass="form-control" ID="txtCaseJob" runat="server"> </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleSelect1">แผนก</label>
                                        <asp:DropDownList ID="txtDivision" runat="server" CssClass="form-control">
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

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave_Preview" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Preview_Click" />
                            <button class="btn" data-dismiss="modal"  runat="server" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>

