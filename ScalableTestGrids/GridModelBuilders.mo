within ScalableTestGrids;

package GridModelBuilders "Run these models to build the models contained in the Models package"
  extends Modelica.Icons.Package;
  
  model Type0ModelBuilder_N_1_M_1 "Builds Type0 grid with N = 1, M = 1"
    extends Modelica.Icons.Example;
    parameter Integer N = 1 "Number of basic grid cells";
    parameter Integer M = 1 "Number of HV lines connected to each EHV_LOAD node";
    String f = Modelica.Utilities.Files.loadResource("modelica://ScalableTestGrids/Models/Type0/Type0_N_" + String(N) + "_M_" + String(M) + ".mo");
    function print = Modelica.Utilities.Streams.print;
    parameter String node[2] = {"GEN","LOAD"};
  algorithm
    when initial() then
      Modelica.Utilities.Files.remove(f);
      print("within ScalableTestGrids.Models.Type0;", f);
      print("model Type0_N_" + String(N) + "_M_" + String(M), f);
      print("  extends Modelica.Icons.Example;", f);
      print("  inner PowerGrids.Electrical.System systemPowerGrids(", f);
      print("    initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow);", f);
      for i in 1:2 * N loop
        for j in 1:N loop
          if i == N and j == div(N + 1, 2) then
            print("  PowerGrids.Electrical.PowerFlow.SlackBus BUS_GEN_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, U = 400e3 * 0.966, portVariablesPhases = true);", f);
          else
            print("  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);", f);
          end if;
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.PowerFlow.PVBus GEN_" + String(i) + "_" + String(j) + "(P = " + String(-800e6) + ", UNom = 21e3, SNom = 1e9);", f);
        end for;
      end for;
      for i in 1:N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.PowerFlow.PQBus LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + "(P = " + String(800e6/M) + ", Q = " + String(100e6/M) + ", UNom = 63e3, SNom = " + String(1e9 / M) + ");", f);
          end for;
        end for;
      end for;
      for i in N + 1:2 * N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.PowerFlow.PQBus LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + "(P = " + String(800e6/M) + ", Q = " + String(100e6/M) + ", UNom = 63e3, SNom = " + String(1e9 / M) + ");", f);
          end for;
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:2 * N - 1 loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2 * N - 1 loop
        for j in 1:2 * N loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2 * N - 1 loop
        for j in 1:2 * N loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + "(SNom = 1e9, UNom = 63e3, X = " + String(0.2 / M) + ", R = " + String(0.02 / M) + ");", f);
          end for;
        end for;
      end for;
      print("  PowerGrids.Types.ActivePower Pconst = 800e6 / "+String(M)+";", f);
      print("  PowerGrids.Types.ActivePower Qconst = 100e6 / "+String(M)+";", f);
      print("equation", f);
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(BUS_GEN_EHV_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_GEN_" + String(i) + "_" + String(j) + ".terminalB);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(GEN_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_GEN_" + String(i) + "_" + String(j) + ".terminalA);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(BUS_LOAD_EHV_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + ".terminalA);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(LINE_HV_" + String(i) + "_" + String(j) + "_1.terminalA, TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + ".terminalB);", f);
          for k in 1:M - 1 loop
            print("  connect(LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminalB, LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k + 1) + ".terminalA);", f);
          end for;
          for k in 1:M loop
            print("  connect(LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminal, LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminalB);", f);
          end for;
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:2*N-1 loop
          print("  connect(LINE_EHV_H_" + String(i) + "_" + String(j) + ".terminalA, BUS_"+ node[mod(i+j,2)+1]   + "_EHV_" + String(i) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
          print("  connect(LINE_EHV_H_" + String(i) + "_" + String(j) + ".terminalB, BUS_"+ node[mod(i+j+1,2)+1] + "_EHV_" + String(i) + "_" + String(div(j,2)+1) + ".terminal);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
            print("  connect(LINE_EHV_V_A_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i+j,2)+1]   + "_EHV_" + String(i) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
            print("  connect(LINE_EHV_V_A_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i+j+1,2)+1] + "_EHV_" + String(i+1) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
            print("  connect(LINE_EHV_V_B_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i+j,2)+1]   + "_EHV_" + String(i) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
            print("  connect(LINE_EHV_V_B_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i+j+1,2)+1] + "_EHV_" + String(i+1) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
        end for;
      end for;
      print("  annotation(__OpenModelica_commandLineOptions = \"-d=execstat --tearingMethod=minimalTearing\",", f);
      print("             __OpenModelica_simulationFlags(lv=\"LOG_STATS\"),", f);
      print("             experiment(StopTime = 1, Interval = 1));", f);
      print("end Type0_N_" + String(N) + "_M_" + String(M) + ";", f);
    end when;
  end Type0ModelBuilder_N_1_M_1;

  model Type0ModelBuilder_N_2_M_2
    extends ScalableTestGrids.GridModelBuilders.Type0ModelBuilder_N_1_M_1(N = 2, M = 2);
  end Type0ModelBuilder_N_2_M_2;

  model Type1ModelBuilder_N_1_M_1 "Builds Type1 grid with N = 1, M = 1"
    extends Modelica.Icons.Example;
    parameter Integer N = 1 "Number of basic grid cells";
    parameter Integer M = 1 "Number of HV lines connected to each EHV_LOAD node";
    String f = Modelica.Utilities.Files.loadResource("modelica://ScalableTestGrids/Models/Type1/Type1_N_" + String(N) + "_M_" + String(M) + ".mo");
    function print = Modelica.Utilities.Streams.print;
    parameter String node[2] = {"GEN","LOAD"};
  algorithm
    when initial() then
      Modelica.Utilities.Files.remove(f);
      print("within ScalableTestGrids.Models.Type1;", f);
      print("model Type1_N_" + String(N) + "_M_" + String(M), f);
      print("  extends Modelica.Icons.Example;", f);
      print("  inner PowerGrids.Electrical.System systemPowerGrids(", f);
      print("    initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow);", f);
      for i in 1:2 * N loop
        for j in 1:N loop
          if i == N and j == div(N + 1, 2) then
            print("  PowerGrids.Electrical.Buses.ReferenceBus BUS_GEN_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, UStart = 400e3 * 0.966, portVariablesPhases = true);", f);
          else
            print("  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);", f);
          end if;
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  Components.ControlledGenerator GEN_" + String(i) + "_" + String(j) + "(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));", f);
        end for;
      end for;
      for i in 1:N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + "(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = " + String(1e9 / M) + ", PStart = " + String(800e6 / M) + ", QStart = " + String(100e6 / M) + ");", f);
          end for;
        end for;
      end for;
      for i in N + 1:2 * N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + "(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = " + String(1e9 / M) + ", PStart = " + String(800e6 / M) + ", QStart = " + String(100e6 / M) + ");", f);
          end for;
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:2 * N - 1 loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2 * N - 1 loop
        for j in 1:2 * N loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2 * N - 1 loop
        for j in 1:2 * N loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + "(SNom = 1e9, UNom = 63e3, X = " + String(0.2 / M) + ", R = " + String(0.02 / M) + ");", f);
          end for;
        end for;
      end for;
      print("  PowerGrids.Types.ActivePower Pconst = 800e6 / "+String(M)+";", f);
      print("  PowerGrids.Types.ActivePower Qconst = 100e6 / "+String(M)+";", f);
      print("  PowerGrids.Types.ActivePower Pvar = Pconst * (1 + (if time < 1 then 0 else -0.1));", f);
      print("  PowerGrids.Types.ActivePower Qvar = Qconst * (1 + (if time < 1 then 0 else -0.1));", f);
      print("equation", f);
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(BUS_GEN_EHV_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_GEN_" + String(i) + "_" + String(j) + ".terminalB);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(GEN_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_GEN_" + String(i) + "_" + String(j) + ".terminalA);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(BUS_LOAD_EHV_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + ".terminalA);", f);
        end for;
      end for;
      for i in 1:2 * N loop
        for j in 1:N loop
          print("  connect(LINE_HV_" + String(i) + "_" + String(j) + "_1.terminalA, TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + ".terminalB);", f);
          for k in 1:M - 1 loop
            print("  connect(LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminalB, LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k + 1) + ".terminalA);", f);
          end for;
          for k in 1:M loop
            print("  connect(LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminal, LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminalB);", f);
          end for;
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:2*N-1 loop
          print("  connect(LINE_EHV_H_" + String(i) + "_" + String(j) + ".terminalA, BUS_"+ node[mod(i+j,2)+1]   + "_EHV_" + String(i) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
          print("  connect(LINE_EHV_H_" + String(i) + "_" + String(j) + ".terminalB, BUS_"+ node[mod(i+j+1,2)+1] + "_EHV_" + String(i) + "_" + String(div(j,2)+1) + ".terminal);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
            print("  connect(LINE_EHV_V_A_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i+j,2)+1]   + "_EHV_" + String(i) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
            print("  connect(LINE_EHV_V_A_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i+j+1,2)+1] + "_EHV_" + String(i+1) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
            print("  connect(LINE_EHV_V_B_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i+j,2)+1]   + "_EHV_" + String(i) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
            print("  connect(LINE_EHV_V_B_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i+j+1,2)+1] + "_EHV_" + String(i+1) + "_" + String(div(j-1,2)+1) + ".terminal);", f);
        end for;
      end for;
      print("  annotation(__OpenModelica_commandLineOptions = \"-d=execstat --daeMode --tearingMethod=minimalTearing\",", f);
      print("             __OpenModelica_simulationFlags(nls=\"kinsol\", lv=\"LOG_STATS\"),", f);
      print("             experiment(StopTime = 15, Tolerance = 1e-4));", f);
      print("end Type1_N_" + String(N) + "_M_" + String(M) + ";", f);
    end when;
  end Type1ModelBuilder_N_1_M_1;

  model Type1ModelBuilder_N_1_M_2 "Builds Type1 grid with N = 1, M = 2"
    extends Type1ModelBuilder_N_1_M_1(N = 1, M = 2);
  end Type1ModelBuilder_N_1_M_2;

  model Type1ModelBuilder_N_2_M_2 "Builds Type1 grid with N = 2, M = 2"
    extends Type1ModelBuilder_N_1_M_1(N = 2, M = 2);
  end Type1ModelBuilder_N_2_M_2;

  model Type1ModelBuilder_N_2_M_4 "Builds Type1 grid with N = 2, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 2, M = 4);
  end Type1ModelBuilder_N_2_M_4;
  
  model Type1ModelBuilder_N_3_M_4 "Builds Type1 grid with N = 3, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 3, M = 4);
  end Type1ModelBuilder_N_3_M_4;
  
  model Type1ModelBuilder_N_4_M_4 "Builds Type1 grid with N = 4, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 4, M = 4);
  end Type1ModelBuilder_N_4_M_4;
  
  model Type1ModelBuilder_N_6_M_4 "Builds Type1 grid with N = 6, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 6, M = 4);
  end Type1ModelBuilder_N_6_M_4;
  
  model Type1ModelBuilder_N_8_M_4 "Builds Type1 grid with N = 8, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 8, M = 4);
  end Type1ModelBuilder_N_8_M_4;
  
  model Type1ModelBuilder_N_11_M_4 "Builds Type1 grid with N = 11, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 11, M = 4);
  end Type1ModelBuilder_N_11_M_4;
  
  model Type1ModelBuilder_N_16_M_4 "Builds Type1 grid with N = 16, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 16, M = 4);
  end Type1ModelBuilder_N_16_M_4;
  
  model Type1ModelBuilder_N_23_M_4 "Builds Type1 grid with N = 23, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 23, M = 4);
  end Type1ModelBuilder_N_23_M_4;
  
  model Type1ModelBuilder_N_32_M_4 "Builds Type1 grid with N = 32, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N =32, M = 4);
  end Type1ModelBuilder_N_32_M_4;
  
  model Type1ModelBuilder_N_45_M_4 "Builds Type1 grid with N = 45, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 45, M = 4);
  end Type1ModelBuilder_N_45_M_4;
  
  model Type1ModelBuilder_N_64_M_4 "Builds Type1 grid with N = 64, M = 4"
    extends Type1ModelBuilder_N_1_M_1(N = 64, M = 4);
  end Type1ModelBuilder_N_64_M_4;

  model Type1Sample_N_1_M_2 "Manually built sample model for N = 1, M = 2, compare with automatically built one"
    extends Modelica.Icons.Example;
    inner PowerGrids.Electrical.System systemPowerGrids(
      initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow);
    PowerGrids.Electrical.Buses.ReferenceBus BUS_GEN_EHV_1_1(SNom = 1e9, UNom = 400e3, UStart = 400e3 * 0.966, portVariablesPhases = true);
    PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_2_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
    PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_1_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
    PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_2_1(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);
    Components.ControlledGenerator GEN_1_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
    Components.ControlledGenerator GEN_2_1(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
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
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Types.ActivePower Pconst = 800e6 / 2;
    PowerGrids.Types.ActivePower Qconst = 100e6 / 2;
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
    connect(LINE_HV_1_1_1.terminalB, LINE_HV_1_1_2.terminalA);
    connect(LOAD_1_1_1.terminal, LINE_HV_1_1_1.terminalB);
    connect(LOAD_1_1_2.terminal, LINE_HV_1_1_2.terminalB);
    connect(LINE_HV_2_1_1.terminalA, TRANSFORMER_LOAD_2_1.terminalB);
    connect(LINE_HV_2_1_1.terminalB, LINE_HV_2_1_2.terminalA);
    connect(LOAD_2_1_1.terminal, LINE_HV_2_1_1.terminalB);
    connect(LOAD_2_1_2.terminal, LINE_HV_2_1_2.terminalB);
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
  end Type1Sample_N_1_M_2;

  model Type1Sample_N_2_M_2 "Manually built sample model for N = 1, M = 2, compare with automatically built one"
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
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_1_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_2_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_1_2_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_1_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_2_1(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_2_2_2(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_1_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_2_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_3_2_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_1_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_1_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_2_1(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_4_2_2(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = 5e+08, PStart = 4e+08, QStart = 5e+07);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_1_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_1_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_2_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_2_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_3_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_3_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_4_1(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_4_2(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_1_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_1_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_2_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_2_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_3_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_3_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_4_1(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
    PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_4_2(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63 / 400, X = 0.3, R = 0.003, portVariablesPhases = true);
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
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_1_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_2_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_1_2_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_1_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_2_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_2_2_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_1_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_1_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_2_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_3_2_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_1_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_1_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_2_1(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_4_2_2(SNom = 1e9, UNom = 63e3, X = 0.1, R = 0.01);
    PowerGrids.Types.ActivePower Pconst = 800e6 / 2;
    PowerGrids.Types.ActivePower Qconst = 100e6 / 2;
    PowerGrids.Types.ActivePower Pvar = Pconst * (1 + (if time < 1 then 0 else -0.1));
    PowerGrids.Types.ActivePower Qvar = Qconst * (1 + (if time < 1 then 0 else -0.1));
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
    connect(LOAD_1_1_1.terminal, LINE_HV_1_1_1.terminalB);
    connect(LOAD_1_1_2.terminal, LINE_HV_1_1_2.terminalB);
    connect(LINE_HV_1_2_1.terminalA, TRANSFORMER_LOAD_1_2.terminalB);
    connect(LINE_HV_1_2_1.terminalB, LINE_HV_1_2_2.terminalA);
    connect(LOAD_1_2_1.terminal, LINE_HV_1_2_1.terminalB);
    connect(LOAD_1_2_2.terminal, LINE_HV_1_2_2.terminalB);
    connect(LINE_HV_2_1_1.terminalA, TRANSFORMER_LOAD_2_1.terminalB);
    connect(LINE_HV_2_1_1.terminalB, LINE_HV_2_1_2.terminalA);
    connect(LOAD_2_1_1.terminal, LINE_HV_2_1_1.terminalB);
    connect(LOAD_2_1_2.terminal, LINE_HV_2_1_2.terminalB);
    connect(LINE_HV_2_2_1.terminalA, TRANSFORMER_LOAD_2_2.terminalB);
    connect(LINE_HV_2_2_1.terminalB, LINE_HV_2_2_2.terminalA);
    connect(LOAD_2_2_1.terminal, LINE_HV_2_2_1.terminalB);
    connect(LOAD_2_2_2.terminal, LINE_HV_2_2_2.terminalB);
    connect(LINE_HV_3_1_1.terminalA, TRANSFORMER_LOAD_3_1.terminalB);
    connect(LINE_HV_3_1_1.terminalB, LINE_HV_3_1_2.terminalA);
    connect(LOAD_3_1_1.terminal, LINE_HV_3_1_1.terminalB);
    connect(LOAD_3_1_2.terminal, LINE_HV_3_1_2.terminalB);
    connect(LINE_HV_3_2_1.terminalA, TRANSFORMER_LOAD_3_2.terminalB);
    connect(LINE_HV_3_2_1.terminalB, LINE_HV_3_2_2.terminalA);
    connect(LOAD_3_2_1.terminal, LINE_HV_3_2_1.terminalB);
    connect(LOAD_3_2_2.terminal, LINE_HV_3_2_2.terminalB);
    connect(LINE_HV_4_1_1.terminalA, TRANSFORMER_LOAD_4_1.terminalB);
    connect(LINE_HV_4_1_1.terminalB, LINE_HV_4_1_2.terminalA);
    connect(LOAD_4_1_1.terminal, LINE_HV_4_1_1.terminalB);
    connect(LOAD_4_1_2.terminal, LINE_HV_4_1_2.terminalB);
    connect(LINE_HV_4_2_1.terminalA, TRANSFORMER_LOAD_4_2.terminalB);
    connect(LINE_HV_4_2_1.terminalB, LINE_HV_4_2_2.terminalA);
    connect(LOAD_4_2_1.terminal, LINE_HV_4_2_1.terminalB);
    connect(LOAD_4_2_2.terminal, LINE_HV_4_2_2.terminalB);
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
               experiment(StopTime = 15, Tolerance = 1e-4));
  end Type1Sample_N_2_M_2;
  
  model Type2ModelBuilder_N_1_M_1 "Builds Type2 grid with N = 1, M = 1, tap changers optional"
  extends Modelica.Icons.Example;
    parameter Integer N = 2 "Number of basic grid cells";
    parameter Integer M = 2 "Number of HV lines connected to each EHV_LOAD node";
    parameter Boolean useTap = true "= true to use transformers with tap changers";
    parameter Boolean noEv = false "= true if model should not generate events";
    parameter Real UMax = 60e3 "Max HV voltage for tap changers";
    parameter Real UStop = 59e3 "Stop HV voltage for tap changers";
    String f = Modelica.Utilities.Files.loadResource("modelica://ScalableTestGrids/Models/Type2/Type2_" + (if not useTap then "noTap__" elseif noEv then "tapNoEv" else "tapEv__") + "_N_" + String(N) + "_M_" + String(M) + ".mo");
    function print = Modelica.Utilities.Streams.print;
    parameter String node[2] = {"GEN", "LOAD"};
  algorithm
    when initial() then
      Modelica.Utilities.Files.remove(f);
      print("within ScalableTestGrids.Models.Type2;", f);
      print("model Type2_" + (if not useTap then "noTap__" elseif noEv then "tapNoEv" else "tapEv__")+"_N_" + String(N) + "_M_" + String(M), f);
      print("  extends Modelica.Icons.Example;", f);
      print("  inner PowerGrids.Electrical.System systemPowerGrids(", f);
      print("    initOpt = PowerGrids.Types.Choices.InitializationOption.globalSteadyStateFixedPowerFlow);", f);
      for i in 1:2*N loop
        for j in 1:N loop
          if i == N and j == div(N + 1, 2) then
            print("  PowerGrids.Electrical.Buses.ReferenceBus BUS_GEN_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, UStart = 400e3 * 0.966, portVariablesPhases = true);", f);
          else
            print("  PowerGrids.Electrical.Buses.Bus BUS_GEN_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);", f);
          end if;
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Buses.Bus BUS_LOAD_EHV_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          print("  Components.ControlledGenerator GEN_" + String(i) + "_" + String(j) + "(GEN(SNom = 1e9, PStart = -806e6, QStart = -300e6));", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          for k in 1:M loop
            if i == N then
              print("  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + "(PRef = Pvar, QRef = Qvar, UNom = 63e3, SNom = " + String(1e9/M) + ", PStart = " + String(800e6/M) + ", QStart = " + String(100e6/M) + ");", f);
            else
              print("  PowerGrids.Electrical.Loads.LoadPQVoltageDependence LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + "(PRef = Pconst, QRef = Qconst, UNom = 63e3, SNom = " + String(1e9/M) + ", PStart = " + String(800e6/M) + ", QStart = " + String(100e6/M) + ");", f);
            end if;
          end for;
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          print("  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_GEN_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 21e3, UNomB = 400e3, rFixed = 400 / 21, X = 20, R = 0.2, PStartA = 800e6, QStartA = 300e6, PStartB = -800e6, QStartB = -200e6, portVariablesPhases = true);", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          if useTap then 
            print("  PowerGrids.Electrical.Branches.TransformerWithTapChangerMax TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, K = 63/400*{0.96, 0.97, 0.98, 0.99, 1.00}, UMax = " + String(UMax) + ", UStop = " + String(UStop) + ", Ntap = 5, t1st = 1, tNext = 1, tapStart = 5, X = 0.3, R = 0.003, portVariablesPhases = true);", f);
          else
            print("  PowerGrids.Electrical.Branches.TransformerFixedRatio TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNomA = 400e3, UNomB = 63e3, rFixed = 63/400, X = 0.3, R = 0.003, portVariablesPhases = true);", f);        
          end if;
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:2*N - 1 loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_H_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_A_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
          print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_EHV_V_B_" + String(i) + "_" + String(j) + "(SNom = 1e9, UNom = 400e3, X = 20, R = 2);", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          for k in 1:M loop
            print("  PowerGrids.Electrical.Branches.LineConstantImpedance LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + "(SNom = 1e9, UNom = 63e3, X = " + String(0.2/M) + ", R = " + String(0.02/M) + ");", f);
          end for;
        end for;
      end for;
      print("  PowerGrids.Types.ActivePower Pconst = 800e6 / " + String(M) + ";", f);
      print("  PowerGrids.Types.ActivePower Qconst = 100e6 / " + String(M) + ";", f);
      print("  PowerGrids.Types.ActivePower Pvar = Pconst * (1 + (if time < 1 then 0 elseif time < 31 then -0.5*(time-1)/30 else -0.5));", f);
      print("  PowerGrids.Types.ActivePower Qvar = Qconst * (1 + (if time < 1 then 0 elseif time < 31 then -0.5*(time-1)/30 else -0.5));", f);
      print("equation", f);
      for i in 1:2*N loop
        for j in 1:N loop
          print("  connect(BUS_GEN_EHV_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_GEN_" + String(i) + "_" + String(j) + ".terminalB);", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          print("  connect(GEN_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_GEN_" + String(i) + "_" + String(j) + ".terminalA);", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          print("  connect(BUS_LOAD_EHV_" + String(i) + "_" + String(j) + ".terminal, TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + ".terminalA);", f);
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:N loop
          print("  connect(LINE_HV_" + String(i) + "_" + String(j) + "_1.terminalA, TRANSFORMER_LOAD_" + String(i) + "_" + String(j) + ".terminalB);", f);
          for k in 1:M - 1 loop
            print("  connect(LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminalB, LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k + 1) + ".terminalA);", f);
          end for;
          for k in 1:M loop
            print("  connect(LOAD_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminal, LINE_HV_" + String(i) + "_" + String(j) + "_" + String(k) + ".terminalB);", f);
          end for;
        end for;
      end for;
      for i in 1:2*N loop
        for j in 1:2*N - 1 loop
          print("  connect(LINE_EHV_H_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i + j, 2) + 1] + "_EHV_" + String(i) + "_" + String(div(j - 1, 2) + 1) + ".terminal);", f);
          print("  connect(LINE_EHV_H_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i + j + 1, 2) + 1] + "_EHV_" + String(i) + "_" + String(div(j, 2) + 1) + ".terminal);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
          print("  connect(LINE_EHV_V_A_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i + j, 2) + 1] + "_EHV_" + String(i) + "_" + String(div(j - 1, 2) + 1) + ".terminal);", f);
          print("  connect(LINE_EHV_V_A_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i + j + 1, 2) + 1] + "_EHV_" + String(i + 1) + "_" + String(div(j - 1, 2) + 1) + ".terminal);", f);
        end for;
      end for;
      for i in 1:2*N - 1 loop
        for j in 1:2*N loop
          print("  connect(LINE_EHV_V_B_" + String(i) + "_" + String(j) + ".terminalA, BUS_" + node[mod(i + j, 2) + 1] + "_EHV_" + String(i) + "_" + String(div(j - 1, 2) + 1) + ".terminal);", f);
          print("  connect(LINE_EHV_V_B_" + String(i) + "_" + String(j) + ".terminalB, BUS_" + node[mod(i + j + 1, 2) + 1] + "_EHV_" + String(i + 1) + "_" + String(div(j - 1, 2) + 1) + ".terminal);", f);
        end for;
      end for;
      print("  annotation(__OpenModelica_commandLineOptions = \"-d=execstat --daeMode --tearingMethod=minimalTearing\",", f);
      print("             __OpenModelica_simulationFlags(nls=\"kinsol\", lv=\"LOG_STATS\"),", f);
      print("             experiment(StopTime = 50, Tolerance = 1e-5));", f);
      print("end Type2_" + (if not useTap then "noTap__" elseif noEv then "tapNoEv" else "tapEv__")+"_N_" + String(N) + "_M_" + String(M) + ";", f);
    end when;
  end Type2ModelBuilder_N_1_M_1;

  model Type2ModelBuilder_noTap_N_2_M_2
    extends Type2ModelBuilder_N_1_M_1(useTap = false, N = 2, M = 2);
  end Type2ModelBuilder_noTap_N_2_M_2;
  
  model Type2ModelBuilder_tapNoEv_N_2_M_2
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = true, UMax = 70e3, UStop = 40e3, N = 2, M = 2);
  end Type2ModelBuilder_tapNoEv_N_2_M_2;
  
  model Type2ModelBuilder_tapEv_N_2_M_2
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = false, UMax = 60.5e3, UStop = 59e3, N = 2, M = 2);
  end Type2ModelBuilder_tapEv_N_2_M_2;
  
  model Type2ModelBuilder_noTap_N_2_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = false, N = 2, M = 4);
  end Type2ModelBuilder_noTap_N_2_M_4;
  
  model Type2ModelBuilder_tapNoEv_N_2_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = true, UMax = 70e3, UStop = 40e3, N = 2, M = 4);
  end Type2ModelBuilder_tapNoEv_N_2_M_4;
  
  model Type2ModelBuilder_tapEv_N_2_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = false, UMax = 60.5e3, UStop = 59e3, N = 2, M = 4);
  end Type2ModelBuilder_tapEv_N_2_M_4;
  
  model Type2ModelBuilder_noTap_N_3_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = false, N = 3, M = 4);
  end Type2ModelBuilder_noTap_N_3_M_4;
  
  model Type2ModelBuilder_tapNoEv_N_3_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = true, UMax = 70e3, UStop = 40e3, N = 3, M = 4);
  end Type2ModelBuilder_tapNoEv_N_3_M_4;

  model Type2ModelBuilder_tapEv_N_3_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = false, UMax = 60.5e3, UStop = 59e3, N = 3, M = 4);
  end Type2ModelBuilder_tapEv_N_3_M_4;
  
  model Type2ModelBuilder_noTap_N_4_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = false, N = 4, M = 4);
  end Type2ModelBuilder_noTap_N_4_M_4;
  
  model Type2ModelBuilder_tapNoEv_N_4_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = true, UMax = 70e3, UStop = 40e3, N = 4, M = 4);
  end Type2ModelBuilder_tapNoEv_N_4_M_4;

  model Type2ModelBuilder_tapEv_N_4_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = false, UMax = 60.5e3, UStop = 59e3, N = 4, M = 4);
  end Type2ModelBuilder_tapEv_N_4_M_4;
  
  model Type2ModelBuilder_noTap_N_6_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = false, N = 6, M = 4);
  end Type2ModelBuilder_noTap_N_6_M_4;
  
  model Type2ModelBuilder_tapNoEv_N_6_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = true, UMax = 70e3, UStop = 40e3, N = 6, M = 4);
  end Type2ModelBuilder_tapNoEv_N_6_M_4;

  model Type2ModelBuilder_tapEv_N_6_M_4
    extends Type2ModelBuilder_N_1_M_1(useTap = true, noEv = false, UMax = 60.5e3, UStop = 59e3, N = 6, M = 4);
  end Type2ModelBuilder_tapEv_N_6_M_4;
  
end GridModelBuilders;
