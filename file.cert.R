filepath<-"C:/Users/Josh/Documents/All_Reports_20140930/All_Reports_20140930_- Past Due and Nonaccrual Loans Wholly or Partially US Gvmt Guaranteed.csv"
file.cert<-function(filepath){
  return(unique(read.csv(filepath)$cert))
}