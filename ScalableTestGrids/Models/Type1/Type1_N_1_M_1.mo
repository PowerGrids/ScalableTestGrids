within ScalableTestGrids.Models.Type1;
model Type1_N_1_M_1
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(
    initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow);
  PowerGrids.Electrical.Buses.ReferenceBus BUS_GEN_EHV_1_1(SNom = 1e9, UNom = 400e3, UStart = 400e3 * 0.966, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_2_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_1_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_2_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  Components.ControlledGenerator GEN_1_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_2_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 1e+09, PStart = 8e+08, QStart = 1e+08);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 1e+09, PStart = 8e+08, QStart = 1e+08);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_1_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_2_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_1_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_2_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_1_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_2_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_1_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_1_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_1_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_1_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_1(SNom = 1e9, UNom = 63e3, X = 0.2, R = 0.02);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_1(SNom = 1e9, UNom = 63e3, X = 0.2, R = 0.02);
  PowerGrids.Types.ActivePower Pconst = 800e6 / 1;
  PowerGrids.Types.ActivePower Qconst = 100e6 / 1;
  PowerGrids.Types.ActivePower Pvar = Pconst * (1 + (if time < 1 then 0 else -0.1));
  PowerGrids.Types.ActivePower Qvar = Qconst * (1 + (if time < 1 then 0 else -0.1));
equation
  connect(BUS_GEN_EHV_1_1.terminal, TRANSFORMER_GEN_1_1.terminalB);
  connect(BUS_GEN_EHV_2_1.terminal, TRANSFORMER_GEN_2_1.terminalB);
  connect(GEN_1_1.terminal, TRANSFORMER_GEN_1_1.terminalA);
  connect(GEN_2_1.terminal, TRANSFORMER_GEN_2_1.terminalA);
  connect(BUS_LOAD_EHV_1_1.terminal, TRANSFORMER_LOAD_1_1.terminalA);
  connect(BUS_LOAD_EHV_2_1.terminal, TRANSFORMER_LOAD_2_1.terminalA);
  connect(LINE_HV_1_1_1.terminalA, TRANSFORMER_LOAD_1_1.terminalB);
  connect(LOAD_1_1_1.terminal, LINE_HV_1_1_1.terminalB);
  connect(LINE_HV_2_1_1.terminalA, TRANSFORMER_LOAD_2_1.terminalB);
  connect(LOAD_2_1_1.terminal, LINE_HV_2_1_1.terminalB);
  connect(LINE_EHV_H_1_1.terminalA, BUS_GEN_EHV_1_1.terminal);
  connect(LINE_EHV_H_1_1.terminalB, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_H_2_1.terminalA, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_H_2_1.terminalB, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_V_A_1_1.terminalA, BUS_GEN_EHV_1_1.terminal);
  connect(LINE_EHV_V_A_1_1.terminalB, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_V_A_1_2.terminalA, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_V_A_1_2.terminalB, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_V_B_1_1.terminalA, BUS_GEN_EHV_1_1.terminal);
  connect(LINE_EHV_V_B_1_1.terminalB, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_V_B_1_2.terminalA, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_V_B_1_2.terminalB, BUS_GEN_EHV_2_1.terminal);
  annotation(__OpenModelica_commandLineOptions = "-d=execstat --daeMode --tearingMethod=minimalTearing",
             __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_STATS"),
             experiment(StopTime = 15, Tolerance = 1e-4));
end Type1_N_1_M_1;