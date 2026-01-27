#!/bin/bash
SERVER_URL=wss://meet.movilok.net
API_KEY=API9puWnvc352fG
API_SECRET=qcZNqVHUpfQKTprzpliknDySRCyE56ZPmc84b4TURHW

for i in $(seq 1 $1); do
  ROOM="test-room-$i"

  # two users (both publishers and subscribvers) in the room
  lk load-test \
    --url "$SERVER_URL" \
    --api-key "$API_KEY" \
    --api-secret "$API_SECRET" \
    --room "$ROOM" \
    --video-publishers 2 \
    --subscribers 2 \
    --duration 10m \
    >./logs/lk-room-$i.log 2>&1 &
done

wait
