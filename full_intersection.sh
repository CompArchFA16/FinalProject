#!/bin/bash

echo "Generating the Simulation"
cd verilog
iverilog -o intersection_test intersection_test.t.v
./intersection_test
mv sim.txt ../python_vis/

echo "Running the Simulation"

cd ../python_vis
python visualization.py