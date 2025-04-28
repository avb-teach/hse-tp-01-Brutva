#!/bin/bash

input_dir=$1
output_dir=$2

mkdir $output_dir

python3 - <<END

import shutil
import os

input_dir = $input_dir
output_dir = $output_dir

for dirpath, _, filenames in os.walk(source):
    relative_path = os.path.relpath(dirpath, source)
    level = relative_path.count(os.sep)
    if level < 2: 
        for file in filenames:
            shutil.copy2(dirpath + "/" + file, destination)

END