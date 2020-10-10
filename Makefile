TARGETNAME=test_make
OUTDIR=obj
CC=cl.exe
LINK=link.exe

ALL: $(OUTDIR)\$(TARGETNAME).exe

$(OUTDIR) :
	@if not exist $(OUTDIR) mkdir $(OUTDIR)

CPPFLAGS=\
  /nologo\
  /W3\
  /Fo"$(OUTDIR)\\"\
  /Fd"$(OUTDIR)\\"\
	/c\
	/Zi\
	/D_WIN32_WINNT=0x0600\
	/DUNICODE\
	/D_UNICODE

LINK32_FLAGS=\
  /nologo\
	/subsystem:console\
	/pdb:"$(OUTDIR)\$(TARGETNAME).pdb"\
	/out:"$(OUTDIR)\$(TARGETNAME).exe"\
  /DEBUG

LINK32_OBJS=\
  $(OUTDIR)\$(TARGETNAME).obj

$(OUTDIR)\$(TARGETNAME).exe : $(OUTDIR) $(LINK32_OBJS)
	$(LINK) $(LINK32_FLAGS) $(LINK32_OBJS)

.c{$(OUTDIR)}.obj:
	$(CC) $(CPPFLAGS) $<

clean:
	-@erase /Q $(OUTDIR)\*
