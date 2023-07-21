##main function: X: predictors y: 0-1 response beta: initialization of coefficients
main<-function(X,y,maxiter=200,eps=1e-4,beta){ 
  tn=0
  n=dim(X)[1]
  X=cbind(rep(1,n),X)
  
  
  HH=t(X)%*%X
  p=dim(X)[2]
  
  
  z_esti=y
  while(tn < maxiter)
  { 
    # print(tn)
    beta.old=beta  
    z_esti.old=z_esti
    
    # E-step 
    tmp=X%*%matrix(beta.old,ncol=1)
    for(i in 1:n){
      if(y[i]==1){ 
        bsp=1-pnorm(-tmp[i],0,1)
        if(bsp==0) bsp=1e-3
        z_esti[i]=tmp[i]+dnorm(tmp[i],0,1)/(bsp) 
      }else{
        bsp=pnorm(-tmp[i],0,1)
        if(bsp==0) bsp=1e-3
        z_esti[i]=tmp[i]-dnorm(tmp[i],0,1)/(bsp) 
        
      }
      
    }
    
    
    #M-step
    ctmp=abs(beta) 
    Umat=diag(c(ctmp),p,p)
    
    ma=diag(1,p,p)+Umat%*%HH%*%Umat
    tmp= chol2inv(chol(ma)) 
    tmp2=Umat%*%tmp%*%Umat%*%t(X)
    beta=tmp2%*%z_esti
   
    
    
    
    diff_beta = norm(beta.old-beta,type="2")/(norm(beta,type="2")+0.001)
    if(diff_beta<eps){
      break;
    } 
    tn=tn+1
    cat('the ',tn,'th iter: diff=',diff_beta,'\n')
  }
  
  return(beta)
  
  
  
  
}
 



##example---simulation
set.seed(12) 
p=100
n=100
x = matrix(rnorm(n * p),n,p)  
xb=x%*%c(rep(3,5),rep(0,p-5))+rnorm(n)
yy=xb-3 
g2 = ifelse(yy>0,1,0)
X=x
y=g2
set.seed(1)
beta=runif(dim(x)[2]+1) 
res2=main(X,g2,eps=1e-3,beta=beta)






##real data---note you should set the current working directory of the dataset
# setwd('C:/Users/qx/Desktop')
data=read.csv('data.csv',header=TRUE,check.names=FALSE)[,-1]
X=data[,-1]
for(ii in 1:dim(X)[2]){
  X[,ii]=as.numeric(X[,ii])
}
X=as.matrix(X)
y=data[,1]
set.seed(10)
beta=runif(dim(X)[2]+1) 




res=main(X,y,beta=beta) 
bp=which(abs(res)>0) 
rownames(res)=colnames(data) 
write.csv(res[bp],file='result.csv')
print(colnames(data)[bp])



 
