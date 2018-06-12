<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MyJob.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.MyJob" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class=" form-horizontal" >
             <div class="form-group text-right">

                <button runat="server" id="btnAddClode" class="btn btn-success icon-btn" title="btnAddClode" onserverclick="btnAddClode_Click"><i class="fa fa-plus"></i> Create Job</button>

            </div>
             <fieldset>
            <legend >
                   <asp:Label id="lblaccess" class="control-label " runat="server" style="text-align: center">You do not have access * สำหรับ IT เท่านั้น</asp:Label>
                </legend>
           </fieldset>
            <br />
             <fieldset>
            <legend >
                <asp:Label id="lbltitle1" class="control-label " runat="server" style="text-align: center" Visible="False">เอกสารรอเปิดงาน</asp:Label>
                </legend>
                </fieldset>

            <br />
                         <div class="form-group col-md-12">
                        <asp:GridView ID="MyJobGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ItJobDocID" Width="950px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ผู้สั่งงาน" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRequest1" runat="server" Text='<%# Bind("RequestFrom")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="110px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ผู้รับงาน" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecipient" runat="server" Text='<%# Bind("Recipient")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="110px" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="วันที่สร้างเอกสาร" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreateDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="หัวข้องาน">
                                     <ItemTemplate>
                                        <asp:Label ID="lblCaseJob" runat="server" Text='<%# Bind("CaseJob")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="text-center"></HeaderStyle>
                                    <ItemStyle Width="160px" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="สถานะ">
                                     <ItemTemplate>
                                         <asp:Image ID="Image2" Height = "30" runat="server" ImageUrl = '<%# Bind("JobStatus")%>' />
                                          </ItemTemplate>
                                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                                    <ItemStyle Height="40px" Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="รับงาน" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                      <asp:LinkButton ID="LinkButton1" runat="server" Text="รับงาน" CommandArgument='<%# Eval("ItJobDocID")%>' OnClick="Edit_Click"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="50px"  />
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                            <br /><br />
          <fieldset><legend >
              <asp:Label id="lbltitle2" class="control-label " runat="server" style="text-align: center" Visible="False">เอกสารรอปิดงาน</asp:Label>
            </legend> </fieldset>
                             <br />
                             <asp:GridView ID="RepairGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ItJobDocID" Width="950px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
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
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ผู้สั่งงาน" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRequest1" runat="server" Text='<%# Bind("RequestFrom")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ผู้รับงาน" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecipient" runat="server" Text='<%# Bind("Recipient")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ผู้รับผิดชอบงาน" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAssign" runat="server" Text='<%# Bind("Assign")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="วันที่สร้างเอกสาร" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CreateDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="หัวข้องาน">
                                     <ItemTemplate>
                                        <asp:Label ID="lblCaseJob" runat="server" Text='<%# Bind("CaseJob")%>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="text-center"></HeaderStyle>
                                    <ItemStyle Width="160px" />
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="สถานะ">
                                     <ItemTemplate>
                                         <asp:Image ID="Image2" Height = "30" runat="server" ImageUrl = '<%# Bind("JobStatus")%>' />
                                          </ItemTemplate>
                                    <HeaderStyle CssClass="text-center"></HeaderStyle>

                                    <ItemStyle Height="40px" Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
            </div>
        </div>
    </form>
  
</asp:Content>