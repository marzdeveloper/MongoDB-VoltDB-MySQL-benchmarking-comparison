#! /bin/bash

for i in 1000 25000 50000 100000 200000 300000 400000 500000 600000 700000 800000 900000 1000000; do
	for j in 1 5 10 25 50 100 150 500 1000; do
		./bin/ycsb.sh run voltdb -s -P workloads/workloada -p fieldcount=5 -p fieldlength=10 -p zeropadding=21 -p insertorder=ordered -p recordcount=1000000 -p operationcount=$i -threads $j > Results/L_w_a_op${i}_t${j}_VoltDB.txt
		./bin/ycsb.sh run voltdb -s -P workloads/workloadb -p fieldcount=5 -p fieldlength=10 -p zeropadding=21 -p insertorder=ordered -p recordcount=1000000 -p operationcount=$i -threads $j > Results/L_w_b_op${i}_t${j}_VoltDB.txt
		./bin/ycsb.sh run voltdb -s -P workloads/workloade -p fieldcount=5 -p fieldlength=10 -p zeropadding=21 -p insertorder=ordered -p recordcount=1000000 -p operationcount=$i -threads $j > Results/L_w_e_op${i}_t${j}_VoltDB.txt
	done
done