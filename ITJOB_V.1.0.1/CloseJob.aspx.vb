Option Explicit On
Option Strict On

Imports System.Data
Imports System.Data.SqlClient
Public Class CloseJob
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Bindata()
    End Sub
    Sub Bindata()

        Dim JobID As String = Request.QueryString("Job_ID")
        Using db = New DB_EaglesInternalEntities
            Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = JobID).SingleOrDefault
            lblDocID.Text = ds.ItJobDocID
            lblRequest.Text = ds.RequestFrom
            lblUserIP.Text = ds.UserIP
            lblUserTel.Text = ds.UserTel
            lblPosition.Text = ds.Position
            lblDetail.Text = ds.JobDetail
            lblComment.Text = ds.Comment
            lblpair.Text = ds.RepairDetail
            lblCreatedate.Text = String.Format("{0:dd/MM/yyyy }", ds.CreateDate)
            lblupdate.Text = String.Format("{0:dd/MM/yyyy }", ds.UpdateDate)
            lblClosedate.Text = String.Format("{0:dd/MM/yyyy }", ds.CloseDate)

            If ds.JobStatus = "createjob.png" Then
                lblstatus.Text = "สร้างเอกสาร"
            ElseIf ds.JobStatus = "acceptjob.png" Then
                lblstatus.Text = "IT รับเอกสาร"
            ElseIf ds.JobStatus = "repairjob.png" Then
                lblstatus.Text = "ดำเนินการแก้ไข"
            ElseIf ds.JobStatus = "closejob.png" Then
                lblstatus.Text = "แก้ไขเรียบร้อยแล้ว"
            End If

            If ds.RecipientJob = "" Or ds.RecipientJob = "-" Or ds.RecipientJob = "ยังไม่มีผู้รับงาน" Then
            Else
                Dim ds1 = (From c In db.tblUsers Where c.UserId = ds.RecipientJob).SingleOrDefault
                lblRecipient.Text = ds1.Name_thai
            End If

            If ds.AssignJobTo = "" Or ds.AssignJobTo = "-" Or ds.AssignJobTo = "ยังไม่ได้กำหนด" Then
            Else
                Dim ds2 = (From c In db.tblUsers Where c.UserId = ds.AssignJobTo).SingleOrDefault
                lblAssign.Text = ds2.Name_thai
            End If

            Dim ds3 = (From c In db.tblCaseJobs Where c.CaseJobID = ds.CaseJobID).SingleOrDefault
            lblCaseJob.Text = ds3.CaseName

            If ds.JobStatus = "closejob.png" Then
                btnClose.Visible = False
            End If



        End Using
    End Sub
    Protected Sub btnSaveChange_Click(sender As Object, e As EventArgs) Handles btnSaveChange.Click

        getMaliCose()

    End Sub

    Protected Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)
        Dim index As String = Request.QueryString("Job_ID")
        Dim LoginCls As New LoginCls

        Dim Key As String = LoginCls.EncryptPass
        Dim id As String = Session("UserID").ToString
        Dim menu As String = "ITJOB"

        Using db As New DB_EaglesInternalEntities
            Dim men = From c In db.tblUserMenus Where c.UserID = id And
            c.Menu = menu And c.Edit_ = 1

            If men.Any Then

                Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = index).SingleOrDefault
                lbldocID2.Text = ds.ItJobDocID

                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "EditModalScript", "openModal();", True)
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('You do not have access')", True)

            End If

        End Using
    End Sub

    Private Sub getMaliCose()
        'Dim userid = Session("UserID").ToString
        Using db As New DB_EaglesInternalEntities
            Dim _mail As New Mail()
            Dim MyJobGV = (From tb1 In db.tblItJobDocs Where tb1.ItJobDocID = lbldocID2.Text
                  Join tb2 In db.tblUsers On tb1.RecipientJob Equals tb2.UserId).SingleOrDefault
            Dim m As String = MyJobGV.tb2.Email
            Try
                'เช็คค่าว่าง
                If (String.IsNullOrEmpty(m)) Then
                    getColse()
                Else
                    _mail.mailCloseJob("nattaphon.k@eaglesthai.com")
                    getColse()
                End If
            Catch ex As Exception
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('เกิดข้อมูลผิดพลาด กรุณาติดต่อฝ่าย IT ! ')", True)
            End Try
        End Using
    End Sub

    Private Sub getColse()

        MsgBox(lbldocID2.Text)

        Using db = New DB_EaglesInternalEntities

            Dim Job As tblItJobDoc = (From c In db.tblItJobDocs _
                        Where c.ItJobDocID = lbldocID2.Text _
                        Select c).First()
            Job.RepairDetail = txtRepairDetail.Text
            Job.JobStatus = "closejob.png"
            Job.Updateby = Session("userid").ToString
            Job.UpdateDate = Now

            db.SaveChanges()
            ' Response.Redirect(Request.Cookies("MainConfigPath").Value + "SearchUser.aspx")
            Response.Redirect("homepage.aspx")
        End Using
    End Sub
End Class