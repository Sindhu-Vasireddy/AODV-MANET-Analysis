# AODV-MANET-Analysis

## Overview

This repository contains the implementation and evaluation of the AODV (Ad-hoc On-Demand Distance Vector) routing protocol in mobile ad-hoc networks (MANETs). The simulations are conducted with and without black hole attacks to study their impact on various performance metrics. The project aims to analyze throughput, delay, overhead, and packet delivery ratio in the presence and absence of black hole attacks.

## Contents

- [AODV_simulation.tcl](./AODV_simulation.tcl): Tcl script for simulating AODV protocol in MANETs.
- [AODV_WithBlackHoleAttack_simulation.tcl](./AODV_WithBlackHoleAttack_simulation.tcl): Tcl script for simulating AODV protocol with black hole attacks.
- [Brief_Report.pdf](./Brief_Report.pdf): The concise report presenting the key findings and analysis of the simulations.
- [calculate_throughput.awk](./calculate_throughput.awk): AWK script to calculate throughput from the simulation data.
- [delay.awk](./delay.awk): AWK script to analyze and compute delay metrics.
- [overhead.awk](./overhead.awk): AWK script to measure and evaluate overhead in the simulations.
- [packet_delivery_ratio.awk](./packet_delivery_ratio.awk): AWK script to determine the packet delivery ratio during the simulations.

## How to Use

1. Clone the repository: `git clone https://github.com/username/AODV-MANET-Analysis.git`
2. Navigate to the project folder: `cd AODV-MANET-Analysis`
3. Run the simulations using the provided Tcl scripts.
4. Use the AWK scripts to process the simulation output and analyze the performance metrics.
5. Refer to [Brief_Report.pdf](./Brief_Report.pdf) for a concise overview of the results and conclusions.

Feel free to open issues or contribute to the repository via pull requests. 
