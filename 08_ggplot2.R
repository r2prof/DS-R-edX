# CH-08
# ggplot2 



# ---
# ggplot2 - Dr. Neeraj YouTube series
# https://www.youtube.com/watch?v=xwyKBCqcs5c&t=1s&ab_channel=NeerajKaushik

# Video - 01

# Video - 02

library(ggplot2)

?mpg

View(mpg)

# Important: Use data() not attache().
data("mpg")

# Only axes
ggplot(mpg)

# Only axes provided
ggplot(mpg, aes(x=displ, y=hwy))

# Plotting points
ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point()

# 01-Creating layers----------
gg <- ggplot(mpg, aes(x = displ, y = hwy))

# 02-Additional property of points------
gg + geom_point(col = 3, size = 2, pch = 19)

# 03-Proving color as per the cylinder values------
gg + geom_point(col = cyl, size = 2, pch = 19)

# 04-Proving size as per the cylinder values
gg + geom_point(col = cyl, size = cyl, pch = 19)


# 05-Additional property of Aesthetics-----
summary(as.factor(mpg$class))

ggplot(mpg, aes(x = displ, y = hwy, col = class))+
  geom_point()


# Video-03
#---
# Only colour

ggplot(mpg, aes(x = displ, y = hwy))+ 
      geom_point()

# Same as above
g <- ggplot(mpg)+ 
      geom_point(aes(x = displ, y = hwy)) 

g + aes(col = class)

# Only Size
g + aes(size = class)

# Shape
g + aes(shape = class)

# Size & Colour
g + aes(size = class, col = as.factor(cyl))

# Alpha - works only in sigle variable
g + aes(alpha = class, col = class)

# Alpha in Density plot
ggplot(mpg,aes(x=displ, fill=as.factor(cyl)))+
  geom_density()

ggplot(mpg,aes(x=displ, fill=as.factor(cyl)))+
  geom_density(alpha=.5)

# Video-04
#---

gg <- ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point()

gg


# Horizontal line----
gg + geom_hline(yintercept = 25, size = 1, colour= "red")

# Vertical Line----
gg + geom_vline(xintercept = 4, size = 1, colour= "red")

#  Curvi-linear pattern----
gg + geom_smooth()

# Linear Regression Line----  
gg + geom_smooth(size = 1.5, method = "lm")

# Additional text information  
gg + annotate(geom = "text", label = "R-sq =0.5",
              x = 5, y = 40, size = 5, col = 2)+
    geom_smooth(size = 1.5, method = "lm")

# Titles & Labels
gg + labs(title = "My Chart", 
          subtitle = "Highway Mileage", 
          y = "Highway Mileage", 
          x = "Displacement", 
          caption = "First chart")


# Different themes----
gg+theme_bw()
gg+theme_gray()
gg+theme_grey()
gg+theme_linedraw()
gg+theme_light()
gg+theme_minimal()
gg+theme_classic()
gg+theme_void()
gg+theme_dark()

# More themes with package add2ggplot----
library(add2ggplot)

gg+theme_classic2()
gg+theme_du_bois()
gg+theme_grey_and_red()
gg+theme_ilo()
gg+theme_white()

# Video-05
#---

# Plots for single continuous variable -----------

c <- ggplot(mpg, aes(displ))

# Histogram------
# geom_histogram()

?geom_histogram
c + geom_histogram()
c + geom_histogram(bins=6)
c + geom_histogram(bins=6, fill=5)
c + geom_histogram(bins=6, fill=5, col=1)

# Frequency polygon()-----
# geom_freqpoly()

c + geom_freqpoly()
c + geom_histogram()

c + geom_histogram(fill = 5, col = 1)+
    geom_freqpoly(col = 2,size = 1)

# Density Plot-----
# geom_density()
?geom_density()
c + geom_density()
c + geom_density(stat = "count")

# Dotplot-----
# geom_dotplot()
c + geom_dotplot()
c + geom_dotplot(binwidth = .2, 
               fill=5)


#5.Boxplot
#geom_boxplot()

?geom_boxplot
c+geom_boxplot()
c+geom_boxplot(aes(x=hwy))
c+geom_boxplot(aes(x=hwy),
               outlier.color = 2,
               outlier.size = 3,
               outlier.stroke = 2,
               outlier.shape = 8)

