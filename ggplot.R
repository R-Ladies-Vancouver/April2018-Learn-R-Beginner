

library(ggplot2)

dat%>%
  ggplot(aes(x = ,y = ,...))+
  
  geom_boxplot()+
  geom_point()+
  geom_bar()+
  
  labs(title="my plot title")+
  xlab("my x label title")+
  ylab("my y label title")
  
  theme_bw()+
  theme_classic()+
  theme_dark()+
  theme()

 