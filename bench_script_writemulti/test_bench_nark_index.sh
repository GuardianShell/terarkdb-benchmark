record_num=800000
read_num=800000
dirname=/mnt/datamemory
value=128

rm -rf $dirname/*
export TMPDIR=$dirname
echo $TMPDIR
cp ../narkschema/dbmeta_bench_index.json $dirname/dbmeta.json 
echo "####Now, running nark benchmark"
echo 3 > /proc/sys/vm/drop_caches
free -m
date
export NarkDb_WrSegCacheSizeMB=256
../db_bench_nark_index --benchmarks=fillrandom --value_size=$value --num=$record_num --reads=$read_num --sync_index=0 --db=$dirname --threads=8
free -m
date
echo "####nark benchmark finish"
du -s -b $dirname

