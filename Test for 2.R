library(pwr)
library(WebPower)
library(MatchIt)
library(readxl)
library(optmatch)
library(readxl)

GreatWolf1 <- read_excel('C:/Users/efalo/OneDrive/Documents/SMU/SMU Docs/Spring Mod  A/Test & Learn/Great Wolf F&B test planning for 2.xlsx',
                                   sheet = "Test3", 
                                   col_types = c("numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
View(GreatWolf1)

summary(GreatWolf1)
str(GreatWolf1)


m.out<-matchit(Treat ~ Meal_Time+P1+P2+P3+P4+Meal_Type+Day_Type, data=GreatWolf1, method = "full")
summary(m.out)

m.data<-match.data(m.out,data = GreatWolf1)
mm<-na.omit(m.out$match.matrix)
summary(mm)


#


ndf = (4-1)*(2-1)*(2-1) # 3
ng = 4*2*2  # 16


#Assume 95% CI and power 80%
#assuming f=0.25


wp.kanova(ndf= 3, f=.25,ng=16, alpha=.05, power=.8)

n=178 #based on the output
ng=16

NumRep=n/ng #12 rep
12/3 #4 weeks

