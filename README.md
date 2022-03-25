# Reproducing JEP-2021-1254

## Configure

To re-use, adjust the path to the Stata license in `config.txt`.

## Interactive usage

To run interactively, run

```{bash}
./run-interactively
```

and connect to https://localhost:8787 or whatever Codespaces tells you to connect to. By default, password is "testing" (user is "rstudio").

## Reproducible usage

To run the code for the paper, download the replication package, unzip, and adjust the path in the `run.sh` script (line 11). If the paper code is properly configured, the script will run through the analysis. 

## Docker container

https://hub.docker.com/r/aeadataeditor/jep-2021-1254/tags 

## Note

The file `setup.R` contains two R packages. These should not be necessary. 


