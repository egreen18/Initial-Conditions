function [X]=TmpGPUSSACode(x0,N_run,useGPU)
%This is an automatically generated MATLAB SSA Program.
%The tools used to generate this file were covered at the.
%2016 q-bio Summer School at the Colorado State University.
arguments
   x0
   N_run
   useGPU=CPU
end

Nspec = 1; % Number of species.
Nt = 201; % Number of time points.
X = zeros(Nspec,Nt,N_run); % Initialize matrix of results. 
if strcmp(useGPU,'GPU')
   g = parallel.gpu.RandStream('Philox4x32-10','Seed',0); % Set seed for RNG on GPU.
   parallel.gpu.RandStream.setGlobalStream(g); % Apply RNG seed to GPU.
   x1_0_GPU = x0(1)*gpuArray.ones(1,N_run); % Specific Initial Conditions.
   [x1_1,x1_2,x1_3,x1_4,x1_5,x1_6,x1_7,x1_8,x1_9,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,x1_16,x1_17,x1_18,x1_19,x1_20,x1_21,x1_22,x1_23,x1_24,x1_25,x1_26,x1_27,x1_28,x1_29,x1_30,x1_31,x1_32,x1_33,x1_34,x1_35,x1_36,x1_37,x1_38,x1_39,x1_40,x1_41,x1_42,x1_43,x1_44,x1_45,x1_46,x1_47,x1_48,x1_49,x1_50,x1_51,x1_52,x1_53,x1_54,x1_55,x1_56,x1_57,x1_58,x1_59,x1_60,x1_61,x1_62,x1_63,x1_64,x1_65,x1_66,x1_67,x1_68,x1_69,x1_70,x1_71,x1_72,x1_73,x1_74,x1_75,x1_76,x1_77,x1_78,x1_79,x1_80,x1_81,x1_82,x1_83,x1_84,x1_85,x1_86,x1_87,x1_88,x1_89,x1_90,x1_91,x1_92,x1_93,x1_94,x1_95,x1_96,x1_97,x1_98,x1_99,x1_100,x1_101,x1_102,x1_103,x1_104,x1_105,x1_106,x1_107,x1_108,x1_109,x1_110,x1_111,x1_112,x1_113,x1_114,x1_115,x1_116,x1_117,x1_118,x1_119,x1_120,x1_121,x1_122,x1_123,x1_124,x1_125,x1_126,x1_127,x1_128,x1_129,x1_130,x1_131,x1_132,x1_133,x1_134,x1_135,x1_136,x1_137,x1_138,x1_139,x1_140,x1_141,x1_142,x1_143,x1_144,x1_145,x1_146,x1_147,x1_148,x1_149,x1_150,x1_151,x1_152,x1_153,x1_154,x1_155,x1_156,x1_157,x1_158,x1_159,x1_160,x1_161,x1_162,x1_163,x1_164,x1_165,x1_166,x1_167,x1_168,x1_169,x1_170,x1_171,x1_172,x1_173,x1_174,x1_175,x1_176,x1_177,x1_178,x1_179,x1_180,x1_181,x1_182,x1_183,x1_184,x1_185,x1_186,x1_187,x1_188,x1_189,x1_190,x1_191,x1_192,x1_193,x1_194,x1_195,x1_196,x1_197,x1_198,x1_199,x1_200,x1_201] = arrayfun(@TmpGPUSSACode_SSA,x1_0_GPU);
   X(1,1,:) =gather(x1_1);
   X(1,2,:) =gather(x1_2);
   X(1,3,:) =gather(x1_3);
   X(1,4,:) =gather(x1_4);
   X(1,5,:) =gather(x1_5);
   X(1,6,:) =gather(x1_6);
   X(1,7,:) =gather(x1_7);
   X(1,8,:) =gather(x1_8);
   X(1,9,:) =gather(x1_9);
   X(1,10,:) =gather(x1_10);
   X(1,11,:) =gather(x1_11);
   X(1,12,:) =gather(x1_12);
   X(1,13,:) =gather(x1_13);
   X(1,14,:) =gather(x1_14);
   X(1,15,:) =gather(x1_15);
   X(1,16,:) =gather(x1_16);
   X(1,17,:) =gather(x1_17);
   X(1,18,:) =gather(x1_18);
   X(1,19,:) =gather(x1_19);
   X(1,20,:) =gather(x1_20);
   X(1,21,:) =gather(x1_21);
   X(1,22,:) =gather(x1_22);
   X(1,23,:) =gather(x1_23);
   X(1,24,:) =gather(x1_24);
   X(1,25,:) =gather(x1_25);
   X(1,26,:) =gather(x1_26);
   X(1,27,:) =gather(x1_27);
   X(1,28,:) =gather(x1_28);
   X(1,29,:) =gather(x1_29);
   X(1,30,:) =gather(x1_30);
   X(1,31,:) =gather(x1_31);
   X(1,32,:) =gather(x1_32);
   X(1,33,:) =gather(x1_33);
   X(1,34,:) =gather(x1_34);
   X(1,35,:) =gather(x1_35);
   X(1,36,:) =gather(x1_36);
   X(1,37,:) =gather(x1_37);
   X(1,38,:) =gather(x1_38);
   X(1,39,:) =gather(x1_39);
   X(1,40,:) =gather(x1_40);
   X(1,41,:) =gather(x1_41);
   X(1,42,:) =gather(x1_42);
   X(1,43,:) =gather(x1_43);
   X(1,44,:) =gather(x1_44);
   X(1,45,:) =gather(x1_45);
   X(1,46,:) =gather(x1_46);
   X(1,47,:) =gather(x1_47);
   X(1,48,:) =gather(x1_48);
   X(1,49,:) =gather(x1_49);
   X(1,50,:) =gather(x1_50);
   X(1,51,:) =gather(x1_51);
   X(1,52,:) =gather(x1_52);
   X(1,53,:) =gather(x1_53);
   X(1,54,:) =gather(x1_54);
   X(1,55,:) =gather(x1_55);
   X(1,56,:) =gather(x1_56);
   X(1,57,:) =gather(x1_57);
   X(1,58,:) =gather(x1_58);
   X(1,59,:) =gather(x1_59);
   X(1,60,:) =gather(x1_60);
   X(1,61,:) =gather(x1_61);
   X(1,62,:) =gather(x1_62);
   X(1,63,:) =gather(x1_63);
   X(1,64,:) =gather(x1_64);
   X(1,65,:) =gather(x1_65);
   X(1,66,:) =gather(x1_66);
   X(1,67,:) =gather(x1_67);
   X(1,68,:) =gather(x1_68);
   X(1,69,:) =gather(x1_69);
   X(1,70,:) =gather(x1_70);
   X(1,71,:) =gather(x1_71);
   X(1,72,:) =gather(x1_72);
   X(1,73,:) =gather(x1_73);
   X(1,74,:) =gather(x1_74);
   X(1,75,:) =gather(x1_75);
   X(1,76,:) =gather(x1_76);
   X(1,77,:) =gather(x1_77);
   X(1,78,:) =gather(x1_78);
   X(1,79,:) =gather(x1_79);
   X(1,80,:) =gather(x1_80);
   X(1,81,:) =gather(x1_81);
   X(1,82,:) =gather(x1_82);
   X(1,83,:) =gather(x1_83);
   X(1,84,:) =gather(x1_84);
   X(1,85,:) =gather(x1_85);
   X(1,86,:) =gather(x1_86);
   X(1,87,:) =gather(x1_87);
   X(1,88,:) =gather(x1_88);
   X(1,89,:) =gather(x1_89);
   X(1,90,:) =gather(x1_90);
   X(1,91,:) =gather(x1_91);
   X(1,92,:) =gather(x1_92);
   X(1,93,:) =gather(x1_93);
   X(1,94,:) =gather(x1_94);
   X(1,95,:) =gather(x1_95);
   X(1,96,:) =gather(x1_96);
   X(1,97,:) =gather(x1_97);
   X(1,98,:) =gather(x1_98);
   X(1,99,:) =gather(x1_99);
   X(1,100,:) =gather(x1_100);
   X(1,101,:) =gather(x1_101);
   X(1,102,:) =gather(x1_102);
   X(1,103,:) =gather(x1_103);
   X(1,104,:) =gather(x1_104);
   X(1,105,:) =gather(x1_105);
   X(1,106,:) =gather(x1_106);
   X(1,107,:) =gather(x1_107);
   X(1,108,:) =gather(x1_108);
   X(1,109,:) =gather(x1_109);
   X(1,110,:) =gather(x1_110);
   X(1,111,:) =gather(x1_111);
   X(1,112,:) =gather(x1_112);
   X(1,113,:) =gather(x1_113);
   X(1,114,:) =gather(x1_114);
   X(1,115,:) =gather(x1_115);
   X(1,116,:) =gather(x1_116);
   X(1,117,:) =gather(x1_117);
   X(1,118,:) =gather(x1_118);
   X(1,119,:) =gather(x1_119);
   X(1,120,:) =gather(x1_120);
   X(1,121,:) =gather(x1_121);
   X(1,122,:) =gather(x1_122);
   X(1,123,:) =gather(x1_123);
   X(1,124,:) =gather(x1_124);
   X(1,125,:) =gather(x1_125);
   X(1,126,:) =gather(x1_126);
   X(1,127,:) =gather(x1_127);
   X(1,128,:) =gather(x1_128);
   X(1,129,:) =gather(x1_129);
   X(1,130,:) =gather(x1_130);
   X(1,131,:) =gather(x1_131);
   X(1,132,:) =gather(x1_132);
   X(1,133,:) =gather(x1_133);
   X(1,134,:) =gather(x1_134);
   X(1,135,:) =gather(x1_135);
   X(1,136,:) =gather(x1_136);
   X(1,137,:) =gather(x1_137);
   X(1,138,:) =gather(x1_138);
   X(1,139,:) =gather(x1_139);
   X(1,140,:) =gather(x1_140);
   X(1,141,:) =gather(x1_141);
   X(1,142,:) =gather(x1_142);
   X(1,143,:) =gather(x1_143);
   X(1,144,:) =gather(x1_144);
   X(1,145,:) =gather(x1_145);
   X(1,146,:) =gather(x1_146);
   X(1,147,:) =gather(x1_147);
   X(1,148,:) =gather(x1_148);
   X(1,149,:) =gather(x1_149);
   X(1,150,:) =gather(x1_150);
   X(1,151,:) =gather(x1_151);
   X(1,152,:) =gather(x1_152);
   X(1,153,:) =gather(x1_153);
   X(1,154,:) =gather(x1_154);
   X(1,155,:) =gather(x1_155);
   X(1,156,:) =gather(x1_156);
   X(1,157,:) =gather(x1_157);
   X(1,158,:) =gather(x1_158);
   X(1,159,:) =gather(x1_159);
   X(1,160,:) =gather(x1_160);
   X(1,161,:) =gather(x1_161);
   X(1,162,:) =gather(x1_162);
   X(1,163,:) =gather(x1_163);
   X(1,164,:) =gather(x1_164);
   X(1,165,:) =gather(x1_165);
   X(1,166,:) =gather(x1_166);
   X(1,167,:) =gather(x1_167);
   X(1,168,:) =gather(x1_168);
   X(1,169,:) =gather(x1_169);
   X(1,170,:) =gather(x1_170);
   X(1,171,:) =gather(x1_171);
   X(1,172,:) =gather(x1_172);
   X(1,173,:) =gather(x1_173);
   X(1,174,:) =gather(x1_174);
   X(1,175,:) =gather(x1_175);
   X(1,176,:) =gather(x1_176);
   X(1,177,:) =gather(x1_177);
   X(1,178,:) =gather(x1_178);
   X(1,179,:) =gather(x1_179);
   X(1,180,:) =gather(x1_180);
   X(1,181,:) =gather(x1_181);
   X(1,182,:) =gather(x1_182);
   X(1,183,:) =gather(x1_183);
   X(1,184,:) =gather(x1_184);
   X(1,185,:) =gather(x1_185);
   X(1,186,:) =gather(x1_186);
   X(1,187,:) =gather(x1_187);
   X(1,188,:) =gather(x1_188);
   X(1,189,:) =gather(x1_189);
   X(1,190,:) =gather(x1_190);
   X(1,191,:) =gather(x1_191);
   X(1,192,:) =gather(x1_192);
   X(1,193,:) =gather(x1_193);
   X(1,194,:) =gather(x1_194);
   X(1,195,:) =gather(x1_195);
   X(1,196,:) =gather(x1_196);
   X(1,197,:) =gather(x1_197);
   X(1,198,:) =gather(x1_198);
   X(1,199,:) =gather(x1_199);
   X(1,200,:) =gather(x1_200);
   X(1,201,:) =gather(x1_201);
