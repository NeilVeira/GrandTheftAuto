from PIL import Image

K = 4
LOW = 0.444
HIGH = 0.545

def find_red(pixels):
    print "Identifying red pixels"
    h = len(pixels)
    w = len(pixels[0])
    output = []
    target = [180,45,60]
    
    for y in xrange(h):
        row = []
        for x in xrange(w):
            r,g,b = pixels[y][x]
            #recognize red, pink, or orange       
            #if (r >= 50 and r > 2.5*g and r > 1.5*b) or (r >= 150 and r > 2.0*g and r > 1.5*b): 
            err = (r-target[0])**2 + (g-target[1])**2 + (b-target[2])**2
            if err <= 3500:  
                row.append(1)
            else:
                row.append(0)
        output.append(row)
        
    return output


def detect_edges(pix):        
    print "Detecting edges"
    h = len(pix)
    w = len(pix[0]) 
    k = K
    low = LOW*(2*k+1)*(2*k+1)
    high = HIGH*(2*k+1)*(2*k+1)
    output = [list(row) for row in pix]
    
    #colsum[y][x] = sum of pixels along column x from y-2*k to y
    #precompute all entries 
    colsum = [[0]*w for _ in range(h)] 
    #compute seperately for y = 0
    for x in xrange(w):
        colsum[0][x] = pix[0][x]
    for y in xrange(1,h):
        for x in xrange(w):
            colsum[y][x] = colsum[y-1][x] + pix[y][x]
            if y-(2*k+1) >= 0:
                colsum[y][x] -= pix[y-(2*k+1)][x]
    
    #for each pixel, sum all pixels in (2k+1) x (2k+1) window around it.
    for y in xrange(k,h-k):   
        prev = colsum[y+k][0]
        for x in xrange(1,w-k):
            s = prev + colsum[y+k][x]
            if x-2*k-1 >= 0:
                s -= colsum[y+k][x-2*k-1]
            if x-k >= 0 and low <= s <= high:
                output[y][x-k] = 2
            prev = s
                     
    return output


print "Getting input pixels"
im = Image.open("tb_input.jpg")
#get pixels
w = im.size[0]
h = im.size[1]
pixels = [[(0,0,0)]*w for _ in range(h)]
for y in xrange(h):
    for x in xrange(w):
        pixels[y][x] = im.getpixel((x,y))
#print pixels

colour = find_red(pixels)
output = detect_edges(colour)

#create a new image with just red on black background and green edges
print "Setting output image"
im = Image.new("RGB", (w,h), "black")
out_pixels = im.load()
for y in xrange(h):
    for x in xrange(w):
        if output[y][x] == 0:
            out_pixels[x,y] = (0,0,0)
        elif output[y][x] == 1:
            out_pixels[x,y] = (255,0,0) 
        elif output[y][x] == 2:
            out_pixels[x,y] = (0,255,0)
im.show()
im.save("tb_output.jpg")


#write testbench inputs, expected colour, and edge outputs to files
decoded = open("image_processor/image_processor.srcs/sim_1/imports/image_processing/tb_input.txt","w")
for y in xrange(h):
    for x in xrange(w):
        r,g,b = pixels[y][x]
        decoded.write("%i %i %i %i %i\n" %(x,y,r,g,b))
decoded.close()

colour_file = open("image_processor/image_processor.srcs/sim_1/imports/image_processing/tb_colour.txt","w")
for y in xrange(h):
    for x in xrange(w):
        colour_file.write("%i\n" %(colour[y][x]))
colour_file.close()

edge_file = open("image_processor/image_processor.srcs/sim_1/imports/image_processing/tb_edges.txt","w")
for y in xrange(h):
    for x in xrange(w):
        if output[y][x] == 2:
            edge_file.write("%i %i\n" %(x,y))
edge_file.close()