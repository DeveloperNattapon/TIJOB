<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="IT_Recording.aspx.vb" Inherits="ITJOB_V._1._0._1.IT_Recording" MasterPageFile="~/home.Master" %>

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

                                <div class="form-group">
                                        <label>วันที่</label>

                                        <asp:TextBox CssClass="form-control" ID="txtDateIt_R" runat="server" placeholder="MM/DD/YYYY">
                                        </asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="txtDateIt_R" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>
                               <div class="bootstrap-timepicker">
                                <div class="form-group">
                                    <label>เวลา</label>

                                    <div class="input-group">
                                        <input id="txtTimeIt_R" runat="server" type="text" class="form-control timepicker">
                                        <div class="input-group-addon">
                                            <i class="fa fa-clock-o"></i>
                                    
                                        </div>
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.form group -->
                            </div>
                               
                                    
                                  <div class="form-group">
                                        <label>ตรวจพบปัญหา</label>
                                        <asp:TextBox CssClass="form-control" ID="txtProblems" runat="server"> </asp:TextBox>

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
                                        <label>เหตุผล</label>
                                        <asp:TextBox CssClass="form-control" ID="txtReason" runat="server"> </asp:TextBox>

                                    </div>
                                </div>
                            </div>
                            <p>AMคือเวลาตั้งแต่00.01-11.59  PMคือเวลาตั้งแต่12.01-23.59</p>
                           
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave_ItR" CssClass="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_ItR_Click" />
                            <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
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
                    <asp:UpdatePanel ID="UpModal" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="itRecordingGV" runat="server" AutoGenerateColumns="False" DataKeyNames="recordingID" Width="890px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White"
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                <AlternatingRowStyle CssClass="altrowstyle" BackColor="#CCCCCC" />
                                <FooterStyle BackColor="#CCCCCC" />
                                <HeaderStyle CssClass="headerstyle" BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Height="20px" />
                                <RowStyle CssClass="rowstyle" HorizontalAlign="Center" Height="20px" />
                                <Columns>
                                    <asp:TemplateField HeaderText="ลำดับ" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblrecordingID" runat="server" Text='<%# Bind("recordingID")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <ItemStyle Width="90px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="วันที่" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRecordingDate" runat="server" Text='<%# Bind("recordingDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="เวลา" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRecording_Time" runat="server" Text='<%# Bind("recording_Time")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="สาขา" HeaderStyle-CssClass="text-center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblProblems" runat="server" Text='<%# Bind("branch")%>'>-</asp:Label>
                                        </ItemTemplate>

                                        <HeaderStyle CssClass="text-center"></HeaderStyle>

                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ตรวจสอบพอปัญหา" HeaderStyle-CssClass="text-center">

                                        <ItemTemplate>
                                            <asp:Label ID="lblreason" runat="server" Text='<%# Bind("problems")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="text-center" />
                                        <ItemStyle Width="120px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="เหตุผล" HeaderStyle-CssClass="text-center">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranch" runat="server" Text='<%# Bind("reason")%>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                        <ItemStyle Width="100px" />
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

    </form>
    <script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker({
                pickDate: false
            });
        });
    </script>
    <script>
        $(function () {
        //Timepicker
    $('.timepicker').timepicker({
      showInputs: false
    })
        })
        </script>
 

</asp:Content>
