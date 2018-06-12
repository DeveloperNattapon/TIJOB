Option Strict On
Option Explicit On
Imports System.Net.Mail
Imports System.Net
Imports System.Net.NetworkCredential

Public Class Mail
    Public Sub sendMail(email As String)

        Using mm As New MailMessage()
            mm.From = New MailAddress("Admin System EaglesThai <it@eaglesthai.com>")
            mm.To.Add(New MailAddress(email))
            mm.CC.Add(email)
            mm.Subject = "IT รับทราบถึงปัญหา"
            mm.BodyEncoding = System.Text.Encoding.UTF8
            mm.Body = "เรียน คุณ <br />"
            mm.Body &= "ฝ่าย IT ได้รับทราบปัญหาแล้วของ ขนาดนี้กำลังดำเนินการแก้ไขปัญหา <br/>"
            mm.IsBodyHtml = True

            Dim smtp As New SmtpClient()
            smtp.UseDefaultCredentials = False
            Dim NetworkCred As New NetworkCredential("it@eaglesthai.com", "eas@2008")
            smtp.Credentials = NetworkCred
            smtp.Port = 25
            smtp.EnableSsl = False
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network
            smtp.Host = "mail.eaglesthai.com"


            Try
                smtp.Send(mm)
                smtp.Dispose()
                mm.Dispose()

            Catch ex As Exception
                'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('การส่งอีเมลเกิดข้อมูลผิดพลาด กรุุณาลองใหม่อีกครั้งค่ะ !')", True)
                MsgBox("เกิดข้อมูลผิดพลาด")

            End Try
        End Using

    End Sub

    Public Sub mailCloseJob(email As String)


        Using mm As New MailMessage()
            mm.From = New MailAddress("Admin System EaglesThai <it@eaglesthai.com>")
            mm.To.Add(New MailAddress(email))
            mm.CC.Add(email)
            mm.Subject = "ดำเนินการแก้ไขปัญหาสำหรับ"
            mm.BodyEncoding = System.Text.Encoding.UTF8
            mm.Body = "เรียน คุณ <br />"
            mm.Body &= "ฝ่าย IT ได้ทำการปัญหาเสร็จเรียบร้อยแล้ว <br/>"
            mm.IsBodyHtml = True

            Dim smtp As New SmtpClient()
            smtp.UseDefaultCredentials = False
            Dim NetworkCred As New NetworkCredential("it@eaglesthai.com", "eas@2008")
            smtp.Credentials = NetworkCred
            smtp.Port = 25
            smtp.EnableSsl = False
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network
            smtp.Host = "mail.eaglesthai.com"


            Try
                smtp.Send(mm)
                smtp.Dispose()
                mm.Dispose()

            Catch ex As Exception
                'ScriptManager.RegisterClientScriptBlock(Me, Me.GetType(), "alertMessage", "alert('การส่งอีเมลเกิดข้อมูลผิดพลาด กรุุณาลองใหม่อีกครั้งค่ะ !')", True)
                MsgBox("เกิดข้อมูลผิดพลาด")

            End Try
        End Using

    End Sub
End Class
