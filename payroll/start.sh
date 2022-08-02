#!/bin/sh

bin/payroll eval "Core.Release.migrate" && \
bin/payroll start
