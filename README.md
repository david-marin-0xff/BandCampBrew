# BandCampBrew

BandCampBrew – A small Windows app to download Bandcamp albums with a simple GUI.  

A pet project by El_Güero_0xDEADC0DE // Version 1.0, 10/2025

<img width="912" height="605" alt="image" src="https://github.com/user-attachments/assets/f0656fdf-3b6f-48e9-a5e3-3daf184450c7" />


---

## Features

- Simple GUI for downloading albums from Bandcamp  
- Downloads saved to `Desktop\BandcampDownloads` by default  
- Pop-up on completion  

---

## Prerequisites

Before using BandCampBrew (v1.0), make sure the following are installed:

1. **PowerShell 5.1 or higher** (comes pre-installed on Windows 10+)  
2. **.NET Framework 4.5 or higher** (required for the GUI)  
3. **bandcamp-dl downloader**:
   - For the script: `bandcamp-dl` must be installed and in your system PATH  
   - For the executable: ensure `bandcamp-dl.exe` is in the same folder or PATH  
4. **Write permissions** to the download folder (default: `Desktop\BandcampDownloads`)  
5. **Internet access** to download albums  

> Without these prerequisites, downloads may fail with a “file not found” or similar error.

---

## Usage

1. Download the repository or EXE from the releases section  
2. Run `BandCampBrew.exe` (or `BandCampBrew_GUI.ps1` in PowerShell)  
3. Enter the Bandcamp album URL  
4. Choose the download folder or leave default  
5. Click **Download** and wait for completion  

---

## License

This project is licensed under the MIT License.  

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
