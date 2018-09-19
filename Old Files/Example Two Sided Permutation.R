url = "https://raw.githubusercontent.com/alanarnholt/STT3850/gh-pages/DataCSV/Verizon.csv"
Verizon = read.csv(url)
str(Verizon)

ggplot(data = Verizon, aes(x = Time)) + 
  geom_density(color= "black", fill = "purple") + 
  facet_grid(.~Group) +
  theme_bw()

IQR(Verizon["Group"])
Verizon["Group"] == "ILEC"
Verizon %>%
  group_by(Group) %>%
  summarise(n=n(), Mean = mean(Time), SD = sd(Time), Median = median(Time))

Times = Verizon$Time
sims = 10^4 - 1
ans = numeric(sims)
for(i in 1:sims) {
  index = sample(1687, 23, replace = FALSE)
  ans[i] = mean(Times[index], trim = 0.2) - mean(Times[-index], trim = 0.2)
}

OBS = tapply(Verizon$Time, Verizon$Group, mean, trim = 0.2)
OBS
OBS_DIFF = OBS[1] - OBS[2]
OBS_DIFF

pvalue = (sum(ans >= OBS_DIFF) + 1 ) / (sims + 1)
pvalue



