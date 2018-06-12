Option Explicit On
Option Strict On

Public Class showRecordProduct
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        showListRP()
    End Sub
    Private Sub showListRP()

        Dim menu As String = "ITJOB"
        Using db = New DB_EaglesInternalEntities
          
                Dim userid = Session("UserID").ToString
            Dim men = From c In db.tblUserMenus Where c.UserID = userid And
                    c.Menu = menu And c.Edit_ = 1

                If men.Any Then


                Dim rp = From tb1 In db.tblAccessLists
                         Select tb1.AccessNo,
                                tb1.AccessName,
                                tb1.RecordDate,
                                tb1.TypeofAccess,
                                tb1.OrderNo,
                                tb1.OrderDate

                    'Dim itm = From tbml In dbConn.tblAccessLists
                    'Select tbml.AccessNo,
                    '   tbml.AccessName,
                    '   tbml.RecordDate,
                    '   tbml.TypeofAccess,
                    '   tbml.OrderNo,
                    '   tbml.OrderDate

                    'Dim result = itm.Union(rp).ToList()


                    If rp.Count > 0 Then
                        Me.gvShowRP.DataSource = rp.ToList()
                        Me.gvShowRP.DataBind()
                    Else
                        Me.gvShowRP.DataSource = Nothing
                        Me.gvShowRP.DataBind()
                    End If


                End If
        End Using
    End Sub

    Private Sub searchListRP(ByVal searc As String)

        Dim menu As String = "ITJOB"
        Dim dbConn = New ITmanagementEntities
        Using db = New DB_EaglesInternalEntities

            Dim userid = Session("UserID").ToString
            Dim men = From c In db.tblUserMenus Where c.UserID = userid And
                c.Menu = menu And c.Edit_ = 1

            If men.Any Then


                Dim rp = From tb1 In db.tblAccessLists Where tb1.AccessNo = searc And tb1.AccessName = searc
                     Select tb1.AccessNo,
                            tb1.AccessName,
                            tb1.RecordDate,
                            tb1.TypeofAccess,
                            tb1.OrderNo,
                            tb1.OrderDate

                Dim itm = From tbm In dbConn.tblAccessListDetails Join tbml In dbConn.tblAccessLists On
                tbm.AccessNo Equals tbml.AccessNo
                Select tbm.AccessNo,
                       tbml.AccessName,
                       tbml.RecordDate,
                       tbml.TypeofAccess,
                       tbml.OrderNo,
                       tbml.OrderDate

                Dim result = rp.Union(itm).ToList()

                If rp.Count > 0 Then
                    Me.gvShowRP.DataSource = result
                    Me.gvShowRP.DataBind()
                Else
                    Me.gvShowRP.DataSource = Nothing
                    Me.gvShowRP.DataBind()
                End If

            End If
        End Using

    End Sub

    Protected Sub btnAddPR_Click(sender As Object, e As EventArgs)

        Response.Redirect("RecordProduct.aspx")
    End Sub


    Protected Sub gvShowRP_RowDataBound(sender As Object, e As GridViewRowEventArgs)


    End Sub
    Protected Sub btnSearh_click(sender As Object, e As EventArgs)
        searchListRP(txtSearch.Value)
    End Sub

    Protected Sub gvShowRP_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvShowRP.RowCommand

        Dim index As String = CStr(e.CommandArgument)
        Dim LoginCls As New LoginCls

        Dim Key As String = LoginCls.EncryptPass
        Dim id As String = Session("UserID").ToString
        Dim menu As String = "ITJOB"

        If e.CommandName.Equals("EditAccess") Then

            Using db = New DB_EaglesInternalEntities
                Dim men = From c In db.tblUserMenus Where c.UserID = id And
                c.Menu = menu And c.Edit_ = 1

                If men.Any Then

                    Dim ds = (From c In db.tblAccessLists Where c.AccessNo = index).SingleOrDefault
                    txtAccessNo.Text = ds.AccessNo
                    txtAccAccess.Text = ds.AccessAccount
                    dcbTypeofAccess.Text = ds.TypeofAccess
                    txtAccessName.Text = ds.AccessName
                    txtOrderNo.Text = ds.OrderNo
                    dtpOrderDate.Text = Convert.ToDateTime(ds.OrderDate).ToString("dd/MM/yyyy")
                    txtValueOfAccess.Text = CStr(ds.ValueOfAccess)
                    txtWarrantyValue.Text = ds.WarrantyValue
                    dcbWarrantyUnit.Text = ds.WarrantyUnit
                    dtpStartWarranty.Text = Convert.ToDateTime(ds.StartWarranty).ToString("dd/MM/yyyy")
                    dtpEndWarranty.Text = Convert.ToDateTime(ds.EndWarranty).ToString("dd/MM/yyyy")
                    txtPlaceOfWarranty.Text = ds.PlaceOfWarranty
                    txtSupplierCode.Text = ds.SupplierCode
                    txtSupplierName.Text = ds.SupplierName
                    txtRemark.Text = ds.Remark
                    txtSN.Text = ds.SN
                    dcbBranch.Text = ds.Branch
                    cboDepartment.Text = ds.Department
                    txtOwner.Text = ds.Owner
                    dtpReceive.Text = Convert.ToDateTime(ds.ReceiveDate).ToString("dd/MM/yyyy")

                    'Dim ds1 = (From c In db.tblUser Where c.UserId = ds.CreateBy).SingleOrDefault

                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)

                Else

                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You do not have access')", True)

                End If

            End Using
        End If
    End Sub

    'Protected Sub lnkEdit_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim btnsubmit As LinkButton = TryCast(sender, LinkButton)
    '    Dim gRow As GridViewRow = DirectCast(btnsubmit.NamingContainer, GridViewRow)
    '    Dim index As String = CStr(gvShowRP.DataKeys(gRow.RowIndex).Value.ToString())
    '    Dim menu As String = "ITJOB"

    '    Using db = New DB_EaglesInternalEntities
    '        Dim men = From c In db.tblUserMenu Where c.UserID = ID And
    '        c.Menu = menu And c.Edit_ = 1

    '        If men.Any Then

    '            Dim ds = (From c In db.tblAccessList Where c.AccessNo = index).SingleOrDefault
    '            txtAccessNo.Text = ds.AccessNo
    '            txtAccAccess.Text = ds.AccessAccount
    '            dcbTypeofAccess.Text = ds.TypeofAccess
    '            txtAccessName.Text = ds.AccessName
    '            txtOrderNo.Text = ds.OrderNo
    '            dtpOrderDate.Text = Convert.ToDateTime(ds.OrderDate).ToString("dd/MM/yyyy")
    '            txtValueOfAccess.Text = CStr(ds.ValueOfAccess)
    '            txtWarrantyValue.Text = ds.WarrantyValue
    '            dcbWarrantyUnit.Text = ds.WarrantyUnit
    '            dtpStartWarranty.Text = Convert.ToDateTime(ds.StartWarranty).ToString("dd/MM/yyyy")
    '            dtpEndWarranty.Text = Convert.ToDateTime(ds.EndWarranty).ToString("dd/MM/yyyy")
    '            txtPlaceOfWarranty.Text = ds.PlaceOfWarranty
    '            txtSupplierCode.Text = ds.SupplierCode
    '            txtSupplierName.Text = ds.SupplierName
    '            txtRemark.Text = ds.Remark
    '            txtSN.Text = ds.SN
    '            dcbBranch.Text = ds.Branch
    '            cboDepartment.Text = ds.Department
    '            txtOwner.Text = ds.Owner
    '            dtpReceive.Text = Convert.ToDateTime(ds.ReceiveDate).ToString("dd/MM/yyyy")

    '            'Dim ds1 = (From c In db.tblUser Where c.UserId = ds.CreateBy).SingleOrDefault
    '        Else
    '            ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You do not have access')", True)

    '        End If


    '    End Using

    '    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)

    'End Sub

    Protected Sub gvShowRP_PageIndexChanged(sender As Object, e As EventArgs) Handles gvShowRP.PageIndexChanged

    End Sub

    Protected Sub gvShowRP_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles gvShowRP.PageIndexChanging
        gvShowRP.PageIndex = e.NewPageIndex
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)

    End Sub
End Class