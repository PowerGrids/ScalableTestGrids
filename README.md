# ScalableTestGrids - A library of power system large-scale test cases to assess Modelica tools performance

This repository contains the code for ScalableTestGrids, a Modelica library created to generate power system large-scale test cases to assess Modelica tools performance. This library was originally developed by RTE with help from Dynamica s.r.l. It is part of a larger effort to promote both the use of Modelica for power system modelling and the advantages of open-source approaches (for more detail, go to [Dyna&omega;o website](http://dynawo.org)).

## Table of Contents
- [About ScalableTestGrids](#about)
- [License](#license)
- [Maintainers](#maintainers)
- [Links](#links)

<a name="about"></a>
## About ScalableTestGrids

The ScalableTestGrids is a library of power system large-scale test cases to assess Modelica tools performances. It is based on the PowerGrids models and represents an excellent, high-quality and publicly available benchmark to test the efficiency of Modelica tools on large-scale problems and the progresses done on this topic. 

The library offers the possibility to easily create new test cases by setting two integer scaling factors N and M. Each test system is a 2N x 2N EHV (400 kV) grid, with alternating generator and load nodes. Each generator node is fed by a controlled synchronous generator, taken straight from the PowerGrids library examples in the tutorial, and by a step-up transformer. Each load node is connected to a step-down transformer to 63 kV, which is followed by M series-connected HV lines, with a PQ load attached at the end of each one. The systems start in steady state, then at time = 1 the loads of the upper half of the grid are reduced by 10% - this triggers a transient involving the primary frequency control, and also a bit of inter-area oscillations, since there is some power transfer from south to north at the beginning. 

<a name="license"></a>
## License
ScalableTestGrids is licensed under the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0. You can also see the [LICENSE](LICENSE.txt) file for more information.
<a name="maintainers"></a>
## Maintainers
ScalableTestGrids has been originally developed by RTE with the help from F. Casella (Politecnico di Milano, Dynamica s.r.l.) and A. Bartolini (Dynamica s.r.l.). It is currently maintained by the following people in RTE: 
* Adrien Guironnet, [adrien.guironnet@rte-france.com](mailto:adrien.guironnet@rte-france.com)
* Marianne Saugier, [marianne.saugier@rte-france.com](mailto:marianne.saugier@rte-france.com)

In case of questions or issues, you can also send an e-mail to [rte-dynawo@rte-france.com](mailto:rte-dynawo@rte-france.com).
<a name="links"></a>
## Links
If you are interested by the use of Modelica for power system modelling and by open-source approaches, please have a look to the following projects:
* [Dyna&omega;o](http://dynawo.org), an open source hybrid C++/Modelica time-domain simulation tool for power system simulation.
* [OpenModelica](http://openmodelica.org), an open source Modelica based modelling and simulation environment.

If you want to get additional information related to [RTE](https://www.rte-france.com/) or [Dynamica s.r.l.](http://www.dynamica-it.com), please go to our websites.
