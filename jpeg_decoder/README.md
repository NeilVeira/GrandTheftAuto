# Jpeg Decoder

Device: Artix 7 

Tool: Vivado 2016.2

This project implements an IP to decode jpeg images. It takes in a stream of bytes encoding a jpeg 
image and outputs the RGB values for each pixel. It can also handle a continuous stream of 
multiple images. 

The project was originally taken from opencores (https://opencores.org/project,mjpeg-decoder) but 
has been modified to run on Vivado 2016.2 and to work around bugs in the original project. 

A testbench is provided in jpeg.srcs/sim_1/imports/vhdl/jpeg_testbench.vhd. This testbench reads 
bytes from an input file jpeg.srcs/sim_1/imports/mjpeg/lena.jpg 

This document describes how to use the IP. For a detailed description of how the jpeg decoding 
works, see mjpeg.pdf. 

## How to use this IP 

* When you are ready to send data to decoder, set ready_i = 1
* Wait until ready_o = 1 
* Send the data 4 bytes at a time on the data_i signal. Also set datavalid_i = 1 for every cycle
	that the data should be read. 
* After some time the output should appear on the following signals:
  * datavalid_o: This is 1 when the output signals contain valid data. Ignore all output when 
    this is 0.
  * red_o: red component of current pixel
  * green_o: green component of current pixel
  * blue_o: blue component of current pixel
  * width_o: width of image 
  * height_o: height of image 
  * x_o: x coordinate of current pixel
  * y_o: y coordinate of current pixel
* Important: ready_o can go low at any time. Any data sent when ready_o = 0 will not be read,
   so always check ready_o before sending data. 
* Pixels are output in 16 x 16 blocks, with pixels within the block given in row-major order and 
	the blocks themselves also in row-major order. 
* To simulate the IP, run a post-synthesis functional simulation. Behavioural simulation is not 
  possible because the IP is built from post-synthesis netlists.
* The original authors claim that the IP can also decode mjpeg videos. However, this feature 
  has not been tested (and the bug work-arounds in jpeg_decoder.v most likely do not work for mjpeg
  data).

### Known Issues
Two major bugs were found in the original jpeg decoder project. The wrapper file jpeg_decoder.v 
implements work-arounds for each of them, so neither of these should be an issue now.
* Sometimes the jpeg decoder would set ready_o high and start reading in the next image long before 
  it has finished processing the previous image. This would cause it to give garbage output. 
  jpeg_decoder.v generates its own ready_o signal. Once the end of the image has been seen on 
  data_i this ready_o is not set high until (x,y) reaches (0,height). 
* If input data is given intermittently (i.e. not one word every cycle; with datavalid_i high for only
  1 out of every N cycles where N >> 1), the jpeg decoder would incorrectly read the huffman table data 
  and throw an error. It would then completely stop until reset. jpeg_decoder.v works around this by 
  adding a fifo before the input which lets the data pile up until there are at least 512 words in 
  the queue. Then it empties the queue in one go, sending one word every cycle. 
