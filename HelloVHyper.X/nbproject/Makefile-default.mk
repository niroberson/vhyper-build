#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=source/ChrFont0.c source/delay.c source/FillPat.c source/OledChar.c source/OledGrph.c source/PmodOLED.c source/Vhyper_UART.c source/HelloVHyper.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/source/ChrFont0.o ${OBJECTDIR}/source/delay.o ${OBJECTDIR}/source/FillPat.o ${OBJECTDIR}/source/OledChar.o ${OBJECTDIR}/source/OledGrph.o ${OBJECTDIR}/source/PmodOLED.o ${OBJECTDIR}/source/Vhyper_UART.o ${OBJECTDIR}/source/HelloVHyper.o
POSSIBLE_DEPFILES=${OBJECTDIR}/source/ChrFont0.o.d ${OBJECTDIR}/source/delay.o.d ${OBJECTDIR}/source/FillPat.o.d ${OBJECTDIR}/source/OledChar.o.d ${OBJECTDIR}/source/OledGrph.o.d ${OBJECTDIR}/source/PmodOLED.o.d ${OBJECTDIR}/source/Vhyper_UART.o.d ${OBJECTDIR}/source/HelloVHyper.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/source/ChrFont0.o ${OBJECTDIR}/source/delay.o ${OBJECTDIR}/source/FillPat.o ${OBJECTDIR}/source/OledChar.o ${OBJECTDIR}/source/OledGrph.o ${OBJECTDIR}/source/PmodOLED.o ${OBJECTDIR}/source/Vhyper_UART.o ${OBJECTDIR}/source/HelloVHyper.o

# Source Files
SOURCEFILES=source/ChrFont0.c source/delay.c source/FillPat.c source/OledChar.c source/OledGrph.c source/PmodOLED.c source/Vhyper_UART.c source/HelloVHyper.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE} ${MAKE_OPTIONS} -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/source/ChrFont0.o: source/ChrFont0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/ChrFont0.o.d 
	@${RM} ${OBJECTDIR}/source/ChrFont0.o 
	@${FIXDEPS} "${OBJECTDIR}/source/ChrFont0.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/ChrFont0.o.d" -o ${OBJECTDIR}/source/ChrFont0.o source/ChrFont0.c   
	
${OBJECTDIR}/source/delay.o: source/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/delay.o.d 
	@${RM} ${OBJECTDIR}/source/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/source/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/delay.o.d" -o ${OBJECTDIR}/source/delay.o source/delay.c   
	
${OBJECTDIR}/source/FillPat.o: source/FillPat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/FillPat.o.d 
	@${RM} ${OBJECTDIR}/source/FillPat.o 
	@${FIXDEPS} "${OBJECTDIR}/source/FillPat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FillPat.o.d" -o ${OBJECTDIR}/source/FillPat.o source/FillPat.c   
	
${OBJECTDIR}/source/OledChar.o: source/OledChar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/OledChar.o.d 
	@${RM} ${OBJECTDIR}/source/OledChar.o 
	@${FIXDEPS} "${OBJECTDIR}/source/OledChar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/OledChar.o.d" -o ${OBJECTDIR}/source/OledChar.o source/OledChar.c   
	
${OBJECTDIR}/source/OledGrph.o: source/OledGrph.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/OledGrph.o.d 
	@${RM} ${OBJECTDIR}/source/OledGrph.o 
	@${FIXDEPS} "${OBJECTDIR}/source/OledGrph.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/OledGrph.o.d" -o ${OBJECTDIR}/source/OledGrph.o source/OledGrph.c   
	
${OBJECTDIR}/source/PmodOLED.o: source/PmodOLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/PmodOLED.o.d 
	@${RM} ${OBJECTDIR}/source/PmodOLED.o 
	@${FIXDEPS} "${OBJECTDIR}/source/PmodOLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/PmodOLED.o.d" -o ${OBJECTDIR}/source/PmodOLED.o source/PmodOLED.c   
	
