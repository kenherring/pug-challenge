# VSCode

## Setup OpenEdge

```bash
mkdir /psc
chown -R $USER:$USER /psc
docker cp oedb:/psc/dlc /psc/dlc
rm /psc/dlc/progress.cfg
ls -s /mnt/c/Progress/OpenEdge/progress.cfg /psc/dlc/progress.cfg
```