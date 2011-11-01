VPATH = ../cpp
CPPD = ../cpp/
SOD = ../cpp/

RDS := $(wildcard *.cpp)
CPPP := $(wildcard $(CPPD)/*.cpp)
SOS = $(RDS:.cpp=.so)
SOP = $(subst .cpp,.so,$(subst $(CPPD),$(SOD),$(CPPP)))

DMTOOL = ecell3-dmc

.PHONY: clean 
.PHONY: allclean

all: $(SOS)

src: $(SRCS)

$(SOS) : %.so : %.cpp
	$(DMTOOL) $<

clean: 
	rm -f $(SOP) 

