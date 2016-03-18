# Top level makefile to build the utilities etc
AS=tools/as7
ASARGS=--format=ptr
SYSDIR=sys
CMDDIR=bin
TESTDIR=tests

all: sys cmd others tests build

build: cmd others
	cd build && make

runsh: all
	cd bin && ../tools/a7out sh

dirs:
	mkdir -p $(SYSDIR)
	mkdir -p $(CMDDIR)
	mkdir -p $(TESTDIR)

sys: dirs
	$(AS) $(ASARGS) -o $(SYSDIR)/unix   src/sys/*.s

cmd: dirs
#	$(AS) $(ASARGS) -o $(CMDDIR)/adm    src/cmd/adm.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/apr    src/cmd/apr.s
	$(AS) $(ASARGS) -o $(CMDDIR)/as     src/cmd/as.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/bc     src/cmd/bc.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/bi     src/cmd/bi.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/bl     src/cmd/bl.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/cas    src/cmd/cas.s
	$(AS) $(ASARGS) -o $(CMDDIR)/cat    src/cmd/cat.s
	$(AS) $(ASARGS) -o $(CMDDIR)/check  src/cmd/check.s
	$(AS) $(ASARGS) -o $(CMDDIR)/chmod   src/cmd/chmod.s
	$(AS) $(ASARGS) -o $(CMDDIR)/chown   src/cmd/chown.s
	$(AS) $(ASARGS) -o $(CMDDIR)/chrm    src/cmd/chrm.s
	$(AS) $(ASARGS) -o $(CMDDIR)/cp      src/cmd/cp.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/db      src/cmd/db.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/dmabs   src/cmd/dmabs.s
	$(AS) $(ASARGS) -o $(CMDDIR)/ds      src/cmd/ds.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/dskio   src/cmd/dskio.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/dskres  src/cmd/dskres.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/dsksav  src/cmd/dsksav.s
#	$(AS) $(ASARGS) -o $(CMDDIR)/dsw     src/cmd/dsw.s
	$(AS) $(ASARGS) -o $(CMDDIR)/ed      src/cmd/ed1.s src/cmd/ed2.s
	$(AS) $(ASARGS) -o $(CMDDIR)/init    src/cmd/init.s

others: dirs
	$(AS) $(ASARGS) -o $(CMDDIR)/sh    	src/other/pbsh.s	

# wkt apps
	$(AS) $(ASARGS) -o $(CMDDIR)/ls    	src/other/wktls.s	
	$(AS) $(ASARGS) -o $(CMDDIR)/wktcat    	src/other/wktcat.s	
	$(AS) $(ASARGS) -o $(CMDDIR)/wktcp    	src/other/wktcp.s	
	$(AS) $(ASARGS) -o $(CMDDIR)/date  	src/other/wktdate.s	
	$(AS) $(ASARGS) -o $(CMDDIR)/ln  	src/other/wktln.s
	$(AS) $(ASARGS) -o $(CMDDIR)/ls  	src/other/wktls.s		
	$(AS) $(ASARGS) -o $(CMDDIR)/mv    	src/other/wktmv.s	
	$(AS) $(ASARGS) -o $(CMDDIR)/stat  	src/other/wktstat.s	

tests: dirs
	$(AS) $(ASARGS) -o $(TESTDIR)/decimal_out    	src/tests/decimal_out.s	
	$(AS) $(ASARGS) -o $(TESTDIR)/fork_test    		src/tests/fork_test.s	
	$(AS) $(ASARGS) -o $(TESTDIR)/octal_test    	src/tests/octal_test.s	
	$(AS) $(ASARGS) -o $(TESTDIR)/testmul    		src/tests/testmul.s
	$(AS) $(ASARGS) -o $(TESTDIR)/write_test    	src/tests/write_test.s

runtests: tests
	cd tests && ../tools/a7out decimal_out
	cd tests && ../tools/a7out fork_test
	cd tests && ../tools/a7out octal_test
#	cd tests && ../tools/a7out testmul
#	cd tests && ../tools/a7out write_test

clean:
	rm -rf $(SYSDIR)/*
	rm -rf $(CMDDIR)/*
	rm -rf $(TESTDIR)/*
	cd build && make clean
