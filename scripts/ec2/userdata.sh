#!/bin/bash
RUN_DIR=/opt
REPO=unreal-stress-test
cd $RUN_DIR
git clone https://github.com/rog2/$REPO.git
./$REPO/scripts/ec2/boot.sh $RUN_DIR >> $RUN_DIR/boot.log 2>&1
