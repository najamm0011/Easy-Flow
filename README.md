# EasyFlow — Localhost Edition

EasyFlow is a local web application for spreadsheet and lead-generation data processing. This repository contains the existing Phase 2 Extended source, frontend, backend and tests.

## Windows quick start

1. Download this repository via **Code → Download ZIP** and extract it to a writable folder.
2. Install **Python 3.11 or 3.12** for your Windows user account if it is not already installed. Enable **Add Python to PATH** if offered. Python is a prerequisite for this source-based release; this is **not** a bundled executable.
3. Double-click **setup.bat** once. Internet access is required to install Python packages into a local `.venv` folder. Administrator privileges should not be necessary for a per-user Python installation.
4. Double-click **start.bat** each time you want to use EasyFlow.
5. Visit **http://127.0.0.1:8000/dashboard**. Keep the server window open while using the app.
6. To stop, press **Ctrl+C** in the server window. `stop.bat` provides this instruction; it does not kill processes.

If the browser opens before the server is ready, refresh the page. If port 8000 is occupied, copy `config.example.bat` to `config.bat` and change `NS_PORT` to another free port.

## LAN (advanced)

Copy `config.example.bat` to `config.bat` and set `NS_HOST=0.0.0.0`; start with `start.bat`. Other devices on the same trusted network can access `http://YOUR-PC-LAN-IP:8000/dashboard` if Windows Firewall allows the port. LAN mode exposes processing endpoints to other network users: **do not expose this service to the public internet**. Keep localhost mode as the default.

## Project structure

- `frontend/` — existing EasyFlow web dashboard and assets
- `backend/` — FastAPI application and processing modules
- `tests/` — existing automated test suite
- `requirements.txt` — runtime Python dependencies
- `setup.bat`, `start.bat`, `stop.bat` — Windows user workflow
- `config.example.bat` — optional configuration template

## Development / troubleshooting

From the project directory, run `.venv\Scripts\python.exe -m pytest tests` after installing pytest. Tests may require additional optional dependencies. Check the existing phase-specific README files for feature implementation notes and limitations.

## Release status

This ZIP packages the **uploaded Phase 2 Extended snapshot**; it does not implement missing integrations, guarantee unlimited-size data handling, or certify that all features work. Test all workflows on a clean Windows PC before announcing a stable public release. CSV is preferable for datasets beyond Excel worksheet limits. Never commit API keys, passwords, customer datasets, uploads or generated exports.

## Licensing

No open-source license is included because the project owner must choose one. A public GitHub repository makes source visible but does not automatically grant reuse rights. Add a LICENSE file if you intend to grant those rights.
