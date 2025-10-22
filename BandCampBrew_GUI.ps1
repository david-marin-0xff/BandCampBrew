Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# ===============================
# BandCampBrew GUI
# A pet project by El_Güero_0xDEADC0DE // Version 1.0
# ===============================

# --- CONFIG ---
$Version = "1.0"
$CreditText = "BandCampBrew`nA pet project by El_Güero_0xDEADC0DE // Version $Version"
$DefaultFolder = [System.IO.Path]::Combine([Environment]::GetFolderPath("Desktop"), "BandcampDownloads")
if (-not (Test-Path $DefaultFolder)) { New-Item -ItemType Directory -Path $DefaultFolder | Out-Null }

# --- MAIN FORM ---
$form = New-Object System.Windows.Forms.Form
$form.Text = "BandCampBrew"
$form.Width = 750
$form.Height = 500
$form.StartPosition = "CenterScreen"
$form.Font = New-Object System.Drawing.Font("Consolas",12,[System.Drawing.FontStyle]::Regular)
$form.BackColor = "#FFA500"  # Orange background
$form.ForeColor = "#006400"  # Dark green text

# --- TABS CONTROL ---
$tabs = New-Object System.Windows.Forms.TabControl
$tabs.Dock = 'Fill'
$form.Controls.Add($tabs)

# ========== TAB 1: DOWNLOADER ==========
$tabDownload = New-Object System.Windows.Forms.TabPage
$tabDownload.Text = "Downloader"
$tabs.TabPages.Add($tabDownload)

# URL label + textbox
$lblUrl = New-Object System.Windows.Forms.Label
$lblUrl.Text = "Insert Bandcamp album URL:"
$lblUrl.Location = '20,20'
$lblUrl.AutoSize = $true
$tabDownload.Controls.Add($lblUrl)

$txtUrl = New-Object System.Windows.Forms.TextBox
$txtUrl.Location = '20,50'
$txtUrl.Width = 680
$tabDownload.Controls.Add($txtUrl)

# Folder label + textbox + browse
$lblFolder = New-Object System.Windows.Forms.Label
$lblFolder.Text = "Download Folder:"
$lblFolder.Location = '20,90'
$lblFolder.AutoSize = $true
$tabDownload.Controls.Add($lblFolder)

$txtFolder = New-Object System.Windows.Forms.TextBox
$txtFolder.Location = '20,120'
$txtFolder.Width = 580
$txtFolder.Text = $DefaultFolder
$tabDownload.Controls.Add($txtFolder)

$btnBrowse = New-Object System.Windows.Forms.Button
$btnBrowse.Text = "Browse"
$btnBrowse.Location = '610,118'
$btnBrowse.Width = 90
$btnBrowse.Add_Click({
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
    if ($dialog.ShowDialog() -eq 'OK') { $txtFolder.Text = $dialog.SelectedPath }
})
$tabDownload.Controls.Add($btnBrowse)

# Download button
$btnDownload = New-Object System.Windows.Forms.Button
$btnDownload.Text = "Download"
$btnDownload.Location = '610,155'
$btnDownload.Width = 90
$tabDownload.Controls.Add($btnDownload)

# Output box
$txtOutput = New-Object System.Windows.Forms.TextBox
$txtOutput.Multiline = $true
$txtOutput.ScrollBars = "Vertical"
$txtOutput.ReadOnly = $true
$txtOutput.Location = '20,200'
$txtOutput.Width = 680
$txtOutput.Height = 180
$tabDownload.Controls.Add($txtOutput)

# Progress bar
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = '20,390'
$progressBar.Width = 680
$progressBar.Height = 25
$progressBar.Minimum = 0
$progressBar.Maximum = 100
$progressBar.Value = 0
$tabDownload.Controls.Add($progressBar)

# ========== TAB 2: CREDITS ==========
$tabCredits = New-Object System.Windows.Forms.TabPage
$tabCredits.Text = "Credits"
$tabs.TabPages.Add($tabCredits)

$lblCredits = New-Object System.Windows.Forms.Label
$lblCredits.Text = $CreditText
$lblCredits.Font = New-Object System.Drawing.Font("Consolas",14,[System.Drawing.FontStyle]::Bold)
$lblCredits.AutoSize = $true
# Center credits
$lblCredits.Location = [System.Drawing.Point]::new(($tabCredits.Width - $lblCredits.PreferredWidth)/2, ($tabCredits.Height - $lblCredits.PreferredHeight)/2)
$lblCredits.Anchor = 'None'
$tabCredits.Controls.Add($lblCredits)

# ========== TAB 3: HELP ==========
$tabHelp = New-Object System.Windows.Forms.TabPage
$tabHelp.Text = "Help"
$tabs.TabPages.Add($tabHelp)

$helpLines = @(
    "How to use BandCampBrew:",
    "",
    "• Insert the Bandcamp album URL in the first textbox.",
    "• Choose your download folder or leave default (Desktop\BandcampDownloads).",
    "• Click 'Download' to start downloading the album.",
    "• Wait for the progress bar to complete. A pop-up will appear when finished.",
    "• Support the artists you love by buying tickets, official releases, and merch.",
    "",
    "Enjoy your music!"
)

$txtHelp = New-Object System.Windows.Forms.RichTextBox
$txtHelp.Multiline = $true
$txtHelp.ReadOnly = $true
$txtHelp.Dock = 'Fill'
$txtHelp.BackColor = "#FFEFD5"  # light peach for help tab
$txtHelp.ForeColor = "#006400"
$txtHelp.Text = $helpLines -join "`r`n"
$tabHelp.Controls.Add($txtHelp)


# --- DOWNLOAD LOGIC ---
$btnDownload.Add_Click({
    $url = $txtUrl.Text.Trim()
    $folder = $txtFolder.Text.Trim()
    if (-not $url) {
        [System.Windows.Forms.MessageBox]::Show("Please enter a Bandcamp album URL.","Missing URL")
        return
    }
    $txtOutput.AppendText("Starting download for: $url`r`n")
    $progressBar.Value = 0

    try {
        # Start process and simulate progress
        $process = Start-Process -FilePath "bandcamp-dl" -ArgumentList "$url --base-dir `"$folder`"" -NoNewWindow -PassThru

        # Fake progress animation
        for ($i=0; $i -le 100; $i+=10) {
            Start-Sleep -Milliseconds 300
            $progressBar.Value = $i
            $form.Refresh()
        }

        $process.WaitForExit()
        $progressBar.Value = 100
        $txtOutput.AppendText("✅ Download complete!`r`n")

        # Show final popup message
        [System.Windows.Forms.MessageBox]::Show(
            "Download completed successfully! Support the artists you love by buying tickets, official releases and merch. Because music isn’t just data… it’s life! --- El_Güero_0xDEADC0DE",
            "Download Complete"
        )

    } catch {
        $txtOutput.AppendText("❌ Error: $_`r`n")
    }
})

# --- SHOW FORM ---
[void]$form.ShowDialog()
