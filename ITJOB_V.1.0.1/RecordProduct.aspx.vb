Option Explicit On
Option Strict On

Imports System.Transactions
Imports System.Globalization

Public Class RecordProduct
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack = True Then
            showDropDownListTypeAccess()
            showDropDownListTypeDevice()
            showDropDownListUnitWarranty()
            showDropDownListBranch()
            showDropDownListDepartment()
        End If
    End Sub
    Private Sub addRecordProduct()

        Using tran As New TransactionScope()
            Using db = New DB_EaglesInternalEntities

                If String.IsNullOrEmpty(txtAccessNo.Text) Then

                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('กรุณาระบุ หมายเลขทรัพย์สิน !')", True)

                ElseIf String.IsNullOrEmpty(txtNameOfDevice.Text) Then

                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('กรุณาระบุ ชื่ออุปกรณ์ !')", True)

                Else

                    Try


                        db.Database.Connection.Open()

                        db.tblAccessLists.Add(New tblAccessList With { _
                                .AccessNo = txtAccessNo.Text.Trim, _
                                .AccessAccount = txtAccAccess.Text.Trim, _
                                .RecordDate = Now, _
                                .TypeofAccess = dcbTypeofAccess.Text.Trim, _
                                .AccessName = txtAccessName.Text.Trim, _
                                .OrderNo = txtOrderNo.Text.Trim, _
                                .OrderDate = DateTime.ParseExact(dtpOrderDate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                                .ValueOfAccess = CType(CDbl(txtValueOfAccess.Text).ToString("#,##0.####"), Double?), _
                                .WarrantyValue = txtWarrantyValue.Text.Trim, _
                                .WarrantyUnit = dcbWarrantyUnit.Text.Trim, _
                                .StartWarranty = DateTime.ParseExact(dtpStartWarranty.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                                .EndWarranty = DateTime.ParseExact(dtpEndWarranty.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                                .PlaceOfWarranty = txtPlaceOfWarranty.Text.Trim, _
                                .SupplierCode = txtSupplierCode.Text.Trim, _
                                .SupplierName = txtSupplierName.Text.Trim, _
                                .Remark = txtRemark.Text.Trim, _
                                .CreateBy = Session("UserID").ToString, _
                                .ModifyDate = Now, _
                                .CreateDate = Now, _
                                .SN = txtSN.Text.Trim, _
                                .Branch = dcbBranch.Text, _
                                .Department = cboDepartment.Text, _
                                .Owner = txtOwner.Text.Trim, _
                                .ReceiveDate = DateTime.ParseExact(dtpReceive.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")) _
                        })


                        db.tblAccessListDetails.Add(New tblAccessListDetail With { _
                                     .AccessNo = txtAccessNo.Text.Trim, _
                                     .ItemNo = TlblNum.Text.Trim, _
                                     .TypeOfDevice = dcbTypeOfDevice.Text.Trim, _
                                     .NameOfDevice = txtNameOfDevice.Text.Trim, _
                                     .Price = CInt(txtPrice.Text.Trim), _
                                     .OrderNo = txtOrderNo1.Text.Trim, _
                                     .WarrantyValue = CInt(txtWarrantyValue1.Text.Trim), _
                                     .WarrantyUnit = dcbWarrantyUnit1.Text.Trim, _
                                     .StartWarranty = DateTime.ParseExact(dtpStartWarranty1.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                                     .EndWarranty = DateTime.ParseExact(dtpEndWarranty1.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US")), _
                                     .PlaceOfWarranty = txtPlaceOfWarranty1.Text.Trim, _
                                     .SupplierCode = txtSupplierCode1.Text.Trim, _
                                     .SupplierName = txtSupplierName1.Text.Trim, _
                                     .CreateDate = Now, _
                                     .CreateBy = Session("UserID").ToString _
                                       })

                        db.SaveChanges()
                        tran.Complete()
                        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "alertMessage", "alert('บันทึกสำเร็จ !');", True)
                        clear()
                    Catch ex As Exception

                        ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('เกิดข้อผิดพลาด กรุณาบันทึกข้อมูลใหม่อีกครั้ง');", True)

                    Finally

                        db.Database.Connection.Close()
                        db.Dispose()
                        tran.Dispose()

                    End Try

                End If

            End Using
        End Using

    End Sub

    Protected Sub btnSave_RP_Click(sender As Object, e As EventArgs) Handles btnSave_RP.Click

        addRecordProduct()

    End Sub

    Sub clear()
        txtAccessNo.Text = ""
        txtAccessName.Text = ""
        dcbTypeofAccess.ClearSelection()
        txtOrderNo.Text = " "
        txtValueOfAccess.Text = " "
        txtWarrantyValue.Text = " "
        dcbWarrantyUnit.ClearSelection()
        dtpStartWarranty.Text = " "
        dtpEndWarranty.Text = " "
        txtPlaceOfWarranty.Text = " "
        txtSupplierCode.Text = " "
        txtSupplierName.Text = " "
        txtRemark.Text = " "
        txtSN.Text = " "
        dcbBranch.ClearSelection()
        cboDepartment.Text = " "
        txtOwner.Text = " "
        txtAccAccess.Text = " "
        dtpReceive.Text = " "
        txtAccessNo.Text = " "
        TlblNum.Text = " "
        dcbTypeOfDevice.ClearSelection()
        txtNameOfDevice.Text = " "
        txtPrice.Text = " "
        txtOrderNo1.Text = " "
        txtWarrantyValue1.Text = " "
        dcbWarrantyUnit1.ClearSelection()
        dtpStartWarranty1.Text = " "
        dtpEndWarranty1.Text = " "
        txtPlaceOfWarranty1.Text = " "
        txtSupplierCode1.Text = " "
        txtSupplierName1.Text = " "

    End Sub
    Private Sub showDropDownListTypeAccess()
        Using db As New ITmanagementEntities
            Dim tpye = From p In db.tblMasterCodes
                       Group p By p.Type Into g = Group, Count()
                      Where g.Count() > 1
                      Select Type
            Dim tpye1 = From p In db.tblMasterCodes Where p.Type = "AccessType"
            Select p.Code
            dcbTypeofAccess.DataSource = tpye.ToList
            dcbTypeofAccess.DataBind()
        End Using
    End Sub

    Private Sub showDropDownListTypeDevice()
        Using db As New ITmanagementEntities

            Dim tpye = From p In db.tblMasterCodes Where p.Type = "AccessType"
            Select p.Code
            dcbTypeOfDevice.DataSource = tpye.ToList
            dcbTypeOfDevice.DataBind()
        End Using
    End Sub

    Private Sub showDropDownListUnitWarranty()
        Using db As New ITmanagementEntities
            Dim tpye = From p In db.tblMasterCodes
                       Group p By p.Type Into g = Group, Count()
                      Where g.Count() > 1
                      Select Type
            Dim tpye1 = From p In db.tblMasterCodes Where p.Type = "UnitWarranty"
            Select p.Code
            dcbWarrantyUnit.DataSource = tpye.ToList
            dcbWarrantyUnit.DataBind()

            dcbWarrantyUnit1.DataSource = tpye.ToList
            dcbWarrantyUnit1.DataBind()
        End Using
    End Sub

    Private Sub showDropDownListDepartment()
        Using db As New ITmanagementEntities

            Dim tpye = From p In db.tblDepartments Where p.Status = 1
            Select p.Department
            cboDepartment.DataSource = tpye.ToList.Distinct
            cboDepartment.DataBind()

            'Dim tp = (From p In db.tblDepartments Where p.Status = 1
            '    Select dcbTypeOfDevice.Text = p.Department).Distinct()

        End Using
    End Sub

    Private Sub showDropDownListBranch()
        Using db As New ITmanagementEntities()

            Dim tpye = From p In db.tblMasterCodes Where p.Type = "BRANCH" And p.Note = "1"
             Select p.Code
            dcbBranch.DataSource = tpye.ToList
            dcbBranch.DataBind()
        End Using
    End Sub
End Class