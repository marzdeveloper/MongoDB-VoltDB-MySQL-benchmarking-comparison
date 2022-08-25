#! /bin/sh

$op= 1000, 25000, 50000, 100000, 200000, 300000, 400000, 500000, 600000, 700000, 800000, 900000, 1000000
$clients = 1, 5, 10, 25, 50, 100, 150, 500, 1000
foreach ($i in $op){
	foreach($j in $clients){
		./bin/ycsb run mongodb-async -P workloads/workloada -P db.properties -p fieldcount=5 -p fieldlength=10 -p zeropadding=21 -p insertorder=ordered -p recordcount=1000000 -p operationcount=$i -threads $j > Results/L_w_a_op${i}_t${j}_MongoDB.txt
		./bin/ycsb run mongodb-async -P workloads/workloadb -P db.properties -p fieldcount=5 -p fieldlength=10 -p zeropadding=21 -p insertorder=ordered -p recordcount=1000000 -p operationcount=$i -threads $j > Results/L_w_b_op${i}_t${j}_MongoDB.txt
		./bin/ycsb run mongodb-async -P workloads/workloade -P db.properties -p fieldcount=5 -p fieldlength=10 -p zeropadding=21 -p insertorder=ordered -p recordcount=1000000 -p operationcount=$i -threads $j > Results/L_w_e_op${i}_t${j}_MongoDB.txt
	}
}