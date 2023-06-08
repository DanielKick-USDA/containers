#!/usr/bin/bash
PORT=8700
echo "Starting RStudio server at $PORT and binding $PWD in \'data\'"

singularity exec \
  --bind run:/run \
  --bind var-lib-rstudio-server:/var/lib/rstudio-server \
  --bind database.conf:/etc/rstudio/database.conf \
  --bind home:/home \
  --bind $PWD:/home/rstudio/data \
  --bind ide_settings:/home/rstudio/.config/rstudio/ \
  rstudio.sif \
  /usr/lib/rstudio-server/bin/rserver \
  --www-address=127.0.0.1 \
  --www-port=$PORT \
  --server-user=rstudio
