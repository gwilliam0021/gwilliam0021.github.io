"Searching for Encrypted files"
cipher /u /n /h > C:\temp\encryptedFiles.csv
$files = import-csv C:\temp\encryptedFiles.csv
"Found "+($files.count-2)+" encrypted files. Decrypting."
if ($files.count -gt 2)
{
    
    $counter = 0
    foreach ($file in $files)
    {
        cipher /d $file.h1
    }
    cls
    "A list of decrypted files can be found at C:\temp\EncryptedFiles.csv"
    "Decryption Complete. This program will close in 5 seconds..."
    start-sleep -Seconds 5
}