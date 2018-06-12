Option Strict On
Option Explicit On

Public Class Preview
    Inherits System.Web.UI.Page
    Dim ep As New edit_PreviewJob()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Bindata()

        End If
    End Sub
    Sub Bindata()
        Dim JobID As String = Request.QueryString("Job_ID")
        Using db = New DB_EaglesInternalEntities
            Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = JobID).SingleOrDefault
            lblDoc_ID.Text = ds.ItJobDocID
            lblRequest.Text = ds.RequestFrom
            lblUserIP.Text = ds.UserIP
            lblUserTel.Text = ds.UserTel
            labDivision.Text = ds.DivisionName
            lblPosition.Text = ds.Position
            lblDetail.Text = ds.JobDetail
            lblRepair.Text = ds.RepairDetail
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

            Dim cji As String = ds.CaseJobID
            'check null'
            If (String.IsNullOrEmpty(cji)) Then
                lblCaseJob.Text = "ไม่ได้เลือกหัวข้องาน"
            Else
                Dim ds3 = (From c In db.tblCaseJobs Where c.CaseJobID = cji).SingleOrDefault
                lblCaseJob.Text = ds3.CaseName
            End If





        End Using
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click

        Dim JobID As String = Request.QueryString("Job_ID")
        Using db = New DB_EaglesInternalEntities
            Dim lblLabel As Label = CType(Me.lblDoc_ID.FindControl("lblDoc_ID"), Label)
            Dim ds = (From c In db.tblItJobDocs Where c.ItJobDocID = JobID).SingleOrDefault

            If ds.RecipientJob = "ยังไม่มีผู้รับงาน" Then
                'onclickNext()
                Response.Write("<script>window.open('edit_PreviewJob.aspx?Job_ID=" & lblLabel.Text & "',target='_self');</script>")
            Else
                ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('ไม่สามารถเข้าแก้ไข ได้ค่ะ ! ')", True)
            End If


        End Using


    End Sub
End Class