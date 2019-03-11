The plot2imagecoords.r function can be used to convert the pixels of an image to coordinates, on which data can be plotted in software such as Tableau. The image should be ideally binary (black & white), or grayscale. The script will downsample the image until it fits a requested number of pixels.

plot2imagecoords takes two arguments:
1) A URL pointing to the image of choice, in quotes
2) The number of pixels required in the output.
