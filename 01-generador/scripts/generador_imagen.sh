#!/bin/bash

ffmpeg -f lavfi -i "anoisesrc=a=0.1:c=white:duration=5" out.wav