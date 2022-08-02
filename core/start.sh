#!/bin/sh

bin/core eval "Core.Release.migrate" && \
bin/core start
