<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Preview.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.Preview" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" class="form-horizontal">


        <div class="container">
            <div class="rom">

                <div class="col-lg-12">
                    <div class="tile">
                        <div class="text-right">
                            <asp:Button ID="btnEdit" CssClass="btn btn-success btn-xs " runat="server" Text="Edit" Height="32px" Width="58px" />
                        </div>
                        <div id="dashed-lines"></div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>เอกสารเลขที่ :</label>

                                <asp:Label ID="lblDoc_ID" runat="server" Text='<%# Bind("ItJobDocID")%>'></asp:Label>

                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group text-right">
                                <label>วันที่สร้างเอกสาร :</label>
                                <asp:Label ID="lblCreatedate" runat="server" Text="-"></asp:Label>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>สถานะ :</label>
                                <asp:Label ID="lblstatus" runat="server" Style="color: #FF0000"></asp:Label>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="control-label">วันที่เปิดงาน :</label>

                                <asp:Label ID="lblupdate" runat="server" Text="-"></asp:Label>

                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="control-label">วันที่ปิดงาน :</label>

                                <asp:Label ID="lblClosedate" runat="server" Text="-"></asp:Label>

                            </div>
                        </div>
                        <div class="tab-content">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="col-lg-4">
                                        <label class="control-label">ผู้สั่งงาน :</label>
                                        <asp:Label ID="lblRequest" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label">IP ของผู้สั่งงาน :</label>
                                        <asp:Label ID="lblUserIP" runat="server" Text="-"></asp:Label>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label">เบอร์โทรติดต่อกลับ :</label>
                                        <asp:Label ID="lblUserTel" runat="server" Text="-"></asp:Label>
                                    </div>
                                    <div class="col-lg-4">

                                        <label class="control-label">แผนก :</label>
                                        <asp:Label ID="labDivision" runat="server" Text="-"></asp:Label>

                                    </div>

                                    <div class="col-lg-4">

                                        <label class="control-label">ผู้รับงาน :</label>
                                        <asp:Label ID="lblRecipient" runat="server" Text="-"></asp:Label>

                                    </div>

                                    <div class="col-lg-4">

                                        <label class="control-label">ผู้รับผิดชอบงาน :</label>
                                        <asp:Label ID="lblAssign" runat="server" Text="-"></asp:Label>


                                    </div>

                                    <div class="col-lg-4">

                                        <label class="control-label">ตำแหน่ง :</label>
                                        <asp:Label ID="lblPosition" runat="server" Text="-"></asp:Label>

                                    </div>

                                    <div class="col-lg-4">

                                        <label class="control-label">หัวข้องาน:</label>
                                        <asp:Label ID="lblCaseJob" runat="server" Text="-"></asp:Label>

                                    </div>

                                    <div class="col-lg-6">

                                        <label class="control-label">รายละเอียดงาน</label>
                                        <asp:Label ID="lblDetail" runat="server"></asp:Label>
                                    </div>

                                    <div class="col-lg-6">
                                        <label class="control-label">รายละเอียดการแก้ไขงาน</label>

                                        <asp:Label ID="lblRepair" runat="server"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</asp:Content>