elseif strcmp(useGPU,'Parallel')
   x1_0 = x0(1); % Specific Initial Conditions.
  parfor i = 1:N_run
    [x] = collectFun(x1_0);
    X(:,:,i) = reshape(x,[Nt,Nspec])';
  end
elseif strcmp(useGPU,'Series')
  for i = 1:N_run
   x1_0 = x0(1); % Specific Initial Conditions.
    [x1_1,x1_2,x1_3,x1_4,x1_5,x1_6,x1_7,x1_8,x1_9,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,x1_16,x1_17,x1_18,x1_19,x1_20,x1_21,x1_22,x1_23,x1_24,x1_25,x1_26,x1_27,x1_28,x1_29,x1_30,x1_31,x1_32,x1_33,x1_34,x1_35,x1_36,x1_37,x1_38,x1_39,x1_40,x1_41,x1_42,x1_43,x1_44,x1_45,x1_46,x1_47,x1_48,x1_49,x1_50,x1_51,x1_52,x1_53,x1_54,x1_55,x1_56,x1_57,x1_58,x1_59,x1_60,x1_61,x1_62,x1_63,x1_64,x1_65,x1_66,x1_67,x1_68,x1_69,x1_70,x1_71,x1_72,x1_73,x1_74,x1_75,x1_76,x1_77,x1_78,x1_79,x1_80,x1_81,x1_82,x1_83,x1_84,x1_85,x1_86,x1_87,x1_88,x1_89,x1_90,x1_91,x1_92,x1_93,x1_94,x1_95,x1_96,x1_97,x1_98,x1_99,x1_100,x1_101,x1_102,x1_103,x1_104,x1_105,x1_106,x1_107,x1_108,x1_109,x1_110,x1_111,x1_112,x1_113,x1_114,x1_115,x1_116,x1_117,x1_118,x1_119,x1_120,x1_121,x1_122,x1_123,x1_124,x1_125,x1_126,x1_127,x1_128,x1_129,x1_130,x1_131,x1_132,x1_133,x1_134,x1_135,x1_136,x1_137,x1_138,x1_139,x1_140,x1_141,x1_142,x1_143,x1_144,x1_145,x1_146,x1_147,x1_148,x1_149,x1_150,x1_151,x1_152,x1_153,x1_154,x1_155,x1_156,x1_157,x1_158,x1_159,x1_160,x1_161,x1_162,x1_163,x1_164,x1_165,x1_166,x1_167,x1_168,x1_169,x1_170,x1_171,x1_172,x1_173,x1_174,x1_175,x1_176,x1_177,x1_178,x1_179,x1_180,x1_181,x1_182,x1_183,x1_184,x1_185,x1_186,x1_187,x1_188,x1_189,x1_190,x1_191,x1_192,x1_193,x1_194,x1_195,x1_196,x1_197,x1_198,x1_199,x1_200,x1_201] = TmpGPUSSACode_SSA(x1_0);
    X(:,:,i) = reshape(  [x1_1,x1_2,x1_3,x1_4,x1_5,x1_6,x1_7,x1_8,x1_9,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,x1_16,x1_17,x1_18,x1_19,x1_20,x1_21,x1_22,x1_23,x1_24,x1_25,x1_26,x1_27,x1_28,x1_29,x1_30,x1_31,x1_32,x1_33,x1_34,x1_35,x1_36,x1_37,x1_38,x1_39,x1_40,x1_41,x1_42,x1_43,x1_44,x1_45,x1_46,x1_47,x1_48,x1_49,x1_50,x1_51,x1_52,x1_53,x1_54,x1_55,x1_56,x1_57,x1_58,x1_59,x1_60,x1_61,x1_62,x1_63,x1_64,x1_65,x1_66,x1_67,x1_68,x1_69,x1_70,x1_71,x1_72,x1_73,x1_74,x1_75,x1_76,x1_77,x1_78,x1_79,x1_80,x1_81,x1_82,x1_83,x1_84,x1_85,x1_86,x1_87,x1_88,x1_89,x1_90,x1_91,x1_92,x1_93,x1_94,x1_95,x1_96,x1_97,x1_98,x1_99,x1_100,x1_101,x1_102,x1_103,x1_104,x1_105,x1_106,x1_107,x1_108,x1_109,x1_110,x1_111,x1_112,x1_113,x1_114,x1_115,x1_116,x1_117,x1_118,x1_119,x1_120,x1_121,x1_122,x1_123,x1_124,x1_125,x1_126,x1_127,x1_128,x1_129,x1_130,x1_131,x1_132,x1_133,x1_134,x1_135,x1_136,x1_137,x1_138,x1_139,x1_140,x1_141,x1_142,x1_143,x1_144,x1_145,x1_146,x1_147,x1_148,x1_149,x1_150,x1_151,x1_152,x1_153,x1_154,x1_155,x1_156,x1_157,x1_158,x1_159,x1_160,x1_161,x1_162,x1_163,x1_164,x1_165,x1_166,x1_167,x1_168,x1_169,x1_170,x1_171,x1_172,x1_173,x1_174,x1_175,x1_176,x1_177,x1_178,x1_179,x1_180,x1_181,x1_182,x1_183,x1_184,x1_185,x1_186,x1_187,x1_188,x1_189,x1_190,x1_191,x1_192,x1_193,x1_194,x1_195,x1_196,x1_197,x1_198,x1_199,x1_200,x1_201],[Nt,Nspec])';
  end
