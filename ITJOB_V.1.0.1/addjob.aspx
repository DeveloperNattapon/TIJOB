<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="addjob.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.addjob" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" class="form-horizontal">

        <div class="container">
            <div class="row">
                <div class="text-center">
                     <img alt="" class="img-rounded" src="Images/headaj.jpg" />
                </div> 
                <div class="centerDiv">
                    <div class="col-lg-12">
                        
                        <fieldset>
                            <div class="form-group">
                                  <h2>Create Job</h2>
                            </div>
                          
                            <div class="tab-content">
                                <div class="row">
                                    <div class="col-lg-12">

                                        <div class="form-group">
                                            <label>ผู้สั่งงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtNameth" runat="server"> </asp:TextBox>
                                            <label for="" style="color: #FF0000">*สามารถลบออกและคีย์ใหม่ได้</label>
                                        </div>

                                        <div class="form-group">
                                            <label>IP ของผู้สั่งงาน</label>
                                            <asp:TextBox CssClass="form-control" ID="txtuserIP" runat="server"> </asp:TextBox>

                                        </div>

                                        <div class="form-group">
                                            <label>เบอร์โทรติดต่อกลับ</label>
                                            <asp:TextBox CssClass="form-control" ID="txtUserTel" runat="server"> </asp:TextBox>

                                        </div>

                                        <div class="form-group">
                                            <label>สาขา</label>
                                            <asp:DropDownList ID="ddDivision" runat="server" CssClass="form-control" DataTextField = "DivisionName" DataValueField = "DivisionId" AppendDataBoundItems="true">
                                               
                                            </asp:DropDownList>
                                          </div>

                                        <div class="form-group">
                                            <label>ประเภทงาน</label>

                                            <asp:DropDownList ID="ddltype" runat="server" CssClass="form-control" DataTextField = "CaseName" DataValueField = "CaseJobID" AppendDataBoundItems="true">

                                            </asp:DropDownList>
                                            <!--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=E01-NB-024\SQLEXPRESS;Initial Catalog=DB_EaglesInternal;User ID=sa;Password=7tFCca6pzt;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [tblCaseJob]"></asp:SqlDataSource>-->
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleSelect1">แผนก</label>
                                            <asp:DropDownList ID="dd_Division" runat="server" CssClass="form-control"  DataTextField = "DivisionName" DataValueField = "DivisionId" AppendDataBoundItems="true">
                                                
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
                                <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server" Text="Save" />
                                <asp:Button CSSClass="btn" data-dismiss="modal" runat="server" aria-hidden="true" Text="close" OnClick="Unnamed1_Click" />
                            </div>

                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </form>

</asp:Content>