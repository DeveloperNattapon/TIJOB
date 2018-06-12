Option Explicit On
Option Strict On
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim LoginCls As New LoginCls
        Dim menu As String = "ITJOB"

        If LoginCls.chkUser(txtUserName.Value, txtUserPass.Value) Then
            Using db = New DB_EaglesInternalEntities
                Dim ds = (From c In db.tblUsers
                Where c.UserId = txtUserName.Value.Trim
                   Select New With
                   {
                     c.UserId,
                     c.Prefix_thai,
                     c.Name_thai,
                     c.Surname_thai,
                     c.Name_eng,
                     c.Dept,
                     c.Branch
                     }).FirstOrDefault()

                Dim ds1 = (From c In db.tblUserMenus Where c.UserID = ds.UserId And c.Menu = menu And c.Read_ = 1).FirstOrDefault
                If Not IsNothing(ds1) Then
                    Session("UserID") = txtUserName.Value.Trim
                    Session("Prefix_thai") = ds.Prefix_thai
                    Session("Name_thai") = ds.Name_thai
                    Session("Surname_thai") = ds.Surname_thai
                    Session("Name_eng") = ds.Name_eng
                    Session("Dept") = ds.Dept
                    Session("Branch") = ds.Branch
                    'Response.Redirect(Request.Cookies("MainConfigPath").Value & "Homepage.aspx")
                    Response.Redirect("Homepage.aspx")
                Else
                    lblMsg.Text = "* You do not have access"
                End If

            End Using

        Else
            lblMsg.Text = "* Your Username and/or password  is not correct."
        End If
    End Sub
End Class