end
end


function [x1_1,x1_2,x1_3,x1_4,x1_5,x1_6,x1_7,x1_8,x1_9,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,x1_16,x1_17,x1_18,x1_19,x1_20,x1_21,x1_22,x1_23,x1_24,x1_25,x1_26,x1_27,x1_28,x1_29,x1_30,x1_31,x1_32,x1_33,x1_34,x1_35,x1_36,x1_37,x1_38,x1_39,x1_40,x1_41,x1_42,x1_43,x1_44,x1_45,x1_46,x1_47,x1_48,x1_49,x1_50,x1_51,x1_52,x1_53,x1_54,x1_55,x1_56,x1_57,x1_58,x1_59,x1_60,x1_61,x1_62,x1_63,x1_64,x1_65,x1_66,x1_67,x1_68,x1_69,x1_70,x1_71,x1_72,x1_73,x1_74,x1_75,x1_76,x1_77,x1_78,x1_79,x1_80,x1_81,x1_82,x1_83,x1_84,x1_85,x1_86,x1_87,x1_88,x1_89,x1_90,x1_91,x1_92,x1_93,x1_94,x1_95,x1_96,x1_97,x1_98,x1_99,x1_100,x1_101,x1_102,x1_103,x1_104,x1_105,x1_106,x1_107,x1_108,x1_109,x1_110,x1_111,x1_112,x1_113,x1_114,x1_115,x1_116,x1_117,x1_118,x1_119,x1_120,x1_121,x1_122,x1_123,x1_124,x1_125,x1_126,x1_127,x1_128,x1_129,x1_130,x1_131,x1_132,x1_133,x1_134,x1_135,x1_136,x1_137,x1_138,x1_139,x1_140,x1_141,x1_142,x1_143,x1_144,x1_145,x1_146,x1_147,x1_148,x1_149,x1_150,x1_151,x1_152,x1_153,x1_154,x1_155,x1_156,x1_157,x1_158,x1_159,x1_160,x1_161,x1_162,x1_163,x1_164,x1_165,x1_166,x1_167,x1_168,x1_169,x1_170,x1_171,x1_172,x1_173,x1_174,x1_175,x1_176,x1_177,x1_178,x1_179,x1_180,x1_181,x1_182,x1_183,x1_184,x1_185,x1_186,x1_187,x1_188,x1_189,x1_190,x1_191,x1_192,x1_193,x1_194,x1_195,x1_196,x1_197,x1_198,x1_199,x1_200,x1_201] = TmpGPUSSACode_SSA(x1)
%First we define the parameters.
k1=1;
k2=0.1;

