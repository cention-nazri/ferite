#!/bin/sh
dir=$(dirname $0)

sh $dir/cgroup-cache_ferite.sh $dir/hamt-no-collision.fe || exit 1
