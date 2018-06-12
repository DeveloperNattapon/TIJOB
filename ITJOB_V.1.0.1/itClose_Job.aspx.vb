Option Explicit On
Option Strict On


Imports System.Transactions
Imports System.Globalization

Public Class itClose_Job
    Inherits System.Web.UI.Page


    Dim RJITno As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack = True Then
            txtRecipient.Text = Session("Name_thai").ToString
            txtAssign.Text = Session("Name_thai").ToString
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
    Private Sub seveItCloseJob()

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
                     .RequestFrom = txtRequest.Text.Trim, _
                     .UserIP = txtUserIP.Text.Trim, _
                     .UserTel = txtUserTel.Text.Trim, _
                     .CaseJobID = dlCaseJob.Text.Trim, _
                     .DivisionName = txtDivision.Text.Trim, _
                     .JobDetail = txtDetail.Text.Trim, _
                     .RecipientJob = Session("UserID").ToString, _
                     .AssignJobTo = Session("UserID").ToString, _
                     .JobStatus = "closejob.png", _
                     .CreateBy = Session("UserID").ToString, _
                     .CreateDate = Now, _
                     .Position = ddlPosition.Text.Trim, _
                     .Updateby = Session("userid").ToString, _
                     .UpdateDate = DateTime.ParseExact(dtpCreatedate.Text, "dd/MM/yyyy", CultureInfo.CreateSpecificCulture("en-US"))
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

    Protected Sub btnSave_close_Click(sender As Object, e As EventArgs) Handles btnSave_close.Click
        seveItCloseJob()
    End Sub
    Sub Clear()
        txtUserIP.Text = ""
        txtUserTel.Text = ""
        txtRequest.Text = ""
        dlCaseJob.Text = ""
        txtDivision.Text = ""
        txtDetail.Text = ""
        ddlPosition.Text = ""
        dtpCreatedate.Text = ""

    End Sub
End Class