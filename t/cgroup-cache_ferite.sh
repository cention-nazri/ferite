#!/bin/sh
if [ -z "$1" ]; then
	echo "Usage: $0 <ferite script>

Runs <ferite script> with cache_ferite
"
	exit 1
fi

dir=$(dirname $0)
script="$1"
# This script assumes that we're running in ubuntu
cgroup_dir=/sys/fs/cgroup
# On centos it should be
#cgroup_dir=/cgroup

cpu_cgroup=$cgroup_dir/cpu/keepitdown
memory_cgroup=$cgroup_dir/memory/keepitdown

setup_cgroup() {
	if [ ! -d $cgroup_dir ]; then
		echo "No cgroup directory at $cgroup_dir"
		echo "Please make sure cgroup is enabled on this system"
		exit 1
	fi
	sudo cgcreate -a $USER -t $USER -g memory:keepitdown &&
	sudo cgcreate -a $USER -t $USER -g cpu:keepitdown &&
	half_cpu=$(($(cat $cgroup_dir/cpu/cpu.shares) / 2))  &&
	quarter_ram=$(($(free -b|awk '/Mem: / {print $2}') / 4)) &&
	echo $half_cpu > $cpu_cgroup/cpu.shares &&
	echo $quarter_ram > $memory_cgroup/memory.limit_in_bytes
}

if [ ! -d $cpu_cgroup -o ! -d $memory_cgroup ]; then
	setup_cgroup || exit 1
fi

echo "1..1"
cgexec -g cpu,memory:keepitdown $dir/../test/cache_ferite "$script" >/dev/null &
sleep 1
pid=$(pidof lt-cache_ferite)
if [ -n "$pid" ]; then
	top -b -n 1|grep lt-cache_ferite
	echo killall -9 lt-cache_ferite
	killall -9 lt-cache_ferite
	echo "not ok 1 - cache_ferite must run successfully"
else
	echo "ok 1 - cache_ferite must run successfully"
fi
