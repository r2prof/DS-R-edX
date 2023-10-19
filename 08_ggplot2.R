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

#Alpha in Density plot
ggplot(mpg,aes(x=displ, fill=as.factor(cyl)))+
  geom_density()

ggplot(mpg,aes(x=displ, fill=as.factor(cyl)))+
  geom_density(alpha=.5)

# Video-04
#---

#Topics Covered:
#1. Horizontal Line
#2. Vertical line
#3. Pattern 
#4. Straight Line
#5. Annotations
#6. Titles & Labels
#7. Themes

gg=ggplot(data=mpg,aes(x=displ, y=hwy))+
  geom_point()

gg


#1. Horizontal Line
gg+geom_hline(yintercept = 25, 
              size=1, colour="red2")

#2. Vertical Line
gg+geom_vline(xintercept = 4, 
              size=2, colour="red2")

#3. Curvi-linear Pattern
gg+geom_smooth()

#4. Linear Regression Line  
gg+geom_smooth(size=1.5, 
               method = "lm")


#5. Additional Text Information  
gg+annotate(geom = "text", 
            label="R2=.5",
            x=5, y=40, size=5, 
            col=2)+
  geom_smooth(size=1.5, 
              method = "lm")

#6. Titles & Labels
gg+labs(title="My Chart", 
        subtitle="Highway Mileage", 
        y="Highway Mileage", 
        x="Displacement", 
        caption="First chart")


#7. Different Themes
gg+theme_bw()
gg+theme_gray()
gg+theme_grey()
gg+theme_linedraw()
gg+theme_light()
gg+theme_minimal()
gg+theme_classic()
gg+theme_void()
gg+theme_dark()

#Package add2ggplot
require(add2ggplot)
gg+theme_classic2()
gg+theme_du_bois()
gg+theme_grey_and_red()
gg+theme_ilo()
gg+theme_white()




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








