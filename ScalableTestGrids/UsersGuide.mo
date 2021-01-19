within ScalableTestGrids;

package UsersGuide "User's Guide"
  extends Modelica.Icons.Information;

  package Overview
    extends Modelica.Icons.Information;
     annotation(
      preferredView = "info",
      Documentation(info = "<html>
<p>The ScalableTestGrids is a library of power system large-scale test cases to assess Modelica tools performance. It is based on models of the <a href=\"https://github.com/PowerGrids/PowerGrids\">PowerGrids</a> library and represents an excellent, high-quality and publicly available benchmark to test the efficiency of Modelica tools on large-scale problems and the progress done on this topic.</p>
<p>The library offers the possibility to easily create new test cases of variable size by setting to integer scale parameters N and M. Each test system is a 2N x 2N EHV (400 kV) grid, with alternating generator and load nodes. Each generator node is fed by a <a href=\"modelica://PowerGrids.Examples.IEEE14bus.ControlledGeneratorIEEE\">controlled synchronous generator</a>, taken straight from the IEEE14 bus example of the PowerGrids library, and by a step-up transformer. Each load node is connected to a step-down transformer to 63 kV, which is followed by M series-connected HV lines, with a load attached at the end of each one. A diagram of the system for the case N = 2, M = 2, can be found <a href=\"modelica://ScalableTestGrids/Resources/Documents/Type1Sample_N_2-Diagram.pdf\">here</a>.</p>
<p>The systems start in steady state, then at time = 1 the loads of the upper half of the grid are reduced by 10% - this triggers a transient involving the primary frequency control, and also a bit of inter-area oscillations, since there is some power transfer from south to north at the beginning.</p>
<p>The library comes with already generated models of increasing size. Each model has about twice the size of the previous one; this allows to check how the different aspects of tool performance (code generation time, compile time, intialization time, simulation time) scale with the system size.</p>
</html>"));
  end Overview;

  package License
    extends Modelica.Icons.ReleaseNotes;
    annotation(preferredView = "info",
      Documentation(info = "<html>
ScalableTestGrids is licensed under the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, you can obtain one at <a href=\"http://mozilla.org/MPL/2.0\">http://mozilla.org/MPL/2.0</a>.
</html>"));
  end License;

  package Contact
  extends Modelica.Icons.Contact;
    annotation(
      Documentation(info = "<html>
<p>ScalableTestGrids has been originally developed by RTE with help from F. Casella (Politecnico di Milano, Dynamica s.r.l.) and A. Bartolini (Dynamica s.r.l.). It is currently maintained by the following people in RTE:
<ul>
<li> Adrien Guironnet, <a href=\"mailto:adrien.guironnet@rte-france.com\">adrien.guironnet@rte-france.com</a></li>
<li> Marianne Saugier, <a href=\"mailto:marianne.saugier@rte-france.com\">marianne.saugier@rte-france.com</a></li>
</ul>
</p>
<p>In case of questions or issues, you can also send an e-mail to <a href=\"mailto:rte-dynawo@rte-france.com\">rte-dynawo@rte-france.com</a>.</p>
<p>If you are interested by the use of Modelica for power system modelling and by open-source approaches, please have a look to the following projects:
<ul>
<li><a href=\"http://dynawo.org\">Dyna&omega;o</a>, an open source hybrid C++/Modelica time-domain simulation tool for power system simulation.</li>
<li><a href=\"https://openmodelica.org\">OpenModelica</a>, an open source Modelica based modelling and simulation environment.</li>
</ul></p>
<p> If you want to get additional information related to <a href=\"https://www.rte-france.com/\">RTE</a> or <a href=\"http://www.dynamica-it.com\">Dynamica s.r.l.</a>, please check our websites.</p>
</html>"));
  end Contact;
   annotation(
    preferredView = "info",
    Documentation(info = "<html><head></head><body><p>
ScalableTestGrids is a Modelica library created to generate power system large-scale test cases to assess Modelica tools performance. This library was originally developed by RTE with help from Dynamica s.r.l. It is part of a larger effort to promote both the use of Modelica for power system modelling and the advantages of open-source approaches (for more detail, see the <a href=\"http://dynawo.org\">Dyna&omega;o website</a>).</p>
</body></html>"));
end UsersGuide;
