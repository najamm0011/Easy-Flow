"""Build Windows portable EXE; run on Windows, not Linux."""
import importlib.util, platform, subprocess, sys
from pathlib import Path
if platform.system()!='Windows':raise SystemExit('Windows build required: PyInstaller is not a cross-compiler')
args=[sys.executable,'-m','PyInstaller','--noconfirm','--clean','--onedir',
      '--name','EasyFlow','--add-data','frontend;frontend',
      '--collect-all','openpyxl',
      '--hidden-import','backend.modules.processing',
      '--hidden-import','backend.modules.overview']
for optional in ('polars','duckdb'):
    if importlib.util.find_spec(optional):args.extend(['--collect-all',optional])
args.append('desktop_launcher.py')
raise SystemExit(subprocess.call(args,cwd=Path(__file__).resolve().parent))
