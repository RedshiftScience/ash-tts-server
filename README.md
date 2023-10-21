RedshiftScience ASH-TTS-Server

Combined piperTTS+MangioRVC in a single docker container

**Running**

The above test were ran with the text-tts-rvc-gen-streaming.py example

First you need enough ram on a GPU, suggest minnimum 6GB to have a somewhat real time experience.

Then using docker pull to pull the ash-server

- ```docker pull redshiftscience/ash-tts-server:latest```

Then run using a model from Huggingface and checkpoints of your choice at any url for piper and RVC (These are the ones in the example I am using).
You also need nvidia container toolkit installed for docker if you want to use your nvidia gpu.

- ```docker run -it --name ash-tts-server -p 50051:50051  -p 50052:50052  ash-tts-server:latest "use_piper" "https://files.redshiftscience.com/api/public/dl/lMWjjCRp/rvcM/melba-toast.pth" "https://files.redshiftscience.com/api/public/dl/lMWjjCRp/piper/ashera.ckpt"```

- ```cd examples/```
- ```pip install -r requirements.txt```
- ```python text-tts-auto-rvc-gen-streaming.py```

There is cli options ```--time``` for printing timings and ```--subtitles``` to enable a subtitle window.

**Tested with**

- RTX 3060 12GB VRAM (Local)
- RTX 3090 24GB VRAM (Runpod)

**TODO**

- documentation
- usage guide
