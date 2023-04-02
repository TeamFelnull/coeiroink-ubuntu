#!/bin/bash

cd voicevox_engine
python3.9 -m venv venv
source ./venv/bin/activate

python3.9 run.py --host 0.0.0.0 --use_gpu

