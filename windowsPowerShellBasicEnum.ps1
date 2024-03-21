write-host "#### Obtain info ####"

write-host "*********Machine and OS System Information*********"
(Get-CimInstance -ClassName Win32_Desktop | Out-String)
(wmic os get name,version /format:table | Out-String)

write-host "*********List local users and owners/groups********* "
(Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers, NumberOfUsers, RegisteredUser | Out-String)
(Get-LocalUser -name * | Select-Object -Property Name, Enabled | Out-String)

write-host "############ Network Interface and IP ###############"
(Get-NetIpConfiguration | Out-String)

write-host "############ Obtain Local Group ############"
(Get-Localgroup | Out-String)

write-host "############ Obtain Local Group of Admins ############"
(Get-LocalGroup Administrators | Out-String)

write-host "*********Obtain Session Information*********"
(Get-CimInstance -ClassName Win32_LogonSession | Out-String)

write-host "*********Obtain Available Disk Space*********"
(Get-CimInstance -ClassName Win32_LogicalDisk | Out-String) #-Filter "DriveType=3"

write-host "*********Obtain Running Program*********"
(Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" | Out-String)
