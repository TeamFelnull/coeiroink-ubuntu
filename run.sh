#!/bin/bash

cd voicevox_engine
python3 -m venv venv
source ./venv/bin/activate

python3 run.py --host 0.0.0.0 --use_gpu

