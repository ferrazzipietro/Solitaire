library(dplyr)

### 
# creo il mazzo e il gioco
###
crea_mazzo <- function(){
  numeri <- c((1:7), "fante", "cavallo", "re") %>% as.character()
  semi <- c("denari", "coppe", "spade", "bastoni")
  valori <- rep(c(1:9, 0), 4)
  carte <- expand.grid(numeri, semi)
  carte[,3] <- valori
  return(carte)
}
solitario <- function(verbose=FALSE){
  carte <- crea_mazzo()
  valore_attuale <- 0
  for(i in 1:40){
    indici <- 1:nrow(carte)
    indice_casuale <- sample(indici, 1)
    if(verbose){
      cat("valore attuale: " , valore_attuale, " carta pescata: ", carte[indice_casuale,1], as.character(carte[indice_casuale,2]),"\n")
    }
    if (carte[indice_casuale,3] == valore_attuale){
      win <- FALSE
      break
    }
    valore_attuale <- (carte[indice_casuale,3] + valore_attuale) %% 10
    carte <- carte[-indice_casuale,]
    win <- TRUE
  }
  return(win)
}

###
# simulazioni
###
nsim <- 1000000
n_vittorie <- 0
for (i in 1:nsim){
  if(solitario()){
    n_vittorie <- n_vittorie + 1
  }
  if ((i%%100)==0) cat("avanzamento: ", i/nsim*100, "%\n")
}
cat("percentuale vittorie su ", nsim, " partite: ", round(n_vittorie/nsim*100, 2), "%")



solitario(verbose=TRUE)
