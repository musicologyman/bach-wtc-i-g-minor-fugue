#!/bin/bash

timidity $1 -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k $(basename $1 .midi).mp3
