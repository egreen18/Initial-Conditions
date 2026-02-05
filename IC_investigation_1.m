% IC = 0:1:20;
IC = [30,50,100,200];
max_dOpt = 0;
all_dOpt = zeros(1,length(IC));
max_IC = 0;
for i = 1:length(IC)
    results = dOpt_birth_death(IC(i));
    bubblePlot(results);
    all_dOpt(i) = results.dOpt;
    if results.dOpt > max_dOpt
        max_dOpt = results.dOpt;
        max_IC = results.IC;
    end
end

disp(max_IC)
disp(max_dOpt)