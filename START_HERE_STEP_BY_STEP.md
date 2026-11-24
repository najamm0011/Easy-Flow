# EasyFlow GitHub Upload Kit — Start Here

This kit is split into four category ZIP files. Each ZIP contains fewer than 100 files, so you can upload the four ZIP files to GitHub using the website's Upload files page. **Do not upload 100+ individual project files. Do not upload only the ZIPs and expect them to run:** the included GitHub Actions workflow extracts them on a Windows cloud runner before building.

## Files in this folder

1. `01_EasyFlow_App_Core.zip` — application backend, frontend, config, Python requirements, desktop launcher, and Windows packaging scripts.
2. `02_EasyFlow_Tests.zip` — project test suite.
3. `03_EasyFlow_Documentation.zip` — README files, phase notes, build notes, and QA documentation.
4. `04_EasyFlow_Developer_Tools.zip` — benchmarks, QA utilities, and legacy helper scripts. These are not needed by end users.
5. `GITHUB_WORKFLOW_COPY.txt` — workflow text that you will paste into a new GitHub Actions file.

## Step-by-step: create the Windows installer on GitHub

### Step 1 — Create a GitHub repository
1. Sign in at https://github.com.
2. Click the `+` button (top right) and choose **New repository**.
3. Name it `EasyFlow-Desktop`.
4. Choose **Private** if you do not want the source public.
5. Select **Add a README file**, then click **Create repository**.

### Step 2 — Upload the four ZIP files
1. Open your new repository's **Code** tab.
2. Click **Add file → Upload files**.
3. Open this extracted kit folder on your computer.
4. Select only these four files and drag them into the GitHub upload page:
   - `01_EasyFlow_App_Core.zip`
   - `02_EasyFlow_Tests.zip`
   - `03_EasyFlow_Documentation.zip`
   - `04_EasyFlow_Developer_Tools.zip`
5. Scroll down and click **Commit changes**.

The GitHub website sees only four uploaded files, so its 100-file limit is avoided. Keep the ZIP files in the repository root; do not put them inside another folder.

### Step 3 — Add the Windows build workflow
1. In the repository, click **Add file → Create new file**.
2. In the filename box, enter exactly:
   `.github/workflows/build-windows-installer.yml`
3. Open `GITHUB_WORKFLOW_COPY.txt` from this kit using Notepad.
4. Copy all its contents and paste them into the GitHub editor.
5. Click **Commit changes** at the bottom.

GitHub will now recognize the workflow. The workflow extracts the four ZIP archives on a temporary Windows 2022 x64 computer, installs build tools there, creates `EasyFlow.exe`, and packages it as `EasyFlow_Setup.exe`.

### Step 4 — Run the build
1. Open the repository's **Actions** tab.
2. Select **Build EasyFlow Windows Installer** on the left.
3. Click **Run workflow** on the right.
4. Leave the branch as `main` and click the green **Run workflow** button.
5. Open the new run and wait for all steps to show green check marks. A failed step will show a red X; open it to read the error.

### Step 5 — Download EasyFlow_Setup.exe
1. Open the successful workflow run.
2. Scroll to the **Artifacts** section near the bottom.
3. Download `EasyFlow-Windows-x64-Installer`.
4. Extract the downloaded artifact ZIP on your PC.
5. You will find `EasyFlow_Setup.exe` and `SHA256SUMS.txt` inside.
6. Double-click `EasyFlow_Setup.exe` on a Windows 10/11 64-bit PC to install EasyFlow.

## Important notes
- The installer is not already compiled in this kit. GitHub must run the workflow first.
- No `.bat` file needs to be opened or run.
- End users do not need to install Python. Python and app dependencies are bundled into the desktop build.
- If Microsoft WebView2 Runtime is missing, the installer downloads and installs it. Internet access is required for that prerequisite download.
- A successful workflow confirms that the executable and installer were produced. Test the installer on a clean Windows PC before sharing it broadly.
- This is a final build flow; no automatic update mechanism is configured.