%Initialize the time.
t=-1;
%Start the SSA.
tstop = -1;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_1=x1;

tstop = 0;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_2=x1;

tstop = 0.20101;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_3=x1;

tstop = 0.40201;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_4=x1;

tstop = 0.60302;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_5=x1;

tstop = 0.80402;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_6=x1;

tstop = 1.005;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_7=x1;

tstop = 1.206;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_8=x1;

tstop = 1.407;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_9=x1;

tstop = 1.608;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_10=x1;

tstop = 1.809;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_11=x1;

tstop = 2.0101;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_12=x1;

tstop = 2.2111;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_13=x1;

tstop = 2.4121;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_14=x1;

tstop = 2.6131;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_15=x1;

tstop = 2.8141;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_16=x1;

tstop = 3.0151;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_17=x1;

tstop = 3.2161;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_18=x1;

tstop = 3.4171;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_19=x1;

tstop = 3.6181;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_20=x1;

tstop = 3.8191;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_21=x1;

tstop = 4.0201;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_22=x1;

tstop = 4.2211;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_23=x1;

tstop = 4.4221;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_24=x1;

tstop = 4.6231;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_25=x1;

tstop = 4.8241;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_26=x1;

tstop = 5.0251;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_27=x1;

tstop = 5.2261;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_28=x1;

