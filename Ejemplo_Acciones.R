install.packages("tidyverse")
install.packages("tidyquant")
                 
library("tidyverse")
library("tidyquant")

tq_index_options()

acciones_sp500 = tq_index("SP500")
acciones_nyse = tq_exchange("NYSE")

filter_spm = acciones_nyse %>% filter_spm