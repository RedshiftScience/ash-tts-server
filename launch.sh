#!/bin/bash

RVC_MODEL=${2:-"ashera.pth"}
PIPER_MODEL=${3:-"ashera.ckpt"} 
USE_PIPER = ${1:-"use_piper"}

echo "starting servers..."


if [ "$USE_PIPER" = "use_piper" ]; then
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
python3 serverRVC.py --model_name $MODEL_NAME
echo "serverRVC started"
# deactivate
