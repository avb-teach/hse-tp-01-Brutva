#!/bin/bash

input_dir="$1"
output_dir="$2"

mkdir -p "$output_dir"

python3 - <<END

import shutil
import os

input_dir = "$input_dir"
output_dir = "$output_dir"

for dirpath, _, filenames in os.walk(input_dir):
    for file in filenames:
        shutil.copy2(dirpath + "/" + file, output_dir)

END
