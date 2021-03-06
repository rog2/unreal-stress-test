#!/bin/bash

cd $(dirname "$0")

nohup ./client-start.sh \
        $RUN_DIR/$BINARY_FOLDER/$EXEC_BINARY_NAME \
        "$EXEC_PARAMS" \
        $EXEC_CLIENT_PER_EC2 \
        $CLIENT_START_INTERVAL \
    >> $RUN_DIR/run.log 2>&1