#-------***---------***----------







#====================================

#------------------------------
#One Discrete Variable 
#------------------------------

d=ggplot(mpg, aes(drv))
summary(factor(drv))

#1.Barplot- geom_bar() 
?geom_bar()
d+geom_bar()
d+geom_bar(fill=5, col=1)
d+geom_bar(fill=5, col=1, size=3)

#2.Column Plot
# geom_col()
?geom_col()
d+geom_col(aes(y=hwy))
tapply(hwy, drv, sum)

d+geom_col(aes(y=mean(hwy)),fill=5,col=2)
tapply(hwy, drv, mean)
table(drv)
table(drv)*mean(hwy)

#3. Piechart
d=ggplot(mpg, aes(drv))
d+geom_bar()


d+geom_bar()+coord_polar()
d1=ggplot(mpg, aes(class))
d1+geom_bar()+coord_polar()


#-------***---------***----------




#====================================

#------------------------------
#One Continuous Variable &
#One Discrete Variable
#------------------------------

cd=ggplot(mpg, aes(factor(drv),hwy))

#1.Violinplot
#geom_violin()
?geom_violin()
cd+geom_violin()

#2.Boxplot
#geom_boxplot()
?geom_boxplot()

c+geom_boxplot()
c+geom_boxplot(aes(y=class))
c+geom_boxplot(aes(y=class), fill=7)

cd+geom_boxplot()

cd+geom_boxplot(outlier.shape = 3,
                outlier.colour = 2,
                outlier.size = 4,
                outlier.stroke = 2)

#Violin Plot and Boxplot combined
cd+geom_violin(fill=5)
cd+geom_violin(fill=5)+geom_boxplot()

#-------***---------***----------




















































# Different geom types----
# 1. Univariate Analysis
# 2. Bivariate Analysis


# 06-Univariate Analysis--------

g <- ggplot(mpg, aes(x=displ))

# 07-Histogram----------
g + geom_histogram()

g + geom_histogram(binwidth = 0.75, fill = "grey", colour = "black")

#------------Density------------
g + geom_density()
colours()
ggplot(mpg,aes(x=displ,
               fill=as.factor(cyl)))+
  geom_density()

ggplot(mpg,aes(x=displ,
               fill=as.factor(cyl)))+
  geom_density(alpha=.5)

#------------Boxplot------------
g + geom_boxplot(colour="red",
                 fill="green")

gg + geom_boxplot(colour="red",
                  fill="green")

#------------Dotplot------------
g + geom_dotplot()

g + geom_dotplot(binwidth = .2)


#========Bivariate Analysis=========

#-----------Scatter Plot------------
gg + geom_jitter(height = 0.5, 
                 width = .3)


#------------Violin Plot------------
ggplot(mpg, 
       aes(x=displ,y=hwy, 
           fill=as.factor(cyl)))+
  geom_violin(alpha=.5)+
  geom_boxplot()

gg + geom_point()
gg + geom_line()
gg + geom_smooth()
gg + geom_point() + geom_smooth() 
gg + geom_point() + geom_smooth(method = 'lm')

#------------Column plot------------
ggplot(mpg, aes(x=as.factor(cyl),y=displ, fill=cyl))+
  geom_col() 

ggplot(mpg, aes(x=as.factor(cyl),y=displ, fill=class))+
  geom_col() 

ggplot(mpg, aes(x=as.factor(cyl),y=displ, fill=class))+
  geom_col(position = "dodge") 


#Regression line through all point, color by cylinder
gg + geom_point(aes(col=2,size=4))+
  geom_smooth(method="lm",col=1, size=1)


#===Adding Title & Labels to Chart======

g1=ggplot(mpg, aes(x=displ, y=hwy))+
  geom_point(col=6, size=3)+
  geom_smooth(method="lm",col=1, size=2)

g1

g1+labs(title="My Chart", 
        subtitle="Highway Mileage", 
        y="hwy", x="hwy", 
        caption="First chart")


#==============Annotation============
g1+annotate(geom="text", x=5, y=35,
            label="r2=0.58")








