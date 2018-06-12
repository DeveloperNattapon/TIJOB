<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RecordProduct.aspx.vb" MasterPageFile="~/home.Master" Inherits="ITJOB_V._1._0._1.RecordProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">

         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="centerDiv1">

                <div class="row">
                    <fieldset>
                        <legend>Personalia</legend>
                        <div class="col-lg-12">
                            <div class="col-lg-8">
                                <div class="form-group">
                                    <label>หมายเลขทรัพย์สิน</label>
                                   
                                    <asp:TextBox CssClass="form-control" ID="txtAccessNo" runat="server"> </asp:TextBox>
                                    <label for="" style="color: #FF0000">*จำเป็นต้องมี</label>
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
                                    <label>วันที่สั่งซื้อ</label>
                                    <asp:TextBox CssClass="form-control" ID="dtpOrderDate" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" TargetControlID="dtpOrderDate" Format="dd/MM/yyyy"></asp:CalendarExtender>
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
                                    <asp:TextBox CssClass="form-control" ID="dtpStartWarranty" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" TargetControlID="dtpStartWarranty" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>วันหมดประกัน</label>

                                    <asp:TextBox CssClass="form-control" ID="dtpEndWarranty" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" Enabled="True" TargetControlID="dtpEndWarranty" Format="dd/MM/yyyy"></asp:CalendarExtender>
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
                                       
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="form-group">
                                    <label>แผนก</label>
                                    <asp:DropDownList ID="cboDepartment" CssClass="form-control" runat="server">
                                       
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
                                        
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="centerDiv1">
                <div class="row">
                    <div class="col-lg-12">
                        <fieldset>
                        <legend>Personalia</legend>
                        <div class="form-group">
                            <label>ลายละเอียด</label>
                            <textarea class="form-control" rows="5" cols="60">

                                 </textarea>
                        </div>


                        <div class="col-lg-2">
                            <div class="form-group">
                                <label>ลำดับที่</label>
                                <asp:TextBox CssClass="form-control" ID="TlblNum" runat="server"> </asp:TextBox>
                                <!--<label id="lblNum"></label>-->

                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>ชื่ออุปกรณ์</label>
                                <asp:TextBox CssClass="form-control" ID="txtNameOfDevice" runat="server"> </asp:TextBox>
                                <label for="" style="color: #FF0000">*จำเป็นต้องมี</label>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>ประเภทของอุปกรณ์</label>
                                <asp:DropDownList ID="dcbTypeOfDevice" CssClass="form-control" runat="server">
                              
                                  
                                </asp:DropDownList>
                                <label for="" style="color: #FF0000">*จำเป็นต้องมี</label>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>ราคา</label>
                                <asp:TextBox CssClass="form-control" ID="txtPrice" runat="server"> </asp:TextBox>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>เลขที่สั่งซื้อ</label>
                                <asp:TextBox CssClass="form-control" ID="txtOrderNo1" runat="server"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>จำนวนที่รับประกัน</label>
                                <asp:TextBox CssClass="form-control" ID="txtWarrantyValue1" runat="server"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>หน่วยที่รับประกัน</label>
                                <asp:DropDownList ID="dcbWarrantyUnit1" CssClass="form-control" runat="server">
                                   
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>วันที่เริ่มรับประกัน</label>

                                <asp:TextBox CssClass="form-control" ID="dtpStartWarranty1" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender6" runat="server" Enabled="True" TargetControlID="dtpStartWarranty1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>วันที่หมดประกัน</label>

                                <asp:TextBox CssClass="form-control" ID="dtpEndWarranty1" runat="server" placeholder="MM/DD/YYYY"> </asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender7" runat="server" Enabled="True" TargetControlID="dtpEndWarranty1" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>สถานที่รับประกัน</label>
                                <asp:TextBox CssClass="form-control" ID="txtPlaceOfWarranty1" runat="server"> </asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>รหัสผู้ขาย</label>
                                <asp:TextBox CssClass="form-control" ID="txtSupplierCode1" runat="server"> </asp:TextBox>
                            </div>
                        </div>


                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>ชื่อผู้ขาย</label>
                                <asp:TextBox CssClass="form-control" ID="txtSupplierName1" runat="server"> </asp:TextBox>
                            </div>
                        </div>
                    </fieldset>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSave_RP" CssClass="btn btn-primary" runat="server" Text="Save" />
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                </div>
            </div>
        </div>
   
    </form>

</asp:Content>
