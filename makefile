#verilog version
CFLAGS=-g2005 -Wall
#directories
OUT=bin
SRC=src
TST=tester
DMP=vcd
LOGDIR=log
TARGETS= buttonFsm b16toBCD rtcClkDivider timekeeper hasher top

all: clean $(TARGETS)

$(TARGETS) : % : %.out
	@./$(OUT)/$@.out


%.out : $(SRC)/%.v $(TST)/%_tb.v
	sed -e 's#LOGFILE#$(LOGDIR)/$(basename $@).log#' \
	-e 's#DUMPFILE#$(DMP)/$(basename $@).vcd#' \
	$(word 2,$^) > $(word 2,$^).temp
	iverilog $(CFLAGS) -o $(OUT)/$@ $^.temp;
	rm -f $(word 2,$^).temp

clean: 
	rm -f $(OUT)/*
	rm -f $(LOGDIR)/*
