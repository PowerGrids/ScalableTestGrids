within ScalableTestGrids.Models.Type1;

model Type1_reduced_N_2_M_4
  extends Type1_N_2_M_4;
  output Modelica.SIunits.PerUnit omega = GEN_1_1.omega;
equation
  annotation(__OpenModelica_commandLineOptions = "-d=execstat,evalOutputOnly --daeMode --tearingMethod=minimalTearing",
             __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_STATS"),
             experiment(StopTime = 15, Tolerance = 1e-4));
end Type1_reduced_N_2_M_4;