tstop = 5.4271;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_29=x1;

tstop = 5.6281;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_30=x1;

tstop = 5.8291;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_31=x1;

tstop = 6.0302;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_32=x1;

tstop = 6.2312;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_33=x1;

tstop = 6.4322;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_34=x1;

tstop = 6.6332;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_35=x1;

tstop = 6.8342;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_36=x1;

tstop = 7.0352;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_37=x1;

tstop = 7.2362;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_38=x1;

tstop = 7.4372;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_39=x1;

tstop = 7.6382;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_40=x1;

tstop = 7.8392;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_41=x1;

tstop = 8.0402;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_42=x1;

tstop = 8.2412;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_43=x1;

tstop = 8.4422;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_44=x1;

tstop = 8.6432;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_45=x1;

tstop = 8.8442;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_46=x1;

tstop = 9.0452;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_47=x1;

tstop = 9.2462;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_48=x1;

tstop = 9.4472;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_49=x1;

tstop = 9.6482;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_50=x1;

tstop = 9.8492;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_51=x1;

tstop = 10.0503;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_52=x1;

tstop = 10.2513;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_53=x1;

tstop = 10.4523;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_54=x1;

tstop = 10.6533;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_55=x1;

tstop = 10.8543;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_56=x1;

tstop = 11.0553;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_57=x1;

