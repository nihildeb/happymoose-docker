#!/bin/bash

pdns_server --gpgsql-host=$DB_PORT_5432_TCP_ADDR --gpgsql-port=$DB_PORT_5432_TCP_PORT
