addpath utils;
addpath plots;

for R = [3];
for modei = {'main'}
  
  mode = modei{1}
  
  load(['res/mlh_', mode, '.mat']);
  load(['res/lsh_', mode, '.mat']);
  load(['res/bre_', mode, '.mat']);
  % load(['res/SH_', mode, '.mat']);
  
  pmlh_std = squeeze(std(pmlh,0,1));
  pmlh_mean = squeeze(mean(pmlh,1));
  plsh_std = squeeze(std(plsh,0,1));
  plsh_mean = squeeze(mean(plsh,1));
  pbre_std = squeeze(std(pbre,0,1));
  pbre_mean = squeeze(mean(pbre,1));
  % psh_std = squeeze(std(psh,0,1));
  % psh_mean = squeeze(mean(psh,1));
  
  rmlh_std = squeeze(std(rmlh,0,1));
  rmlh_mean = squeeze(mean(rmlh,1));
  rlsh_std = squeeze(std(rlsh,0,1));
  rlsh_mean = squeeze(mean(rlsh,1));
  rbre_std = squeeze(std(rbre,0,1));
  rbre_mean = squeeze(mean(rbre,1));
  % rsh_std = squeeze(std(rsh,0,1));
  % rsh_mean = squeeze(mean(rsh,1));
  
  nbs_for_plot = [10 15 20 25 30 35 40 45 50];
  
  % how many models for each method
  % [size(pmlh,1) size(plsh,1) size(pbre,1)]
  
  cap.tit = [mode, ' (precision)'];
  cap.xlabel = ['Code length (bits)'];
  cap.ylabel = ['Precision for Hamm. dist. <= ', num2str(R)];
  p = [pmlh_mean(:,R+1) pbre_mean(:,R+1) plsh_mean(:,R+1)]; % psh_mean(:,R+1)];
  e = [pmlh_std(:,R+1)  pbre_std(:,R+1)  plsh_std(:,R+1) ]; % psh_std(:,R+1) ];
  n_lines = size(p,2);
  fig = make_err_plot(repmat(nbs_for_plot', [1 n_lines]), p(nbs_for_plot, :), e(nbs_for_plot, :), ...
		      {'MLH', 'BRE', 'LSH'}, ...% 'SH'}, ...
		      cap, 'br', 1);
  %  exportfig(fig, ['figs/',mode,'-prec-',num2str(R),'.eps'], 'Color', 'rgb');
  
  cap.tit = [mode, ' (recall)'];
  cap.xlabel = ['Number of bits'];
  cap.ylabel = ['Recall for Hamm. dist. <= ', num2str(R)];
  r =  [rmlh_mean(:,R+1) rbre_mean(:,R+1) rlsh_mean(:,R+1)]; % rsh_mean(:,R+1)];
  er = [rmlh_std(:,R+1)  rbre_std(:,R+1)  rlsh_std(:,R+1) ]; % rsh_std(:,R+1) ];
  n_lines = size(r,2);
  fig = make_err_plot(repmat(nbs_for_plot', [1 n_lines]), r(nbs_for_plot, :), er(nbs_for_plot, :), ...
		      {'MLH', 'BRE', 'LSH'}, ... % 'SH'}, ...
		      cap, 'tr', 1);
  %  exportfig(fig, ['figs/',mode,'-recall-',num2str(R),'.eps'], 'Color', 'rgb');
end
end


