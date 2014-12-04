# DO NOT DELETE THIS LINE -- make depend depends on it.


# Edit the lines below to point to any needed include and link paths
# Or to change the compiler's optimization flags
CC = g++
COMPILEFLAGS = ${CPPFLAGS} -D_LINUX -D_REENTRANT -Wall  -O3 -march=nocona -msse3
LINKFLAGS = ${LDFLAGS}  -lblas -llapack -lGVars3 -lcvd -lGL -lGLU 

# add OpenCV dependencies
COMPILEFLAGS += $(shell pkg-config --cflags opencv)
LINKFLAGS += $(shell pkg-config --libs opencv)

# add gstreamer dependencies
COMPILEFLAGS += $(shell pkg-config --cflags glib-2.0) $(shell pkg-config --cflags gstreamer-0.10)
LINKFLAGS += $(shell pkg-config --libs glib-2.0) $(shell pkg-config --libs gstreamer-0.10) -lgstapp-0.10

# Edit this line to change video source
VIDEOSOURCE = VideoSource_Linux_OpenCV.o
#VIDEOSOURCE = VideoSource_Linux_Gstreamer_File.o

OBJECTS=	main.o\
		GLWindow2.o\
		GLWindowMenu.o\
		$(VIDEOSOURCE)\
		System.o \
		ATANCamera.o\
		KeyFrame.o\
		MapPoint.o\
		Map.o\
		SmallBlurryImage.o\
		ShiTomasi.o \
		HomographyInit.o \
		MapMaker.o \
		Bundle.o \
		PatchFinder.o\
		Relocaliser.o\
		MiniPatch.o\
		MapViewer.o\
		ARDriver.o\
		EyeGame.o\
		Tracker.o

CALIB_OBJECTS=	GLWindow2.o\
		GLWindowMenu.o\
		$(VIDEOSOURCE)\
		CalibImage.o \
		CalibCornerPatch.o\
		ATANCamera.o \
		CameraCalibrator.o

All: PTAM CameraCalibrator

PTAM: $(OBJECTS)
	$(CC) -o PTAM $(OBJECTS) $(LINKFLAGS)

CameraCalibrator:$(CALIB_OBJECTS)
	$(CC) -o CameraCalibrator $(CALIB_OBJECTS) $(LINKFLAGS)


%.o: %.cc
	$(CC) $< -o $@ -c $(COMPILEFLAGS)

clean:
	rm *.o


depend:
	rm dependecies; touch dependencies
	makedepend -fdependencies $(INCLUDEFLAGS) $(MOREINCS) *.cc *.h


-include dependencies









