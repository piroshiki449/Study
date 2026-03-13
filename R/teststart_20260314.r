add <- function(x, y) {
  x + y
}

hello <- rnorm(100)

# region

print(add(1, -2))
print(add(1.0e10, 2.0e10))

# endregion

print(paste("one", NULL))
print(paste(NA, 'two'))

print(paste("multi-line",'multi-line'))


x<-seq(1,10)
y<-seq(2,11)

plot(x, y)


mydata<-data.frame(id=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20),
place=c("ito","ito","ito","ito","hakozaki","hakozaki","hakozaki","maidashi","maidashi","maidashi",
"ito","ito","ito","hakozaki","hakozaki","hakozaki","hakozaki","maidashi","maidashi","maidashi"),
sei=c("m","m","m","m","m","m","m","m","m","m","f","f","f","f","f","f","f","f","f","f"),
leftleg=c(13.17,15.01,15.29,14.05,15.77,16.17,15.03,14.96,15.99,16.23,17.15,16.39,17.38,17.35,17.13,15.39,16.91,19.67,20.72,18.57),
rightleg=c(16.16,16.88,14.52,14.39,16.44,15.06,14.19,17.26,16.98,17.37,16.56,16.49,16.47,16.29,17.57,17.76,17.76,18.08,19.07,19.82),
bodylength=c(23.81,24.65,22.85,23.47,25.15,25.36,24.90,29.14,26.55,32.16,28.78,28.29,30.92,30.34,31.02,30.80,27.77,34.15,35.65,34.48))

print(mydata)