Option Strict On
Option Explicit On

Imports System
Imports System.Linq
Imports System.Data.SqlClient
Imports System.Data
Imports System.IO
Imports System.Web.UI.WebControls
Imports System.Globalization
Imports System.Transactions

Public Class addjob
    Inherits System.Web.UI.Page
    Dim RJITno As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack = True Then
            txtNameth.Text = Session("Name_thai").ToString
            showDivision()
            show_Division()
            showCaseJob()
        End If
    End Sub
    Sub RunNo()


        Using tran As New TransactionScope()

            Using db = New DB_EaglesInternalEntities

                Try
                    db.Database.Connection.Open()


                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('error runnumber');", True)
                Finally
                    db.Database.Connection.Close()
                    db.Dispose()
                    tran.Dispose()
                End Try

            End Using
        End Using

    End Sub

    Sub Clear()
        txtuserIP.Text = ""
        txtuserTel.Text = ""
        ddltype.ClearSelection()
        dd_Division.ClearSelection()
        txtDetail.Text = ""

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        'Dim date1 As DateTime = Nothing
        'Dim date2 As DateTime = Nothing

        Dim Key As String
        Dim runno As Integer
        Key = "RJIT" + Mid(CStr(Now.Year), 3) + (CStr(Format(Now.Date, "MM")))

        Using tran As New TransactionScope()
            Using db = New DB_EaglesInternalEntities

                Try

                    db.Database.Connection.Open()

                    Dim ds = (From c In db.tblRunningNumbers
                              Where c.Name = Key
                               Select c).FirstOrDefault()


                    If ds IsNot Nothing Then
                        runno = CInt(ds.RunNo)
                    Else
                        db.tblRunningNumbers.Add(New tblRunningNumber() With { _
                                          .Name = Key, _
                                          .RunNo = CType("0", Integer?) _
                                      })
                        db.SaveChanges()
                    End If

                    runno = runno + 1
                    RJITno = "RJIT-" + Mid(CStr(Now.Year), 3) + (CStr(Format(Now.Date, "MM"))) + CStr(runno).PadLeft(3, CChar("0"))

                    Dim update = (From c In db.tblRunningNumbers Where c.Name.Contains(Key)
                                  Select c).FirstOrDefault()
                    If update IsNot Nothing Then
                        update.RunNo = runno
                    End If

                    db.SaveChanges()

                    db.tblItJobDocs.Add(New tblItJobDoc() With { _
                     .ItJobDocID = RJITno, _
                     .RequestFrom = txtNameth.Text.Trim, _
                     .UserIP = txtuserIP.Text.Trim, _
                     .UserTel = txtUserTel.Text.Trim, _
                     .CaseJobID = ddltype.Text.Trim, _
                     .DivisionName = dd_Division.Text.Trim, _
                     .JobDetail = txtDetail.Text.Trim, _
                     .RecipientJob = "ยังไม่มีผู้รับงาน", _
                     .AssignJobTo = "ยังไม่ได้กำหนด", _
                     .JobStatus = "createjob.png", _
                     .CreateBy = Session("UserID").ToString, _
                     .CreateDate = Now _
                })

                    db.SaveChanges()

                    tran.Complete()

                    ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('สร้างเอกสาร เรียบร้อยแล้วค่ะ ')", True)
                    Clear()
                Catch ex As Exception
                    ScriptManager.RegisterStartupScript(Me, Me.GetType(), "redirect", "alert('สร้างเอกสารไม่สำเร็จ กรุณาตรวจสอบข้อมูลอีกครั้ง');", True)
                Finally
                    db.Database.Connection.Close()
                    db.Dispose()
                    tran.Dispose()
                End Try

            End Using
        End Using

    End Sub

    Protected Sub Unnamed1_Click(sender As Object, e As EventArgs)
        Clear()
    End Sub

    Private Sub showDivision()
        dd_Division.Items.Clear()
        dd_Division.Items.Add(New ListItem("Select Division", ""))
        dd_Division.AppendDataBoundItems = True

        Using db As New DB_EaglesInternalEntities
            Dim din = From di In db.tblDivisions
                      Select di.DivisionId, di.DivisionName
            Try
                dd_Division.DataSource = din.ToList
                dd_Division.DataTextField = "DivisionName"
                dd_Division.DataValueField = "DivisionId"
                dd_Division.DataBind()
                If dd_Division.Items.Count > 1 Then
                    dd_Division.Enabled = True
                Else
                    dd_Division.Enabled = False
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Using

    End Sub
    Private Sub show_Division()
        ddDivision.Items.Clear()
        ddDivision.Items.Add(New ListItem("Select Division", ""))
        ddDivision.AppendDataBoundItems = True

        Using db As New DB_EaglesInternalEntities
            Dim din = From di In db.tblDivisions
                      Select di.DivisionId, di.DivisionName
            Try
                ddDivision.DataSource = din.ToList
                ddDivision.DataTextField = "DivisionName"
                ddDivision.DataValueField = "DivisionId"
                ddDivision.DataBind()
                If ddDivision.Items.Count > 1 Then
                    ddDivision.Enabled = True
                Else
                    ddDivision.Enabled = False
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Using

    End Sub

    Private Sub showCaseJob()
        ddltype.Items.Clear()
        ddltype.Items.Add(New ListItem("Select CaseJob", ""))
        ddltype.AppendDataBoundItems = True

        Using db As New DB_EaglesInternalEntities
            Dim din = From di In db.tblCaseJobs
                      Select di.CaseJobID, di.CaseName
            Try
                ddltype.DataSource = din.ToList
                ddltype.DataTextField = "CaseName"
                ddltype.DataValueField = "CaseJobID"
                ddltype.DataBind()
                If ddltype.Items.Count > 1 Then
                    ddltype.Enabled = True
                Else
                    ddltype.Enabled = False
                End If
            Catch ex As Exception
                Throw ex
            End Try
        End Using

    End Sub
End Class