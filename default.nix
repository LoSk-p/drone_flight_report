{ pkgs ? import <nixpkgs> { }
, stdenv
, mkRosPackage
, robonomics_comm
}:

mkRosPackage rec {
  name = "${pname}-${version}";
  pname = "drone_flight_report";
  version = "0.4.0";

  src = ./.;

  propagatedBuildInputs = [
    robonomics_comm
    pkgs.python3Packages.ipfshttpclient
  ];

  meta = with stdenv.lib; {
    description = "Service to register a drone flight via Robonmics Network";
    homepage = http://github.com/DistributedSky/drone_flight_report;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vourhey ];
  };
}
