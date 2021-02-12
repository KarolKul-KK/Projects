library(reshape2)
library(ggplot2)

# LOAD DATA
delim = ";" 
dec = ","    
rice <- read.csv("ceny_ryżu.csv", header=TRUE, sep=delim, dec=dec, stringsAsFactors=FALSE)

# Change columns names to more clearly
rice <- rice %>% 
  rename(
    '2006' = styczeń.ryż...za.1kg.cena.2006..zł.,
    '2007' = styczeń.ryż...za.1kg.cena.2007..zł.,
    '2008' = styczeń.ryż...za.1kg.cena.2008..zł.,
    '2009' = styczeń.ryż...za.1kg.cena.2009..zł.,
    '2010' = styczeń.ryż...za.1kg.cena.2010..zł.,
    '2011' = styczeń.ryż...za.1kg.cena.2011..zł.,
    '2012' = styczeń.ryż...za.1kg.cena.2012..zł.,
    '2013' = styczeń.ryż...za.1kg.cena.2013..zł.,
    '2014' = styczeń.ryż...za.1kg.cena.2014..zł.,
    '2015' = styczeń.ryż...za.1kg.cena.2015..zł.,
    '2016' = styczeń.ryż...za.1kg.cena.2016..zł.,
    '2017' = styczeń.ryż...za.1kg.cena.2017..zł.,
    '2018' = styczeń.ryż...za.1kg.cena.2018..zł.,
    '2019' = styczeń.ryż...za.1kg.cena.2019..zł.,
  )

# Drop useless columns
rice
rice = subset(rice, select = -c(Kod,X) )
rice

# Let's see closer on metrics by years
summary(rice)

# The function melt reshapes it from wide to long
df <- melt(rice)
df  

# Add a rowid identifying variable
df$rowid <- 1:17
head(df, 17)

# Make a line plot
ggplot(df, aes(variable, value, group=factor(rowid))) + geom_line(aes(color=factor(Nazwa)))

# LOAD DATA
cottage_cheese <- read.csv("ceny_twaróg.csv", header=TRUE, sep=delim, dec=dec, stringsAsFactors=FALSE)

# Change columns names to more clearly
cottage_cheese <- cottage_cheese %>% 
  rename(
    '2006' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2006..zł.,
    '2007' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2007..zł.,
    '2008' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2008..zł.,
    '2009' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2009..zł.,
    '2010' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2010..zł.,
    '2011' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2011..zł.,
    '2012' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2012..zł.,
    '2013' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2013..zł.,
    '2014' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2014..zł.,
    '2015' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2015..zł.,
    '2016' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2016..zł.,
    '2017' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2017..zł.,
    '2018' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2018..zł.,
    '2019' = styczeń.ser.twarogowy.półtłusty...za.1kg.cena.2019..zł.,
  )

# Drop useless columns
cottage_cheese = subset(cottage_cheese, select = -c(Kod,X) )
cottage_cheese

# Let's see closer on metrics by years
summary(cottage_cheese)

# The function melt reshapes it from wide to long
df_1 <- melt(cottage_cheese)
df_1  

# Add a rowid identifying variable
df_1$rowid <- 1:17
head(df, 17)

# Make a line plot
ggplot(df_1, aes(variable, value, group=factor(rowid))) + geom_line(aes(color=factor(Nazwa)))

# LOAD DATA
onion <- read.csv("ceny_cebula.csv", header=TRUE, sep=delim, dec=dec, stringsAsFactors=FALSE)

# Change columns names to more clearly
onion <- onion %>% 
  rename(
    '2006' = styczeń.cebula...za.1.kg.cena.2006..zł.,
    '2007' = styczeń.cebula...za.1.kg.cena.2007..zł.,
    '2008' = styczeń.cebula...za.1.kg.cena.2008..zł.,
    '2009' = styczeń.cebula...za.1.kg.cena.2009..zł.,
    '2010' = styczeń.cebula...za.1.kg.cena.2010..zł.,
    '2011' = styczeń.cebula...za.1.kg.cena.2011..zł.,
    '2012' = styczeń.cebula...za.1.kg.cena.2012..zł.,
    '2013' = styczeń.cebula...za.1.kg.cena.2013..zł.,
    '2014' = styczeń.cebula...za.1.kg.cena.2014..zł.,
    '2015' = styczeń.cebula...za.1.kg.cena.2015..zł.,
    '2016' = styczeń.cebula...za.1.kg.cena.2016..zł.,
    '2017' = styczeń.cebula...za.1.kg.cena.2017..zł.,
    '2018' = styczeń.cebula...za.1.kg.cena.2018..zł.,
    '2019' = styczeń.cebula...za.1.kg.cena.2019..zł.,
  )