tstop = 11.2563;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_58=x1;

tstop = 11.4573;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_59=x1;

tstop = 11.6583;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_60=x1;

tstop = 11.8593;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_61=x1;

tstop = 12.0603;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_62=x1;

tstop = 12.2613;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_63=x1;

tstop = 12.4623;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_64=x1;

tstop = 12.6633;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_65=x1;

tstop = 12.8643;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_66=x1;

tstop = 13.0653;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_67=x1;

tstop = 13.2663;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_68=x1;

tstop = 13.4673;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_69=x1;

tstop = 13.6683;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_70=x1;

tstop = 13.8693;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_71=x1;

tstop = 14.0704;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_72=x1;

tstop = 14.2714;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_73=x1;

tstop = 14.4724;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_74=x1;

tstop = 14.6734;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_75=x1;

tstop = 14.8744;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_76=x1;

tstop = 15.0754;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_77=x1;

tstop = 15.2764;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_78=x1;

tstop = 15.4774;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_79=x1;

tstop = 15.6784;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_80=x1;

tstop = 15.8794;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_81=x1;

tstop = 16.0804;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_82=x1;

tstop = 16.2814;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_83=x1;

tstop = 16.4824;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_84=x1;

tstop = 16.6834;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_85=x1;

tstop = 16.8844;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_86=x1;

tstop = 17.0854;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_87=x1;

tstop = 17.2864;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_88=x1;

tstop = 17.4874;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_89=x1;

tstop = 17.6884;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_90=x1;

tstop = 17.8894;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_91=x1;

tstop = 18.0905;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_92=x1;

tstop = 18.2915;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_93=x1;

tstop = 18.4925;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_94=x1;

tstop = 18.6935;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_95=x1;

tstop = 18.8945;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_96=x1;

tstop = 19.0955;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_97=x1;

tstop = 19.2965;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_98=x1;

tstop = 19.4975;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_99=x1;

tstop = 19.6985;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_100=x1;

tstop = 19.8995;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_101=x1;

tstop = 20.1005;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_102=x1;

tstop = 20.3015;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_103=x1;

tstop = 20.5025;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_104=x1;

tstop = 20.7035;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_105=x1;

tstop = 20.9045;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_106=x1;

tstop = 21.1055;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_107=x1;

tstop = 21.3065;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_108=x1;

tstop = 21.5075;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_109=x1;

tstop = 21.7085;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_110=x1;

tstop = 21.9095;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_111=x1;

tstop = 22.1106;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_112=x1;

tstop = 22.3116;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_113=x1;

tstop = 22.5126;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_114=x1;

tstop = 22.7136;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_115=x1;

tstop = 22.9146;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_116=x1;

tstop = 23.1156;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_117=x1;

tstop = 23.3166;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_118=x1;

tstop = 23.5176;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_119=x1;

tstop = 23.7186;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_120=x1;

tstop = 23.9196;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_121=x1;

tstop = 24.1206;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_122=x1;

tstop = 24.3216;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_123=x1;

tstop = 24.5226;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_124=x1;

tstop = 24.7236;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_125=x1;

tstop = 24.9246;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_126=x1;

