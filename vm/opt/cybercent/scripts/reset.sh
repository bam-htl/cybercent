#!/bin/bash

# use a backup of the trainee home directory to reset its state
sudo rsync -a --delete --chown=trainee:trainee /opt/cybercent/templates/trainee-home/ /home/trainee/
