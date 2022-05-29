# RGB-AW3D30
template for rgbifying AW3D30

# Steps
### 0. Clone this reposiroty
```
git clone https://github.com/ubukawa/RGB-AW3D30
cd RGB-AW3D30
```

### 1. Making a file storage
```
mkdir src
```

### 2. Download 5 by 5 degree AW3DB data, and store them in *src* folder.
I succeed developing RGB elevation tiles from 6 zip files.
Please consider the number of files thinking about your PC power.

### 3. Start Docker container
Start Docker container that has gdal related tools and rgbifying tool.
```
git clone https://github.com/ubukawa/rgbify
cd rgbify
docker build -t ubukawa/rgbify:ubukawa .
docker run -it --rm -v ${PWD}:/data unvt/rgbify:ubukawa
cd /data
```
Make sure that your working directory is connected to /data.

### 4. Unpack downloaded data
A directory named 01_unzip will be created, and unpacked zip file will be stored there.
```
./01-unpack.sh
```

### 5. Merge them to make a single tiff file.
You will have a sinle tiff file named input.tif.
Please consider the extent of the generated file. You will fail if the extent is too large even if the number of donloaded file is small.
```
./02-merge.sh
```

### 6. RGBigying it
Before run it, please modify max-z and min-z or the tile if you want. (default max:11, min:9)
You will get RGB tile as out.mbtiles
```
./03-rgb.sh

```

### 7. Convert tile into png.
Make sure that you do not have "zxy" directory in your working place. Then, run the command.
You will get png files under zxy directory. (You can change the output name by editing the script.)

```
./04-png.sh

```
