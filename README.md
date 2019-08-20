# Drone Flight Report

Model: `QmXi1UDYqcaV2QapKhoAtVJNSEnJtP2M21p5YgR5PzYFQp`

You must register your drone via [drone-employee.com](https://drone-employee.com/#/registration) and use your liability address to identify a flight

Rosbag:

* `/liability` - the address of liability
* `/log_hash` - IPFS hash of log file

Result:

* `/liability/eth_<liability_address>/liability` - the same address of the liability
* `/liability/eth_<liability_address>/log_hash` - the same hash
* `/liability/eth_<liability_address>/status` - false if log_hash file is unreachable
* `/liability/eth_<liability_address>/timestamp` - the time stamp of registration 
