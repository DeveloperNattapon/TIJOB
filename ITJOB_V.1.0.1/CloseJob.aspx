<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CloseJob.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.CloseJob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" class="form-horizontal">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

    <div class="container">
            <div class="rom">

                <div class="col-lg-12">
                    <div class="tile">
                        <div class="text-right">
                            <asp:Button ID="btnClose" CssClass="btn btn-success icon-btn" runat="server" Text="Close Job" />
                        </div>
                        <div id="dashed-lines"></div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>เอกสารเลขที่ :</label>

                                <asp:Label ID="lblDocID" runat="server" Text='<%# Bind("ItJobDocID")%>'></asp:Label>

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

                                    <div class="col-lg-4">

                                        <label class="control-label">รายละเอียดเพิ่มเติมจากผู้รับงาน</label>
                                        <asp:Label ID="lblComment" runat="server"></asp:Label>
                                    </div>
                                  
        
                                    <div class="col-lg-6">
                                        <label class="control-label">รายละเอียดการแก้ไขงาน</label>

                                        <asp:Label ID="lblpair" runat="server"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">CloseJob</h3>
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
                                            <label class="col-sm-3 control-label " for="lblDetail">รายละเอียดการแก้ไขงาน</label>
                                            <div class="col-sm-3 ">
                                                <asp:TextBox ID="txtRepairDetail" CssClass="input-sm" runat="server" Width="270px" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                            </div>                  
                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="CloseJob" OnClick="btnSaveChange_Click" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnClose" />
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
        //Sys.Application.add_load(function () {
        //    $('#myModal').modal('show');
        //});
    </script>
</asp:Content>