# Drop useless columns
onion = subset(onion, select = -c(Kod,X) )
onion

# Let's see closer on metrics by years
summary(onion)

# The function melt reshapes it from wide to long
df_2 <- melt(onion)
df_2  

# Add a rowid identifying variable
df_2$rowid <- 1:17
head(df_2, 17)

# Make a line plot
ggplot(df_2, aes(variable, value, group=factor(rowid))) + geom_line(aes(color=factor(Nazwa)))

# LOAD DATA
flour <- read.csv("ceny_mąka.csv", header=TRUE, sep=delim, dec=dec, stringsAsFactors=FALSE)

# Change columns names to more clearly
flour <- flour %>% 
  rename(
    '2006' = styczeń.mąka.pszenna...za.1kg.cena.2006..zł.,
    '2007' = styczeń.mąka.pszenna...za.1kg.cena.2007..zł.,
    '2008' = styczeń.mąka.pszenna...za.1kg.cena.2008..zł.,
    '2009' = styczeń.mąka.pszenna...za.1kg.cena.2009..zł.,
    '2010' = styczeń.mąka.pszenna...za.1kg.cena.2010..zł.,
    '2011' = styczeń.mąka.pszenna...za.1kg.cena.2011..zł.,
    '2012' = styczeń.mąka.pszenna...za.1kg.cena.2012..zł.,
    '2013' = styczeń.mąka.pszenna...za.1kg.cena.2013..zł.,
    '2014' = styczeń.mąka.pszenna...za.1kg.cena.2014..zł.,
    '2015' = styczeń.mąka.pszenna...za.1kg.cena.2015..zł.,
    '2016' = styczeń.mąka.pszenna...za.1kg.cena.2016..zł.,
    '2017' = styczeń.mąka.pszenna...za.1kg.cena.2017..zł.,
    '2018' = styczeń.mąka.pszenna...za.1kg.cena.2018..zł.,
    '2019' = styczeń.mąka.pszenna...za.1kg.cena.2019..zł.,
  )

# Drop useless columns
flour = subset(flour, select = -c(Kod,X) )
flour

# Let's see closer on metrics by years
summary(flour)

# The function melt reshapes it from wide to long
df_3 <- melt(flour)
df_3  

# Add a rowid identifying variable
df_3$rowid <- 1:17
head(df_3, 17)

# Make a line plot
ggplot(df_3, aes(variable, value, group=factor(rowid))) + geom_line(aes(color=factor(Nazwa)))

# LOAD DATA
coffe <- read.csv("ceny_kawa.csv", header=TRUE, sep=delim, dec=dec, stringsAsFactors=FALSE)

# Change columns names to more clearly
coffe <- coffe %>% 
  rename(
    '2006' = styczeń.kawa.naturalna.mielona...za.250g.cena.2006..zł.,
    '2007' = styczeń.kawa.naturalna.mielona...za.250g.cena.2007..zł.,
    '2008' = styczeń.kawa.naturalna.mielona...za.250g.cena.2008..zł.,
    '2009' = styczeń.kawa.naturalna.mielona...za.250g.cena.2009..zł.,
    '2010' = styczeń.kawa.naturalna.mielona...za.250g.cena.2010..zł.,
    '2011' = styczeń.kawa.naturalna.mielona...za.250g.cena.2011..zł.,
    '2012' = styczeń.kawa.naturalna.mielona...za.250g.cena.2012..zł.,
    '2013' = styczeń.kawa.naturalna.mielona...za.250g.cena.2013..zł.,
    '2014' = styczeń.kawa.naturalna.mielona...za.250g.cena.2014..zł.,
    '2015' = styczeń.kawa.naturalna.mielona...za.250g.cena.2015..zł.,
    '2016' = styczeń.kawa.naturalna.mielona...za.250g.cena.2016..zł.,
    '2017' = styczeń.kawa.naturalna.mielona...za.250g.cena.2017..zł.,
    '2018' = styczeń.kawa.naturalna.mielona...za.250g.cena.2018..zł.,
    '2019' = styczeń.kawa.naturalna.mielona...za.250g.cena.2019..zł.,
  )

# Drop useless columns
coffe = subset(coffe, select = -c(Kod,X) )
coffe

# Let's see closer on metrics by years
summary(coffe)

# The function melt reshapes it from wide to long
df_4 <- melt(coffe)
df_4  

# Add a rowid identifying variable
df_4$rowid <- 1:17
head(df_4, 17)

# Make a line plot
ggplot(df_4, aes(variable, value, group=factor(rowid))) + geom_line(aes(color=factor(Nazwa)))


