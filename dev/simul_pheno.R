library(data.table)

setwd('~/Documents/NSHG_CNVs_workshop_2024')
setwd('../CNValidatron_fl')
devtools::load_all()
setwd('../NSHG_CNVs_workshop_2024')

cnvs <- fread('cnvs.tsv')

cnvs_r <- fread('cnvs_with_cnvrs.txt')
cnvrs <- fread('cnvrs.txt')
cnvrs[, name := paste0(CNVR, '_N', n)]

fwrite(cnvs_r[, .(chr, start, end, CNVR)],
       'bed_files/cnvs_with_cnvr.bed', sep ='\t', col.names = F)

fwrite(cnvrs[n >= 10, .(chr, start, end, name)],
       'bed_files/cnvrs_min10_freq.bed', sep ='\t', col.names = F)

fwrite(cnvrs[n >= 100, .(chr, start, end, name)],
       'bed_files/cnvrs_min100_freq.bed', sep ='\t', col.names = F)

samples <- unique(cnvs[, .(sample_ID)])
samples[, gender := sample(1:2, .N, replace = T)]
samples

# from Andres

# simulate carriers function (remember to force output as.numeric)
simulateCarriers = function(x, prev, risk) {
  if (is.na(x)==T) {
    NA
  } else if (x==1) {
    rbinom(1,1,prev*risk)
  } else if (x==0) {
    rbinom(1,1,prev)
  }
}

# set tmp.prev & tmp.risk
tmp.prev=0.01 # cnv is in 1% population frequency
tmp.risk=5 # cnv is 5 times more frequent in cases

# simulate case status
data.surv$case=as.numeric(lapply(data.surv$cnv_tmp, FUN = simulateCarriers, prev = 0.01, risk = 5))



# Candidates

# name: ZSWIM6
# location: chr5:60628085-60841999 (+)
cnvs[GT == 2 & chr == 5 & start <= 60628085 & end >= 60841999, .N]

#name: SOD1
#location: chr21:33032006-33041244 (+)
cnvs[GT == 1 & chr == 21 & start <= 33032006 & end >= 33041244, .N]

# bins 100
#name: 13968
#location: chr8:3900001-4000001
cnvs[GT == 2 & chr == 8 & start <= 3900001 & end >= 4000001, .N]

# name: 13q_3_127_N510
# location: chr13:47352113-47434319
cnvs_r[CNVR == '13q_3_127', .N]


# CNV 1 and 2, (very) low prevalence, high risk
samples[sample_ID %in% cnvs[GT == 2 & chr == 5 & start <= 60628085 &
                            end >= 60841999, sample_ID], cnv1 := 1][is.na(cnv1), cnv1 := 0]
samples[sample_ID %in% cnvs[GT == 1 & chr == 21 & start <= 33032006 &
                            end >= 33041244, sample_ID], cnv2 := 1][is.na(cnv2), cnv2 := 0]

# CNV 3, rare moderate-high risk
samples[sample_ID %in% cnvs_r[CNVR == '13q_3_127', sample_ID], cnv3 := 1][is.na(cnv3), cnv3 := 0]

# CNV4, relatively common, low risk
samples[sample_ID %in% cnvs[GT == 1 & chr == 8 & start <= 3900001 &
                            end >= 4000001, sample_ID], cnv4 := 1][is.na(cnv4), cnv4 := 0]


samples$case <- as.numeric(lapply(samples$cnv1, FUN = simulateCarriers, prev = 0.01, risk = 7))

prev <- 0.01
for (i in 1:nrow(samples)) {
  a <- samples[i]
  if (a$cnv1 == 1) cs <- rbinom(1,1,prev*7)
  else if (a$cnv2 == 1) cs <- rbinom(1,1,prev*6)
  else if (a$cnv3 == 1) cs <- rbinom(1,1,prev*4)
  else if (a$cnv4 == 1) cs <- rbinom(1,1,prev*2.5)
  else cs <- rbinom(1,1,prev)
  samples[i, case := cs]
}

fwrite(samples, './dev/pheno.txt')
