within ScalableTestGrids.Models.Type2;
model Type2_tapEv___N_2_M_4
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids(
    initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_1_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_1_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.ReferenceBus BUS_GEN_EHV_2_1(SNom = 1e9, UNom = 400e3, UStart = 400e3 * 0.966, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_2_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_3_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_3_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_4_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_4_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_1_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_1_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_2_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_2_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_3_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_3_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_4_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_4_2(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
  Components.ControlledGenerator GEN_1_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_1_2(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_2_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_2_2(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_3_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_3_2(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_4_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  Components.ControlledGenerator GEN_4_2(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_3(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_4(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_2_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_2_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_2_3(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_2_4(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_3(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_4(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_2_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_2_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_2_3(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_2_4(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_1_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_1_3(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_1_4(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_2_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_2_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_2_3(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_2_4(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_1_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_1_3(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_1_4(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_2_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_2_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_2_3(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_2_4(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 2.5e+08, PStart = 2e+08, QStart = 2.5e+07);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_1_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_1_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_2_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_2_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_3_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_3_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_4_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_4_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_1_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_1_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_2_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_2_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_3_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_3_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_4_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_4_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = 60500, UStop = 59000, Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_1_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_1_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_1_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_2_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_2_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_2_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_3_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_3_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_3_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_4_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_4_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_4_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_1_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_1_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_1_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_1_4(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_2_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_2_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_2_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_2_4(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_3_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_3_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_3_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_3_4(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_1_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_1_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_1_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_1_4(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_2_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_2_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_2_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_2_4(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_3_1(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_3_2(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_3_3(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_3_4(SNom = 1e9, UNom = 400e3, X = 20, R = 2);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_2_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_2_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_2_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_2_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_2_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_2_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_2_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_2_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_1_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_1_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_1_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_1_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_2_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_2_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_2_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_2_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_1_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_1_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_1_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_1_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_2_1(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_2_2(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_2_3(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_2_4(SNom = 1e9, UNom = 63e3, X = 0.05, R = 0.005);
  PowerGrids.Types.ActivePower Pconst = 800e6 / 4;
  PowerGrids.Types.ActivePower Qconst = 100e6 / 4;
  PowerGrids.Types.ActivePower Pvar = Pconst * (1 + (if time < 1 then 0 elseif time < 31 then -0.5*(time-1)/30 else -0.5));
  PowerGrids.Types.ActivePower Qvar = Qconst * (1 + (if time < 1 then 0 elseif time < 31 then -0.5*(time-1)/30 else -0.5));
equation
  connect(BUS_GEN_EHV_1_1.terminal, TRANSFORMER_GEN_1_1.terminalB);
  connect(BUS_GEN_EHV_1_2.terminal, TRANSFORMER_GEN_1_2.terminalB);
  connect(BUS_GEN_EHV_2_1.terminal, TRANSFORMER_GEN_2_1.terminalB);
  connect(BUS_GEN_EHV_2_2.terminal, TRANSFORMER_GEN_2_2.terminalB);
  connect(BUS_GEN_EHV_3_1.terminal, TRANSFORMER_GEN_3_1.terminalB);
  connect(BUS_GEN_EHV_3_2.terminal, TRANSFORMER_GEN_3_2.terminalB);
  connect(BUS_GEN_EHV_4_1.terminal, TRANSFORMER_GEN_4_1.terminalB);
  connect(BUS_GEN_EHV_4_2.terminal, TRANSFORMER_GEN_4_2.terminalB);
  connect(GEN_1_1.terminal, TRANSFORMER_GEN_1_1.terminalA);
  connect(GEN_1_2.terminal, TRANSFORMER_GEN_1_2.terminalA);
  connect(GEN_2_1.terminal, TRANSFORMER_GEN_2_1.terminalA);
  connect(GEN_2_2.terminal, TRANSFORMER_GEN_2_2.terminalA);
  connect(GEN_3_1.terminal, TRANSFORMER_GEN_3_1.terminalA);
  connect(GEN_3_2.terminal, TRANSFORMER_GEN_3_2.terminalA);
  connect(GEN_4_1.terminal, TRANSFORMER_GEN_4_1.terminalA);
  connect(GEN_4_2.terminal, TRANSFORMER_GEN_4_2.terminalA);
  connect(BUS_LOAD_EHV_1_1.terminal, TRANSFORMER_LOAD_1_1.terminalA);
  connect(BUS_LOAD_EHV_1_2.terminal, TRANSFORMER_LOAD_1_2.terminalA);
  connect(BUS_LOAD_EHV_2_1.terminal, TRANSFORMER_LOAD_2_1.terminalA);
  connect(BUS_LOAD_EHV_2_2.terminal, TRANSFORMER_LOAD_2_2.terminalA);
  connect(BUS_LOAD_EHV_3_1.terminal, TRANSFORMER_LOAD_3_1.terminalA);
  connect(BUS_LOAD_EHV_3_2.terminal, TRANSFORMER_LOAD_3_2.terminalA);
  connect(BUS_LOAD_EHV_4_1.terminal, TRANSFORMER_LOAD_4_1.terminalA);
  connect(BUS_LOAD_EHV_4_2.terminal, TRANSFORMER_LOAD_4_2.terminalA);
  connect(LINE_HV_1_1_1.terminalA, TRANSFORMER_LOAD_1_1.terminalB);
  connect(LINE_HV_1_1_1.terminalB, LINE_HV_1_1_2.terminalA);
  connect(LINE_HV_1_1_2.terminalB, LINE_HV_1_1_3.terminalA);
  connect(LINE_HV_1_1_3.terminalB, LINE_HV_1_1_4.terminalA);
  connect(LOAD_1_1_1.terminal, LINE_HV_1_1_1.terminalB);
  connect(LOAD_1_1_2.terminal, LINE_HV_1_1_2.terminalB);
  connect(LOAD_1_1_3.terminal, LINE_HV_1_1_3.terminalB);
  connect(LOAD_1_1_4.terminal, LINE_HV_1_1_4.terminalB);
  connect(LINE_HV_1_2_1.terminalA, TRANSFORMER_LOAD_1_2.terminalB);
  connect(LINE_HV_1_2_1.terminalB, LINE_HV_1_2_2.terminalA);
  connect(LINE_HV_1_2_2.terminalB, LINE_HV_1_2_3.terminalA);
  connect(LINE_HV_1_2_3.terminalB, LINE_HV_1_2_4.terminalA);
  connect(LOAD_1_2_1.terminal, LINE_HV_1_2_1.terminalB);
  connect(LOAD_1_2_2.terminal, LINE_HV_1_2_2.terminalB);
  connect(LOAD_1_2_3.terminal, LINE_HV_1_2_3.terminalB);
  connect(LOAD_1_2_4.terminal, LINE_HV_1_2_4.terminalB);
  connect(LINE_HV_2_1_1.terminalA, TRANSFORMER_LOAD_2_1.terminalB);
  connect(LINE_HV_2_1_1.terminalB, LINE_HV_2_1_2.terminalA);
  connect(LINE_HV_2_1_2.terminalB, LINE_HV_2_1_3.terminalA);
  connect(LINE_HV_2_1_3.terminalB, LINE_HV_2_1_4.terminalA);
  connect(LOAD_2_1_1.terminal, LINE_HV_2_1_1.terminalB);
  connect(LOAD_2_1_2.terminal, LINE_HV_2_1_2.terminalB);
  connect(LOAD_2_1_3.terminal, LINE_HV_2_1_3.terminalB);
  connect(LOAD_2_1_4.terminal, LINE_HV_2_1_4.terminalB);
  connect(LINE_HV_2_2_1.terminalA, TRANSFORMER_LOAD_2_2.terminalB);
  connect(LINE_HV_2_2_1.terminalB, LINE_HV_2_2_2.terminalA);
  connect(LINE_HV_2_2_2.terminalB, LINE_HV_2_2_3.terminalA);
  connect(LINE_HV_2_2_3.terminalB, LINE_HV_2_2_4.terminalA);
  connect(LOAD_2_2_1.terminal, LINE_HV_2_2_1.terminalB);
  connect(LOAD_2_2_2.terminal, LINE_HV_2_2_2.terminalB);
  connect(LOAD_2_2_3.terminal, LINE_HV_2_2_3.terminalB);
  connect(LOAD_2_2_4.terminal, LINE_HV_2_2_4.terminalB);
  connect(LINE_HV_3_1_1.terminalA, TRANSFORMER_LOAD_3_1.terminalB);
  connect(LINE_HV_3_1_1.terminalB, LINE_HV_3_1_2.terminalA);
  connect(LINE_HV_3_1_2.terminalB, LINE_HV_3_1_3.terminalA);
  connect(LINE_HV_3_1_3.terminalB, LINE_HV_3_1_4.terminalA);
  connect(LOAD_3_1_1.terminal, LINE_HV_3_1_1.terminalB);
  connect(LOAD_3_1_2.terminal, LINE_HV_3_1_2.terminalB);
  connect(LOAD_3_1_3.terminal, LINE_HV_3_1_3.terminalB);
  connect(LOAD_3_1_4.terminal, LINE_HV_3_1_4.terminalB);
  connect(LINE_HV_3_2_1.terminalA, TRANSFORMER_LOAD_3_2.terminalB);
  connect(LINE_HV_3_2_1.terminalB, LINE_HV_3_2_2.terminalA);
  connect(LINE_HV_3_2_2.terminalB, LINE_HV_3_2_3.terminalA);
  connect(LINE_HV_3_2_3.terminalB, LINE_HV_3_2_4.terminalA);
  connect(LOAD_3_2_1.terminal, LINE_HV_3_2_1.terminalB);
  connect(LOAD_3_2_2.terminal, LINE_HV_3_2_2.terminalB);
  connect(LOAD_3_2_3.terminal, LINE_HV_3_2_3.terminalB);
  connect(LOAD_3_2_4.terminal, LINE_HV_3_2_4.terminalB);
  connect(LINE_HV_4_1_1.terminalA, TRANSFORMER_LOAD_4_1.terminalB);
  connect(LINE_HV_4_1_1.terminalB, LINE_HV_4_1_2.terminalA);
  connect(LINE_HV_4_1_2.terminalB, LINE_HV_4_1_3.terminalA);
  connect(LINE_HV_4_1_3.terminalB, LINE_HV_4_1_4.terminalA);
  connect(LOAD_4_1_1.terminal, LINE_HV_4_1_1.terminalB);
  connect(LOAD_4_1_2.terminal, LINE_HV_4_1_2.terminalB);
  connect(LOAD_4_1_3.terminal, LINE_HV_4_1_3.terminalB);
  connect(LOAD_4_1_4.terminal, LINE_HV_4_1_4.terminalB);
  connect(LINE_HV_4_2_1.terminalA, TRANSFORMER_LOAD_4_2.terminalB);
  connect(LINE_HV_4_2_1.terminalB, LINE_HV_4_2_2.terminalA);
  connect(LINE_HV_4_2_2.terminalB, LINE_HV_4_2_3.terminalA);
  connect(LINE_HV_4_2_3.terminalB, LINE_HV_4_2_4.terminalA);
  connect(LOAD_4_2_1.terminal, LINE_HV_4_2_1.terminalB);
  connect(LOAD_4_2_2.terminal, LINE_HV_4_2_2.terminalB);
  connect(LOAD_4_2_3.terminal, LINE_HV_4_2_3.terminalB);
  connect(LOAD_4_2_4.terminal, LINE_HV_4_2_4.terminalB);
  connect(LINE_EHV_H_1_1.terminalA, BUS_GEN_EHV_1_1.terminal);
  connect(LINE_EHV_H_1_1.terminalB, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_H_1_2.terminalA, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_H_1_2.terminalB, BUS_GEN_EHV_1_2.terminal);
  connect(LINE_EHV_H_1_3.terminalA, BUS_GEN_EHV_1_2.terminal);
  connect(LINE_EHV_H_1_3.terminalB, BUS_LOAD_EHV_1_2.terminal);
  connect(LINE_EHV_H_2_1.terminalA, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_H_2_1.terminalB, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_H_2_2.terminalA, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_H_2_2.terminalB, BUS_LOAD_EHV_2_2.terminal);
  connect(LINE_EHV_H_2_3.terminalA, BUS_LOAD_EHV_2_2.terminal);
  connect(LINE_EHV_H_2_3.terminalB, BUS_GEN_EHV_2_2.terminal);
  connect(LINE_EHV_H_3_1.terminalA, BUS_GEN_EHV_3_1.terminal);
  connect(LINE_EHV_H_3_1.terminalB, BUS_LOAD_EHV_3_1.terminal);
  connect(LINE_EHV_H_3_2.terminalA, BUS_LOAD_EHV_3_1.terminal);
  connect(LINE_EHV_H_3_2.terminalB, BUS_GEN_EHV_3_2.terminal);
  connect(LINE_EHV_H_3_3.terminalA, BUS_GEN_EHV_3_2.terminal);
  connect(LINE_EHV_H_3_3.terminalB, BUS_LOAD_EHV_3_2.terminal);
  connect(LINE_EHV_H_4_1.terminalA, BUS_LOAD_EHV_4_1.terminal);
  connect(LINE_EHV_H_4_1.terminalB, BUS_GEN_EHV_4_1.terminal);
  connect(LINE_EHV_H_4_2.terminalA, BUS_GEN_EHV_4_1.terminal);
  connect(LINE_EHV_H_4_2.terminalB, BUS_LOAD_EHV_4_2.terminal);
  connect(LINE_EHV_H_4_3.terminalA, BUS_LOAD_EHV_4_2.terminal);
  connect(LINE_EHV_H_4_3.terminalB, BUS_GEN_EHV_4_2.terminal);
  connect(LINE_EHV_V_A_1_1.terminalA, BUS_GEN_EHV_1_1.terminal);
  connect(LINE_EHV_V_A_1_1.terminalB, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_V_A_1_2.terminalA, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_V_A_1_2.terminalB, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_V_A_1_3.terminalA, BUS_GEN_EHV_1_2.terminal);
  connect(LINE_EHV_V_A_1_3.terminalB, BUS_LOAD_EHV_2_2.terminal);
  connect(LINE_EHV_V_A_1_4.terminalA, BUS_LOAD_EHV_1_2.terminal);
  connect(LINE_EHV_V_A_1_4.terminalB, BUS_GEN_EHV_2_2.terminal);
  connect(LINE_EHV_V_A_2_1.terminalA, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_V_A_2_1.terminalB, BUS_GEN_EHV_3_1.terminal);
  connect(LINE_EHV_V_A_2_2.terminalA, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_V_A_2_2.terminalB, BUS_LOAD_EHV_3_1.terminal);
  connect(LINE_EHV_V_A_2_3.terminalA, BUS_LOAD_EHV_2_2.terminal);
  connect(LINE_EHV_V_A_2_3.terminalB, BUS_GEN_EHV_3_2.terminal);
  connect(LINE_EHV_V_A_2_4.terminalA, BUS_GEN_EHV_2_2.terminal);
  connect(LINE_EHV_V_A_2_4.terminalB, BUS_LOAD_EHV_3_2.terminal);
  connect(LINE_EHV_V_A_3_1.terminalA, BUS_GEN_EHV_3_1.terminal);
  connect(LINE_EHV_V_A_3_1.terminalB, BUS_LOAD_EHV_4_1.terminal);
  connect(LINE_EHV_V_A_3_2.terminalA, BUS_LOAD_EHV_3_1.terminal);
  connect(LINE_EHV_V_A_3_2.terminalB, BUS_GEN_EHV_4_1.terminal);
  connect(LINE_EHV_V_A_3_3.terminalA, BUS_GEN_EHV_3_2.terminal);
  connect(LINE_EHV_V_A_3_3.terminalB, BUS_LOAD_EHV_4_2.terminal);
  connect(LINE_EHV_V_A_3_4.terminalA, BUS_LOAD_EHV_3_2.terminal);
  connect(LINE_EHV_V_A_3_4.terminalB, BUS_GEN_EHV_4_2.terminal);
  connect(LINE_EHV_V_B_1_1.terminalA, BUS_GEN_EHV_1_1.terminal);
  connect(LINE_EHV_V_B_1_1.terminalB, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_V_B_1_2.terminalA, BUS_LOAD_EHV_1_1.terminal);
  connect(LINE_EHV_V_B_1_2.terminalB, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_V_B_1_3.terminalA, BUS_GEN_EHV_1_2.terminal);
  connect(LINE_EHV_V_B_1_3.terminalB, BUS_LOAD_EHV_2_2.terminal);
  connect(LINE_EHV_V_B_1_4.terminalA, BUS_LOAD_EHV_1_2.terminal);
  connect(LINE_EHV_V_B_1_4.terminalB, BUS_GEN_EHV_2_2.terminal);
  connect(LINE_EHV_V_B_2_1.terminalA, BUS_LOAD_EHV_2_1.terminal);
  connect(LINE_EHV_V_B_2_1.terminalB, BUS_GEN_EHV_3_1.terminal);
  connect(LINE_EHV_V_B_2_2.terminalA, BUS_GEN_EHV_2_1.terminal);
  connect(LINE_EHV_V_B_2_2.terminalB, BUS_LOAD_EHV_3_1.terminal);
  connect(LINE_EHV_V_B_2_3.terminalA, BUS_LOAD_EHV_2_2.terminal);
  connect(LINE_EHV_V_B_2_3.terminalB, BUS_GEN_EHV_3_2.terminal);
  connect(LINE_EHV_V_B_2_4.terminalA, BUS_GEN_EHV_2_2.terminal);
  connect(LINE_EHV_V_B_2_4.terminalB, BUS_LOAD_EHV_3_2.terminal);
  connect(LINE_EHV_V_B_3_1.terminalA, BUS_GEN_EHV_3_1.terminal);
  connect(LINE_EHV_V_B_3_1.terminalB, BUS_LOAD_EHV_4_1.terminal);
  connect(LINE_EHV_V_B_3_2.terminalA, BUS_LOAD_EHV_3_1.terminal);
  connect(LINE_EHV_V_B_3_2.terminalB, BUS_GEN_EHV_4_1.terminal);
  connect(LINE_EHV_V_B_3_3.terminalA, BUS_GEN_EHV_3_2.terminal);
  connect(LINE_EHV_V_B_3_3.terminalB, BUS_LOAD_EHV_4_2.terminal);
  connect(LINE_EHV_V_B_3_4.terminalA, BUS_LOAD_EHV_3_2.terminal);
  connect(LINE_EHV_V_B_3_4.terminalB, BUS_GEN_EHV_4_2.terminal);
  annotation(__OpenModelica_commandLineOptions = "-d=execstat --daeMode --tearingMethod=minimalTearing",
             __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_STATS"),
             experiment(StopTime = 50, Tolerance = 1e-5));
end Type2_tapEv___N_2_M_4;
