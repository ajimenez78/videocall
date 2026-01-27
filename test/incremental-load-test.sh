#!/bin/bash
SERVER_URL=wss://meet.movilok.net
API_KEY=API9puWnvc352fG
API_SECRET=qcZNqVHUpfQKTprzpliknDySRCyE56ZPmc84b4TURHW
MAX_ROOMS=500
INCREMENT=10
BURST_DELAY=15

echo "Starting incremental test: $MAX_ROOMS rooms 1:1..."

for i in $(seq 1 $MAX_ROOMS); do
  ROOM="test-room-$i"

  # two users (both publishers and subscribvers) in the room
  lk load-test \
    --url "$SERVER_URL" \
    --api-key "$API_KEY" \
    --api-secret "$API_SECRET" \
    --room "$ROOM" \
    --video-publishers 2 \
    --subscribers 2 \
    --duration 15m \
    >./logs/lk-room-$i.log 2>&1 &

    if ((i % INCREMENT == 0)); then
        echo "Actual load: $i active rooms ( $((i*2)) participants ). waiting stability..."
        sleep $BURST_DELAY
    fi
done

echo "Maximum load reached. Maintaining test..."
wait
