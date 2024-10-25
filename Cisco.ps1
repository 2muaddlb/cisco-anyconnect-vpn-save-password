timeout 15
# Import library System.Windows.Forms to use SendKeys
Add-Type -AssemblyName System.Windows.Forms

# Crypt your password by command:
# "your password" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString
# paste output string into $encryptedPassword

$encryptedPassword = "paste here"

# Convert encrypted password into SecureString
$securePassword = ConvertTo-SecureString $encryptedPassword

# Convert SecureString into plain text password to use SendKeys
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
$PASSWORD = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

# Start Cisco AnyConnect Secure Mobility Client
Start-Process -FilePath "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe"

# Timeout for AnyConnect window to pop-up
Start-Sleep -Seconds 5

# App window activation
<# Add-Type -AssemblyName Microsoft.VisualBasic
[Microsoft.VisualBasic.Interaction]::AppActivate("Cisco AnyConnect Secure Mobility Client") #>

# Key press simulation
<# Start-Sleep -Seconds 5
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{TAB}{ENTER}")
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("{TAB}{ENTER}")

[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 2 #>


# Password input and Enter press
[System.Windows.Forms.SendKeys]::SendWait($PASSWORD)
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")


# Clear memory after password usage
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
