#!/bin/bash

if [ ! -f $SERVER_DIR/spigot.jar ]; then
    cp /spigot.jar $SERVER_DIR/spigot.jar
fi

# Copy start script for restarts
cp /start.sh $SERVER_DIR/start.sh
# Accept EULA
echo eula=true > $SERVER_DIR/eula.txt

# Any custom configuration is handled in your config script
# Mount a configuration directory using -v/--volume when running
if [ -f $CONFIG_DIR/config.sh ]; then
    $CONFIG_DIR/config.sh
fi

java -Xms$MINMEM -Xmx$MAXMEM $ADDPARAMS -jar spigot.jar

/bin/bash

