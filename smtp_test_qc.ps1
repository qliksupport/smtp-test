#SMTP Testing Tool 
#------------------------------------------------------------------------------
#Edit lines 11,18,19,21,24,25 as required.
################################################################################
# You may need to first open Windows PowerShell Modules and then
# First run Get-ExecutionPolicy - make a note of the policy
# run the powershell command: Set-ExecutionPolicy Unrestricted
#  ** Don't forget to revert it to the original policy after running this test
################################################################################

$smtpServer = "smtp.gmail.com"

 #Creating a Mail object
 $msg = new-object Net.Mail.MailMessage

 #Creating SMTP server object
 $smtp = new-object Net.Mail.SmtpClient($smtpServer)
 $smtp.Enablessl = $true
 $smtp.port = 587
 #Leave the line below commented out if using anonymous authentication
 $smtp.Credentials = New-Object System.Net.NetworkCredential("emailaddress@gmail.com","password*****");

 #Email structure 
 $msg.From = "From_e-mail_address@gmail.com"
 $msg.To.Add("to_e-mail_address@domain.com")

 $msg.subject = "SMTP Test"


 $msg.IsBodyHTML = $true
 $msg.body = "This is an e-mail testing email."+"<br /><br />"

 $ok=$true 
 Write-Host "SMTP Server:" $smtpserver "Port #:" $smtp.port "SSL Enabled?" $smtp.Enablessl
 try{
        $smtp.Send($msg)
        Write-Host "SENT"

 }
 catch {
    $error[0]
    $_.Exception.Response
    $ok=$false
 }
 finally{
    $msg.Dispose()

 }
 if($ok){
    Write-Host "EVERYTHING PASSED"
 }
