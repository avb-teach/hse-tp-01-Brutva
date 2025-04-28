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
    relative_path = os.path.relpath(dirpath, input_dir)
    level = relative_path.count(os.sep)
    if level < 2: 
        for file in filenames:
            shutil.copy2(dirpath + "/" + file, output_dir)

END
