library(ggplot2)
library(tidyr)
library(plyr)

subj = 'S5'

study_path = '/Volumes/MAXTOR/source_stim'
results_fname = file.path(study_path, subj, 'results', paste(subj, '_results.csv', sep = ''))

base_dat = read.csv(results_fname)
dat = base_dat %>% gather('method', 'distance', 8:9)
dat$method <- as.factor(dat$method)
dat$method <- revalue(dat$method, c('dist_dip'='dipole', 'dist_dis'='distri'))

ggplot(dat, aes(method, distance, fill=method)) + geom_boxplot(alpha=0.6, width=0.25) + 
      geom_violin(alpha=0.6, width=0.5) + geom_jitter(width=0.1, alpha=0.8)

ggplot(dat, aes(method, distance, fill=method)) + geom_boxplot(alpha=0.7) + 
  geom_jitter(width=0.1, alpha=0.4) + facet_wrap(~w_s)

ggplot(dat[dat$method == 'distri',], aes(intens, distance, fill=intens)) + geom_boxplot(alpha=0.7) + geom_jitter(width=0.1, alpha=0.4)
ggplot(dat[dat$method == 'distri' & dat$intens == '5ma',], aes(n_epo, distance)) + geom_point() + geom_smooth(method = lm)


