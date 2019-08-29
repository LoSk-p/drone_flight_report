# Drone Flight Report

Model: `QmXi1UDYqcaV2QapKhoAtVJNSEnJtP2M21p5YgR5PzYFQp`

The service registers a flight report.

It links your drone passport with a provided log file.

> You must register the drone via [drone-employee.com](https://drone-employee.com/#/registration) and use a liability address to identify a flight

## Objective topics

* `/liability` - the address of a liability
* `/log_hash` - IPFS hash of a log file

## Result topics

* `/liability/eth_<liability_address>/liability` - the same address of the liability
* `/liability/eth_<liability_address>/log_hash` - the same hash
* `/liability/eth_<liability_address>/status` - false if log_hash file is unreachable
* `/liability/eth_<liability_address>/timestamp` - the time stamp of registration

## Build

```
nix build -f release.nix
```

## Launch

By default the agent is set up to work in [sidechain](https://github.com/airalab/airalab-sidechain) network. To run in a different network change the following properties in the `agent.launch` file

```
...
<param name="token" value="0x966EbbFD7ECbCF44b1e05341976e0652CFA01360" />
<param name="lighthouse" value="0x202a09A451DE674d2d65Bf1C90968a8d8F72cf7b" />
...
```

To launch manually run:
```
source result/setup.zsh (bash)
roslaunch drone_flight_report agent.launch
```

or as a NixOS service add the following lines to `/etc/nixos/configuration.nix`:

```
systemd.services.drone_flight_report = {
      requires = [ "roscore.service" ];
      after = ["roscore.service" ];
      wantedBy = [ "multi-user.target" ];
      script = ''
        source /root/drone_flight_report/result/setup.bash \
        && roslaunch drone_flight_report agent.launch
      '';
      serviceConfig = {
        Restart = "on-failure";
        StartLimitInterval = 0;
        RestartSec = 60;
        User = "root";
      };
    };
```

and apply changes:
```
nixos-rebuild switch
```
