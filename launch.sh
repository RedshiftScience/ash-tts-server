#!/bin/bash

RVC_MODEL=${1:-"ashera.pth"}
PIPER_MODEL=${2:-"ashera.ckpt"} 
# USE_PIPER=${2:-"use_piper"} 


echo "starting servers..."


if [ PIPER_MODEL != "False" ]; then
    # Start serverPIPER
    echo "starting serverPIPER..."
    source /app/piper/.venv/bin/activate
    cd /app/piper/src/python

    python -m piper_train.serverPIPER --model $PIPER_MODEL &
    echo "serverPIPER started"
    # deactivate
fi
# Start serverRVC
echo "starting serverRVC..."
source /app/rvc/venv/bin/activate
which python3
cd /app/rvc/
# export CUDA_VISIBLE_DEVICES=1
python3 serverRVC.py --model_name $RVC_MODEL
echo "serverRVC started"
# deactivate
