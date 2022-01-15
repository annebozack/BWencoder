#' Burrows–Wheeler transform
#'
#' This function performs a Burrows–Wheeler transform of a sting input.
#' 
#' @param string String that the transformation will be applied to.
#' @export
bwt = function(string){
	vect = strsplit(string, split=character(0))[[1]]
	vect2 = c(vect, "$")
	mat = vect2
	for (i in vect2){
		vect2 = c(vect2[2:(length(vect2))], vect2[1])
		mat = rbind(mat, vect2)
		}
	mat2 = mat[1:length(vect2), 1:length(vect2)]
	x = length(vect2)
		for (i in vect2){
		mat2 = mat2[order(mat2[,x]),]
		x = x-1
		}
	last = mat2[,length(vect2)]
	last = paste(last, collapse="")
	return(last)
	}

#' Inverse Burrows–Wheeler transform
#'
#' This function performs an inverse of Burrows–Wheeler transform of a sting input.
#' 
#' @param string String that the inverse transformation will be applied to.
#' @export
invbwt = function(string){
 	vect = strsplit(string, split=character(0))[[1]]
 	vectLen = length(vect)
 	vect = matrix(vect, nrow=vectLen)
 	mat = matrix( , nrow=length(vect))
 	for (i in vect){
 		mat = cbind(vect, mat)
 		mat = mat[order(mat[,1]),]
 		}
 	last = mat[,vectLen]
 	origRow = (match("$", last))
 	origVect = mat[origRow,]
 	origVect = origVect[1:(vectLen - 1)]
 	phrase = paste(origVect, collapse="")
 	return(phrase)
 }