tstop = 25.1256;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_127=x1;

tstop = 25.3266;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_128=x1;

tstop = 25.5276;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_129=x1;

tstop = 25.7286;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_130=x1;

tstop = 25.9296;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_131=x1;

tstop = 26.1307;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_132=x1;

tstop = 26.3317;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_133=x1;

tstop = 26.5327;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_134=x1;

tstop = 26.7337;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_135=x1;

tstop = 26.9347;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_136=x1;

tstop = 27.1357;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_137=x1;

tstop = 27.3367;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_138=x1;

tstop = 27.5377;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_139=x1;

tstop = 27.7387;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_140=x1;

tstop = 27.9397;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_141=x1;

tstop = 28.1407;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_142=x1;

tstop = 28.3417;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_143=x1;

tstop = 28.5427;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_144=x1;

tstop = 28.7437;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_145=x1;

tstop = 28.9447;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_146=x1;

tstop = 29.1457;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_147=x1;

tstop = 29.3467;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_148=x1;

tstop = 29.5477;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_149=x1;

tstop = 29.7487;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_150=x1;

tstop = 29.9497;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_151=x1;

tstop = 30.1508;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_152=x1;

tstop = 30.3518;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_153=x1;

tstop = 30.5528;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_154=x1;

tstop = 30.7538;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_155=x1;

tstop = 30.9548;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_156=x1;

tstop = 31.1558;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_157=x1;

tstop = 31.3568;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_158=x1;

tstop = 31.5578;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_159=x1;

tstop = 31.7588;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_160=x1;

tstop = 31.9598;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_161=x1;

tstop = 32.1608;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_162=x1;

tstop = 32.3618;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_163=x1;

tstop = 32.5628;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_164=x1;

tstop = 32.7638;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_165=x1;

tstop = 32.9648;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_166=x1;

tstop = 33.1658;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_167=x1;

tstop = 33.3668;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_168=x1;

tstop = 33.5678;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_169=x1;

tstop = 33.7688;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_170=x1;

tstop = 33.9698;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_171=x1;

tstop = 34.1709;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_172=x1;

tstop = 34.3719;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_173=x1;

tstop = 34.5729;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_174=x1;

tstop = 34.7739;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_175=x1;

tstop = 34.9749;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_176=x1;

tstop = 35.1759;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_177=x1;

tstop = 35.3769;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_178=x1;

tstop = 35.5779;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_179=x1;

tstop = 35.7789;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_180=x1;

tstop = 35.9799;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_181=x1;

tstop = 36.1809;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_182=x1;

tstop = 36.3819;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_183=x1;

tstop = 36.5829;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_184=x1;

tstop = 36.7839;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_185=x1;

tstop = 36.9849;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_186=x1;

tstop = 37.1859;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_187=x1;

tstop = 37.3869;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_188=x1;

tstop = 37.5879;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_189=x1;

tstop = 37.7889;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_190=x1;

tstop = 37.9899;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_191=x1;

tstop = 38.191;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_192=x1;

tstop = 38.392;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_193=x1;

tstop = 38.593;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_194=x1;

tstop = 38.794;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_195=x1;

tstop = 38.995;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_196=x1;

tstop = 39.196;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_197=x1;

tstop = 39.397;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_198=x1;

tstop = 39.598;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_199=x1;

tstop = 39.799;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_200=x1;

tstop = 40;   %Next time to print results.
while t<tstop   %Next time to print results.
  w1=k1;
  w2=k2 * x1;
  w0=0+w1+w2;
  t = t-1/w0*log(rand);
  if t<=tstop
    r2w0=rand*w0;
    if r2w0<w1
      x1=x1+(1);
    elseif r2w0<w1+w2
      x1=x1+(-1);
    end
  end
end
x1_201=x1;

