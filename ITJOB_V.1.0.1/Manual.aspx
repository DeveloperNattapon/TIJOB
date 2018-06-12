<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Manual.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.Manual" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


                    <div class="centerM">
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <div class="form-group">
                                <label>อัพโหลดไฟล์</label>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbltitle" runat="server" Visible="False">หัวข้อเอกสาร</asp:Label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Visible="False"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <div class="form-group">

                                <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" Visible="False" />
                            </div>
                        </div>
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <div class="form-group text-right">
                                <asp:Button ID="btnUp" runat="server" value="Upload" Text="Upload" Visible="False" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                    <div class="text-right">
                        <asp:Button ID="btnDownload" runat="server" Text="Download" CssClass="btn btn-success" OnClick="DownloadFiles" />
                        <asp:Label ID="lblText" runat="server" Visible="False"></asp:Label>
                    </div>



                    <fieldset>
                        <legend>Manual IT
                        </legend>
                    </fieldset>
                    <asp:GridView ID="FileGV" runat="server" AutoGenerateColumns="False" Width="750px" ForeColor="Black" HorizontalAlign="Center" Font-Size="Small" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                        <AlternatingRowStyle CssClass="altrowstyle" BackColor="#CCCCCC" />
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle CssClass="headerstyle" BackColor="Black" Font-Bold="True" ForeColor="White" Height="30px" />
                        <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="First " LastPageText=" Last" NextPageText="Next " PreviousPageText=" Previous " />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Height="20px" />
                        <RowStyle CssClass="rowstyle" HorizontalAlign="Center" Height="20px" />
                        <Columns>
                            <asp:TemplateField HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSelect" runat="server" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ลำดับ" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblfileID" runat="server" Text='<%# Eval("FileID")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ชื่อไฟล์" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblfilename" runat="server" Text='<%# Eval("Filename")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="หัวข้อเอกสาร" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lbltitle1" runat="server" Text='<%# Bind("Title")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="270px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="วันที่สร้างเอกสาร" HeaderStyle-CssClass="text-center">
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%# Bind("CreateDate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle Width="130px" />
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
        </div>
    </form>
</asp:Content>