${OBJECTDIR}/source/Vhyper_UART.o: source/Vhyper_UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/Vhyper_UART.o.d 
	@${RM} ${OBJECTDIR}/source/Vhyper_UART.o 
	@${FIXDEPS} "${OBJECTDIR}/source/Vhyper_UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/Vhyper_UART.o.d" -o ${OBJECTDIR}/source/Vhyper_UART.o source/Vhyper_UART.c   
	
${OBJECTDIR}/source/HelloVHyper.o: source/HelloVHyper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/HelloVHyper.o.d 
	@${RM} ${OBJECTDIR}/source/HelloVHyper.o 
	@${FIXDEPS} "${OBJECTDIR}/source/HelloVHyper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/HelloVHyper.o.d" -o ${OBJECTDIR}/source/HelloVHyper.o source/HelloVHyper.c   
	
else
${OBJECTDIR}/source/ChrFont0.o: source/ChrFont0.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/ChrFont0.o.d 
	@${RM} ${OBJECTDIR}/source/ChrFont0.o 
	@${FIXDEPS} "${OBJECTDIR}/source/ChrFont0.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/ChrFont0.o.d" -o ${OBJECTDIR}/source/ChrFont0.o source/ChrFont0.c   
	
${OBJECTDIR}/source/delay.o: source/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/delay.o.d 
	@${RM} ${OBJECTDIR}/source/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/source/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/delay.o.d" -o ${OBJECTDIR}/source/delay.o source/delay.c   
	
${OBJECTDIR}/source/FillPat.o: source/FillPat.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/FillPat.o.d 
	@${RM} ${OBJECTDIR}/source/FillPat.o 
	@${FIXDEPS} "${OBJECTDIR}/source/FillPat.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/FillPat.o.d" -o ${OBJECTDIR}/source/FillPat.o source/FillPat.c   
	
${OBJECTDIR}/source/OledChar.o: source/OledChar.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/OledChar.o.d 
	@${RM} ${OBJECTDIR}/source/OledChar.o 
	@${FIXDEPS} "${OBJECTDIR}/source/OledChar.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/OledChar.o.d" -o ${OBJECTDIR}/source/OledChar.o source/OledChar.c   
	
${OBJECTDIR}/source/OledGrph.o: source/OledGrph.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/OledGrph.o.d 
	@${RM} ${OBJECTDIR}/source/OledGrph.o 
	@${FIXDEPS} "${OBJECTDIR}/source/OledGrph.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/OledGrph.o.d" -o ${OBJECTDIR}/source/OledGrph.o source/OledGrph.c   
	
${OBJECTDIR}/source/PmodOLED.o: source/PmodOLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/PmodOLED.o.d 
	@${RM} ${OBJECTDIR}/source/PmodOLED.o 
	@${FIXDEPS} "${OBJECTDIR}/source/PmodOLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/PmodOLED.o.d" -o ${OBJECTDIR}/source/PmodOLED.o source/PmodOLED.c   
	
${OBJECTDIR}/source/Vhyper_UART.o: source/Vhyper_UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/Vhyper_UART.o.d 
	@${RM} ${OBJECTDIR}/source/Vhyper_UART.o 
	@${FIXDEPS} "${OBJECTDIR}/source/Vhyper_UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/Vhyper_UART.o.d" -o ${OBJECTDIR}/source/Vhyper_UART.o source/Vhyper_UART.c   
	
${OBJECTDIR}/source/HelloVHyper.o: source/HelloVHyper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/HelloVHyper.o.d 
	@${RM} ${OBJECTDIR}/source/HelloVHyper.o 
	@${FIXDEPS} "${OBJECTDIR}/source/HelloVHyper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/source/HelloVHyper.o.d" -o ${OBJECTDIR}/source/HelloVHyper.o source/HelloVHyper.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}           -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/HelloVHyper.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
