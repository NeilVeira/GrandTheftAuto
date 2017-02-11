from PIL import Image

K = 4
LOW = 0.444
HIGH = 0.545

def find_red(pixels):
    print "Identifying red pixels"
    h = len(pixels)
    w = len(pixels[0])
    output = []
    target = [221,221,221]
    
    for y in xrange(h):
        row = []
        for x in xrange(w):
            r,g,b = pixels[y][x]
            #recognize red, pink, or orange
            #err = (r-target[0])**2 + (g-target[1])**2 + (b-target[2])**2
            #if err <= 3500:   
            if (r >= 50 and r > 2.5*g and r > 1.5*b) or (r >= 150 and r > 2.0*g and r > 1.5*b):        
                #print err
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
    
    #column_sum[y][x] = sum of pixels along column x from y-2*k to y
    #precompute all entries
    column_sum = [[0]*w for _ in range(h)]   
    #seperately compute the first entry for y = 2*k
    for x in xrange(w):
        s = 0
        for y in xrange(2*k+1):
            s += pix[y][x]
        column_sum[2*k][x] = s
    #compute other y using update relation
    for y in xrange(2*k+1,h):
        for x in xrange(w):
            column_sum[y][x] = column_sum[y-1][x] - pix[y-(2*k+1)][x] + pix[y][x]
            assert 0 <= column_sum[y][x] <= 2*k+1
    #for row in column_sum[160:180]:
    #    print row[270:290]
    
    #for each pixel, sum all pixels in 2k x 2k window around it.
    for y in xrange(k,h-k):
        #do first column seperately
        prev = sum(column_sum[y+k][0:2*k+1])
        if low <= prev <= high:
            output[y][k] = 2
        
        for x in xrange(k+1,w-k):
            #s_correct = sum(column_sum[y+k][x-k:x+k+1])
            s = prev - column_sum[y+k][x-k-1] + column_sum[y+k][x+k] 
            if low <= s <= high:
                output[y][x] = 2
            prev = s
                                
    return output


image = "16.jpg"

print "Getting input pixels"
im = Image.open("test_images/"+image)
#get pixels
w = im.size[0]
h = im.size[1]
pixels = [[(0,0,0)]*w for _ in range(h)]
for y in xrange(h):
    for x in xrange(w):
        pixels[y][x] = im.getpixel((x,y))
#print pixels

output = find_red(pixels)
output = detect_edges(output)

#create a new image with just red on black background and green edges
print "Setting output image"
im = Image.new("RGB", (w,h), "black")
pixels = im.load()
for y in xrange(h):
    for x in xrange(w):
        if output[y][x] == 0:
            pixels[x,y] = (0,0,0)
        elif output[y][x] == 1:
            pixels[x,y] = (255,0,0) 
        elif output[y][x] == 2:
            pixels[x,y] = (0,255,0)
im.show()
im.save("edges/"+image)