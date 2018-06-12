<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="showRecordProduct.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.showRecordProduct" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container">
            <div class="row">
                <div class="centerDiv2">
                    <div class="centertop">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <div class="col-lg-6">
                                    <input runat="server" type="text" class="form-control" id="txtSearch" placeholder="Search.." name="search">
                                </div>
                                <div class="col-lg-2">
                                    <button type="button" class="btn btn-info" id="btnSearh" runat="server" onserverclick="btnSearh_click">
                                        <span class="glyphicon glyphicon-search"></span>Search
                                    </button>
                                </div>
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
        <div class="col-lg-12">
            <div class="form-group text-right">

                <button runat="server" id="btnAddPR" class="btn btn-success icon-btn" title="btnAddPR" onserverclick="btnAddPR_Click"><i class="fa fa-plus"></i>Create RP</button>

            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <asp:GridView ID="gvShowRP" runat="server" AutoGenerateColumns="False" DataKeyNames="AccessNo" Width="890px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                        <AlternatingRowStyle CssClass="altrowstyle" BackColor="#CCCCCC" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle CssClass="headerstyle" BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Height="20px" />
                        <RowStyle CssClass="rowstyle" HorizontalAlign="Center" Height="20px" />

                        <Columns>
                            <asp:TemplateField HeaderText="หมายเลขทรัพย์สิน" HeaderStyle-CssClass="text-center">

                                <ItemTemplate>
                                    <asp:Label ID="lblAccessNo" runat="server" Text='<%# Bind("AccessNo") %>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>

                                <ItemStyle Width="90px" />

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ชื่อทรัพย์สิน" HeaderStyle-CssClass="text-center">

                                <ItemTemplate>
                                    <asp:Label ID="lblAccessName" runat="server" Text='<%# Bind("AccessName")%>'></asp:Label>

                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>

                                <ItemStyle Width="120px" />

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันที่บันทึก" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblRecordDate" runat="server" Text='<%# Bind("RecordDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>

                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ประเภททรัพย์สิน" HeaderStyle-CssClass="text-center">

                                <ItemTemplate>
                                    <asp:Label ID="lblTypeofAccess" runat="server" Text='<%# Bind("TypeofAccess")%>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>

                                <ItemStyle Width="90px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="เลขที่สั่งซื้อ" HeaderStyle-CssClass="text-center">

                                <ItemTemplate>
                                    <asp:Label ID="lblOrderNo" runat="server" Text='<%# Bind("OrderNo")%>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>

                                <ItemStyle Width="180px" />

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="วันที่สั่งซื้อ" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblOrderDate" runat="server" Text='<%# Bind("OrderDate","{0:dd/MM/yyyy}")%>'></asp:Label>
                                </ItemTemplate>

                                <HeaderStyle CssClass="text-center"></HeaderStyle>
                                <ItemStyle Height="40px" Width="50px" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="แก้ไข" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="False" CommandName="EditAccess" Text="Edit" CommandArgument='<%# Eval("AccessNo")%>'></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" Width="50px" />

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

   <div id="myModal" class="modal hind fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3 id="myModalLabel">Edit RecordProduct</h3>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="modal-body">
                                <fieldset>
                                     <div class="col-lg-8">
                                        <div class="form-group">
                                            <label>หมายเลขทรัพย์สิน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtAccessNo" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>รหัสทรัพย์สิน Account</label>
                                            <asp:TextBox CssClass="form-control" ID="txtAccAccess" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ประเภททรัพย์สิน</label>
                                            <asp:DropDownList ID="dcbTypeofAccess" CssClass="form-control" runat="server">
                                                <asp:ListItem>-  -</asp:ListItem>
                                                <asp:ListItem>SPM</asp:ListItem>
                                                <asp:ListItem>PTN</asp:ListItem>
                                                <asp:ListItem>LKB</asp:ListItem>
                                                <asp:ListItem>SBIA</asp:ListItem>
                                                <asp:ListItem>CKT</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>ชื่อทรัพย์สิน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtAccessName" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>วันที่บันทึก</label>
                                            <asp:TextBox CssClass="form-control" ID="dtpRecordDate" placeholder="MM/DD/YYYY" runat="server"> 

                                            </asp:TextBox><asp:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" TargetControlID="dtpRecordDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>วันที่สั่งซื้อ</label>
                                            <asp:TextBox CssClass="form-control" ID="dtpOrderDate" runat="server" placeholder="MM/DD/YYYY"> 

                                            </asp:TextBox><asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="dtpOrderDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>มูลค่าทรัพย์สิน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtValueOfAccess" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>จำนวนที่ประกัน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtWarrantyValue" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>เลขที่สั่งซื้อ</label>
                                            <asp:TextBox CssClass="form-control" ID="txtOrderNo" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>สถานที่รับประกัน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtPlaceOfWarranty" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>วันเริ่มประกัน</label>
                                            <asp:TextBox CssClass="form-control" ID="dtpStartWarranty" runat="server" placeholder="MM/DD/YYYY"> 

                                            </asp:TextBox><asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" TargetControlID="dtpStartWarranty" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>วันหมดประกัน</label>
                                            <asp:TextBox CssClass="form-control" ID="dtpEndWarranty" runat="server" placeholder="MM/DD/YYYY">

                                            </asp:TextBox><asp:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" TargetControlID="dtpEndWarranty" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>รหัสผู้ขาย</label>
                                            <asp:TextBox CssClass="form-control" ID="txtSupplierCode" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>ชื่อผู้ขาย</label>
                                            <asp:TextBox CssClass="form-control" ID="txtSupplierName" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>สาขา</label>
                                            <asp:DropDownList ID="dcbBranch" CssClass="form-control" runat="server">
                                                <asp:ListItem> </asp:ListItem>
                                                <asp:ListItem>SPM</asp:ListItem>
                                                <asp:ListItem>PTN</asp:ListItem>
                                                <asp:ListItem>LKB</asp:ListItem>
                                                <asp:ListItem>SBIA</asp:ListItem>
                                                <asp:ListItem>CKT</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>แผนก</label>
                                            <asp:DropDownList ID="cboDepartment" CssClass="form-control" runat="server">
                                                <asp:ListItem> </asp:ListItem>
                                                <asp:ListItem>SPM</asp:ListItem>
                                                <asp:ListItem>PTN</asp:ListItem>
                                                <asp:ListItem>LKB</asp:ListItem>
                                                <asp:ListItem>SBIA</asp:ListItem>
                                                <asp:ListItem>CKT</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>วันที่รับของ</label>
                                            <asp:TextBox CssClass="form-control" ID="dtpReceive" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtender5" runat="server" Enabled="True" TargetControlID="dtpReceive" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                        </div>
                                    </div>

                                    <div class="col-lg-8">
                                        <div class="form-group">
                                            <label>หมายเหตุ</label>
                                            <asp:TextBox ID="txtRemark" CssClass="input-sm form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>S/N</label>
                                            <asp:TextBox CssClass="form-control" ID="txtSN" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>ผู้ครอบครอง</label>
                                            <asp:TextBox CssClass="form-control" ID="txtOwner" runat="server"> </asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label>หน่วยที่ประกัน</label>
                                            <asp:DropDownList ID="dcbWarrantyUnit" CssClass="form-control" runat="server">
                                                <asp:ListItem> </asp:ListItem>
                                                <asp:ListItem>SPM</asp:ListItem>
                                                <asp:ListItem>PTN</asp:ListItem>
                                                <asp:ListItem>LKB</asp:ListItem>
                                                <asp:ListItem>SBIA</asp:ListItem>
                                                <asp:ListItem>CKT</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="modal-footer">
                               <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <asp:Button ID="btnSaveChange" CssClass="btn btn-primary" runat="server" Text="Save Changes" />
                            </div>
                        </ContentTemplate>
                        <Triggers>
                           <asp:AsyncPostBackTrigger ControlID="gvShowRP" />
                            <asp:AsyncPostBackTrigger ControlID="btnSaveChange" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <script type='text/javascript'>
            function openModal() {
                $('#myModal').modal('show');
            }

        </script>
        <!--<script type="text/javascript">
            $(document).ready(function () {
                $('#myBtn').click(function ()
                {
                    $('#myModal').modal();
                })
            })
        </script>-->
    </form>
   </asp:Content>

