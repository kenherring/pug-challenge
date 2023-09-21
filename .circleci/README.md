# CircleCI

## `hex2bin.sh`

Convert the CFG file to hex so it can be stored as a string.  This string can then be stored as a private environment variable in CircleCI.

```bash
bin2hex.sh < $DLC/progress.cfg > $DLC/progress.cfg.hex
```

## `bin2hex.sh`

Convert a hex value to a binary file.  This is used to convert the output from the above to a `progress.cfg` file at runtime.

```bash
hex2bin.sh < <$(tr ' ' '\n' <<< "$PROGRESS_CFG_HEX") > $DLC/progress.cfg
```
