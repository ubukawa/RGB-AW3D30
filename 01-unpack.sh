#!/bin/sh
mkdir 01_unzip; for f in src/*.zip; do unzip ${f} -d 01_unzip; done