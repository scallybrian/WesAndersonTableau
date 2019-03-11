plot2imagecoords = function(imgURL, npixels){

  # Make sure pacman is installed
  if (!require("pacman",character.only = T) == TRUE){
    install.packages("pacman")
    library(pacman)
  }  
  
  p_load(magick,OpenImageR)


  img = image_read(imgURL)
  
  
  # Convert to bitmap/matrix
  img = as.numeric(img[[1]])
  
  # Keep only one of the RGB channels
  img = img[,,1] 
  
  # Set all non-white to 0
  img[img <= 0.5 ] = 0
  img[img > 0.5 ] = 1

  
  
  # Count number of red pixels
  filled = length(img[img == 0])
  
  # Downsample image to target red pixels
  
  
  for (i in seq(1,1000,0.0001)){
    
    img2 = down_sample_image(img, i)
    filled2 = length(img2[img2 == 0])
    
    if (filled2 == npixels){
      break
    } 
    
  }

  
  # Rotate image
  rotate <- function(x) t(apply(x, 2, rev))
  img2 = rotate(img2)

  
  # Extract coordinates of targets
  coords = as.data.frame(which(img2 == 0, arr.ind=TRUE))
  names(coords) = c("PixelX", "PixelY")
  
  return(coords)

}