end
function [x] = collectFun(x1)
% This function runs the SSA and gathers the results into a single matrix.
[x1_1,x1_2,x1_3,x1_4,x1_5,x1_6,x1_7,x1_8,x1_9,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,x1_16,x1_17,x1_18,x1_19,x1_20,x1_21,x1_22,x1_23,x1_24,x1_25,x1_26,x1_27,x1_28,x1_29,x1_30,x1_31,x1_32,x1_33,x1_34,x1_35,x1_36,x1_37,x1_38,x1_39,x1_40,x1_41,x1_42,x1_43,x1_44,x1_45,x1_46,x1_47,x1_48,x1_49,x1_50,x1_51,x1_52,x1_53,x1_54,x1_55,x1_56,x1_57,x1_58,x1_59,x1_60,x1_61,x1_62,x1_63,x1_64,x1_65,x1_66,x1_67,x1_68,x1_69,x1_70,x1_71,x1_72,x1_73,x1_74,x1_75,x1_76,x1_77,x1_78,x1_79,x1_80,x1_81,x1_82,x1_83,x1_84,x1_85,x1_86,x1_87,x1_88,x1_89,x1_90,x1_91,x1_92,x1_93,x1_94,x1_95,x1_96,x1_97,x1_98,x1_99,x1_100,x1_101,x1_102,x1_103,x1_104,x1_105,x1_106,x1_107,x1_108,x1_109,x1_110,x1_111,x1_112,x1_113,x1_114,x1_115,x1_116,x1_117,x1_118,x1_119,x1_120,x1_121,x1_122,x1_123,x1_124,x1_125,x1_126,x1_127,x1_128,x1_129,x1_130,x1_131,x1_132,x1_133,x1_134,x1_135,x1_136,x1_137,x1_138,x1_139,x1_140,x1_141,x1_142,x1_143,x1_144,x1_145,x1_146,x1_147,x1_148,x1_149,x1_150,x1_151,x1_152,x1_153,x1_154,x1_155,x1_156,x1_157,x1_158,x1_159,x1_160,x1_161,x1_162,x1_163,x1_164,x1_165,x1_166,x1_167,x1_168,x1_169,x1_170,x1_171,x1_172,x1_173,x1_174,x1_175,x1_176,x1_177,x1_178,x1_179,x1_180,x1_181,x1_182,x1_183,x1_184,x1_185,x1_186,x1_187,x1_188,x1_189,x1_190,x1_191,x1_192,x1_193,x1_194,x1_195,x1_196,x1_197,x1_198,x1_199,x1_200,x1_201] = TmpGPUSSACode_SSA(x1);
x=[x1_1,x1_2,x1_3,x1_4,x1_5,x1_6,x1_7,x1_8,x1_9,x1_10,x1_11,x1_12,x1_13,x1_14,x1_15,x1_16,x1_17,x1_18,x1_19,x1_20,x1_21,x1_22,x1_23,x1_24,x1_25,x1_26,x1_27,x1_28,x1_29,x1_30,x1_31,x1_32,x1_33,x1_34,x1_35,x1_36,x1_37,x1_38,x1_39,x1_40,x1_41,x1_42,x1_43,x1_44,x1_45,x1_46,x1_47,x1_48,x1_49,x1_50,x1_51,x1_52,x1_53,x1_54,x1_55,x1_56,x1_57,x1_58,x1_59,x1_60,x1_61,x1_62,x1_63,x1_64,x1_65,x1_66,x1_67,x1_68,x1_69,x1_70,x1_71,x1_72,x1_73,x1_74,x1_75,x1_76,x1_77,x1_78,x1_79,x1_80,x1_81,x1_82,x1_83,x1_84,x1_85,x1_86,x1_87,x1_88,x1_89,x1_90,x1_91,x1_92,x1_93,x1_94,x1_95,x1_96,x1_97,x1_98,x1_99,x1_100,x1_101,x1_102,x1_103,x1_104,x1_105,x1_106,x1_107,x1_108,x1_109,x1_110,x1_111,x1_112,x1_113,x1_114,x1_115,x1_116,x1_117,x1_118,x1_119,x1_120,x1_121,x1_122,x1_123,x1_124,x1_125,x1_126,x1_127,x1_128,x1_129,x1_130,x1_131,x1_132,x1_133,x1_134,x1_135,x1_136,x1_137,x1_138,x1_139,x1_140,x1_141,x1_142,x1_143,x1_144,x1_145,x1_146,x1_147,x1_148,x1_149,x1_150,x1_151,x1_152,x1_153,x1_154,x1_155,x1_156,x1_157,x1_158,x1_159,x1_160,x1_161,x1_162,x1_163,x1_164,x1_165,x1_166,x1_167,x1_168,x1_169,x1_170,x1_171,x1_172,x1_173,x1_174,x1_175,x1_176,x1_177,x1_178,x1_179,x1_180,x1_181,x1_182,x1_183,x1_184,x1_185,x1_186,x1_187,x1_188,x1_189,x1_190,x1_191,x1_192,x1_193,x1_194,x1_195,x1_196,x1_197,x1_198,x1_199,x1_200,x1_201];
end
