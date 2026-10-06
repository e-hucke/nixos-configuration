#!/usr/bin/env python3
import json
import os
import runpy
import sys

STEAM_RUN = "@steamRun@"

if os.environ.get("JACKIFY_STEAM_RUN") != "1":
    home = os.path.expanduser("~")
    data_dir = os.path.join(home, "Jackify")
    config = os.path.join(home, ".config", "jackify", "config.json")
    try:
        with open(config) as f:
            data_dir = os.path.expanduser(json.load(f).get("jackify_data_dir") or data_dir)
    except (OSError, ValueError):
        pass

    for sub in ("temp", "logs", "cache", ".tmp"):
        os.makedirs(os.path.join(data_dir, sub), exist_ok=True)

    tmp = os.path.join(data_dir, ".tmp")
    os.environ.update(TMPDIR=tmp, TMP=tmp, TEMP=tmp, JACKIFY_STEAM_RUN="1")

    os.execv(STEAM_RUN, [STEAM_RUN, sys.executable, os.path.abspath(__file__), *sys.argv[1:]])

sys.argv[0] = "jackify"
runpy.run_module("jackify.frontends.gui", run_name="__main__", alter_sys=True)
