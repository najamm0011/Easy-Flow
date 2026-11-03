"""Offline local web UI wrapped in a Windows executable (no cloud needed)."""
import os, sys, socket, threading, time, webbrowser
import uvicorn
from backend.core.config import HOST, PORT
from backend.main import app

def ready(host,port,timeout=15):
    end=time.monotonic()+timeout
    while time.monotonic()<end:
        try:
            with socket.create_connection((host,port),timeout=.3):return True
        except OSError:time.sleep(.15)
    return False

def main():
    host=os.environ.get('NS_HOST',HOST)
    port=int(os.environ.get('NS_PORT',str(PORT)))
    if host not in ('127.0.0.1','localhost','::1') and os.environ.get('NS_ALLOW_LAN')!='1':
        raise SystemExit('Desktop mode is localhost-only. Use NS_ALLOW_LAN=1 explicitly to enable LAN.')
    url=f'http://127.0.0.1:{port}/dashboard'
    def browser():
        if ready('127.0.0.1',port):webbrowser.open(url)
    threading.Thread(target=browser,daemon=True).start()
    print('EasyFlow:',url,flush=True)
    uvicorn.run(app,host=host,port=port,log_level='warning')
if __name__=='__main__':main()
