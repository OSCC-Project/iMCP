#!/bin/bash
set -e
docker build -t mcp-ieda:1.0 .
docker run -v  /lib/x86_64-linux-gnu/libgomp.so.1:/lib/x86_64-linux-gnu/libgomp.so.1 -v /lib/x86_64-linux-gnu/libunwind.so.8:/lib/x86_64-linux-gnu/libunwind.so.8  -p 3002:3002 -it --rm mcp-ieda:1.0
